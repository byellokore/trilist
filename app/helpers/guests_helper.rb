module GuestsHelper
    def partner_from_list(event, partner_id)
        event.inviter.partners.select { |p| p.id == partner_id }
    end
end
