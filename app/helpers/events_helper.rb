module EventsHelper
  def partner_name(event, guest)
    partner = event.inviter.partners.select { |p| p.id == guest.partner_id }
    partner[0][:name]
  end
end
