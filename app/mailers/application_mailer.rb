class ApplicationMailer < ActionMailer::Base
  default from: "api.scripts@samanage.com"
  layout 'mailer'
  add_template_helper(EmailHelper)
end
