# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'gabrielfontoura@icloud.com'
  layout 'mailer'
end
