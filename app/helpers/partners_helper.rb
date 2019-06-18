module PartnersHelper
  def promoter_name(partner_id)
    partner = Partner.find_by(id: partner_id)
    unless partner.nil?
      partner.name
    else
      "Lista Geral"
    end
  end

  def guest_situation(attended)
    attended ? 'Presentes' : 'Não Compareceram'
  end
end
