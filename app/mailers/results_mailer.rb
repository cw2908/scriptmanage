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
      files.to_a.each do |filename|
        case filename.class
        when File
          attachments[filename.path.split('/').last] = File.read(f.path)
        when String
          attachments[filename] = File.read(filename)
        end
      end
    end

    mail(to: email, subject: subject) do |format|
      format.html { render template}
    end
  end
end
