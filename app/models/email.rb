class Email < ActiveRecord::Base
  attr_accessible :body, :from, :subject, :to, :image_thumb, :image_full
  
  def self.receive_mail(message)
    ts      = Time.now.utc.iso8601.gsub(/\W/, '')
    user    = message.from.first.gsub(/\W/, '')
    fn      = "public/files_from_emails/#{ts}_#{user}_#{message.attachments[0].filename}"    
    fnsmall = "public/files_from_emails/#{ts}_#{user}_small_#{message.attachments[0].filename}"    
    File.open( fn, "w+b", 0644) { |f| f.write message.attachments[0].body.decoded }
    small = MiniMagick::Image.open(fn)
    small.resize "100x100"
    small.write fnsmall

    # sort out message
    msg = message.multipart? ? message.text_part.body.to_s : message.body.decoded
    # save in db
    Email.create! subject: message.subject, body: msg, from: message.from.first, image_thumb: fnsmall, image_full: fn
  end
end
