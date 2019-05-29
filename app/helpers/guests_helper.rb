module GuestsHelper
    def partner_from_list(event, partner_id)
        return event.inviter.partners.select { |p| p.id == partner_id.to_i }
    end
end
