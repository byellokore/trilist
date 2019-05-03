class GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :edit, :update, :destroy]
  before_action :set_list, only: [:new_to_list]
  before_action :authenticate_inviter!, only:[:index, :show, :edit, :update, :destroy]
  #prepend_before_action :check_captcha, only:[:create] # Change this to be any actions you want to protect.
  # GET /guests
  # GET /guests.json
  def index
    @guests = Guest.all
  end

  # GET /guests/1
  # GET /guests/1.json
  def show
  end

  # GET /guests/new
  def new
    @guest = Guest.new
  end
  # GET /guests/new_to_list
  def new_to_list
    @guest = Guest.new
    @event
  end

  # GET /guests/1/edit
  def edit
  end

  # POST /guests
  # POST /guests.json
  def create
    @guest = Guest.new(guest_params)
    seo_url = Event.where(id: @guest.event_id).pluck(:seo_url)
    @event = Event.includes(inviter: [:partners]).find_by(seo_url: seo_url)
    respond_to do |format|
      if verify_recaptcha(model: @guest) && @guest.save
        flash[:notice] = "#{@guest.name} você esta na lista!"
        format.html { redirect_to "/add_guest/#{seo_url.first}" }
        format.json { render :show, status: :created, location: @guest }
      else
        seo_url = Event.where(id: @guest.event_id).pluck(:seo_url)
        format.html { render :new_to_list }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  def insert_list
    @guest = Guest.new(guest_params)

    respond_to do |format|
      if @guest.save
        format.html { redirect_to @guest, notice: 'Guest was successfully created.' }
        format.json { render :show, status: :created, location: @guest }
      else
        format.html { render :new }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guests/1
  # PATCH/PUT /guests/1.json
  def update
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to @guest, notice: 'Guest was successfully updated.' }
        format.json { render :show, status: :ok, location: @guest }
      else
        format.html { render :edit }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
    @guest.destroy
    respond_to do |format|
      format.html { redirect_to guests_url, notice: 'Guest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guest.find(params[:id])
    end

    def set_list
      @event = Event.includes(inviter: [:partners]).find_by(seo_url: params[:seo_url])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params.require(:guest).permit(:seo_url,
                                    :name,
                                    :email,
                                    :cellphone,
                                    :birthday,
                                    :location,
                                    :confirmation_token,
                                    :confirmed_at,
                                    :event_id,
                                    :partner_id,
                                    :surname)
    end
end
