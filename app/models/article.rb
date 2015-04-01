class Article < ActiveRecord::Base
	has_attached_file :photo,
          :url => "/image/:basename.:extension",  
          :path => ":rails_root/public/image/:basename.:extension" 

    validates_attachment_presence :photo  
    validates_attachment_size :photo, :less_than => 2.megabytes
    validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
