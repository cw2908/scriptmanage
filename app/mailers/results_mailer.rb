class ResultsMailer < ApplicationMailer
  default from: 'noreply@samanage.com',
					bcc: 'chris.walls@samanage.com',
					reply_to: 'noreply@samanage.com'
  def notify_user(email: '', ccs: [], files: [], subject: , template: 'default_template')
    puts "Sending #{template} email to #{email}"
    puts "Subject: #{subject}"
    puts "Files: #{files}"
    puts "CCs #{ccs}"

    # Send attachments
    if files.respond_to?(:to_a)
      files.to_a.each do |file|
        if file.class == File
          attachments[file.path.split('/').last] = File.read(f.path)
        end
      end
    end

    mail(to: email, subject: subject) do |format|
      format.html { render template}
    end
  end
end
