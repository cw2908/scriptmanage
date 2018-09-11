class ApplicationMailer < ActionMailer::Base
  
  default from: "api.scripts@samanage.com"
  layout 'mailer'
  add_template_helper(EmailHelper)
  
  def admin_approval(email: 'api.scripts@samanage.com', ccs: [], files: [], subject: '', template: 'new_user')
    subject = subject || "#{email} has been created an account in #{Rails.application.class.parent_name}"
    mail(to: email, subject: subject) do |format|
      format.html { render template}
    end
  end
end
