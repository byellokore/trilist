class ExampleJob < ApplicationJob
  queue_as :default

  def perform(user_params)
    @user = User.new(user_params)
    if @user.save
      puts "vaca"
    else
      @user.errors.each do |row|
        puts row.to_s
      end
    end
  end
end
