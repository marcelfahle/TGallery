class Email < ActiveRecord::Base
  attr_accessible :body, :from, :subject, :to, :image_thumb, :image_full, :download_link
  
  def self.receive_mail(message)
    ts      = Time.now.utc.iso8601.gsub(/\W/, '')
    user    = message.from.first.gsub(/\W/, '')
    if message.attachments.any?
      content_type = message.attachments[0].content_type.to_s
      fn      = "uploads/files_from_emails/#{ts}_#{user}_#{message.attachments[0].filename}"    
      fnsmall = "uploads/files_from_emails/#{ts}_#{user}_small_#{message.attachments[0].filename}"    
      File.open( "public/#{fn}", "w+b", 0644) { |f| f.write message.attachments[0].body.decoded }
      if content_type.index('image/png') || content_type.index('image/jpeg') || content_type.index('image/gif')
        small = MiniMagick::Image.open("public/#{fn}")
        small.resize "100x100"
        small.write "public/#{fnsmall}"
      else
        fn = ""
        fnsmall = ""
      end
    else
      fn = ""
      fnsmall = ""
    end
    dllink = fn

    # sort out message
    if message.multipart?
      charset = message.text_part.content_type_parameters[:charset]
      msg = message.text_part.body.to_s.force_encoding("UTF-8")
    else
      charset = message.content_type_parameters[:charset]
      msg = message.body.decoded.force_encoding("UTF-8")
    end
    # save in db
    #unless message.subject[0,3].downcase == "re:"
    Email.create! subject: message.subject, body: msg, from: message.from.first, image_thumb: fnsmall, image_full: fn, download_link: dllink
    #end
  end
end
