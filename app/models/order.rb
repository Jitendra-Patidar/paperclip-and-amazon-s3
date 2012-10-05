class Order < ActiveRecord::Base
  attr_accessible :name, :price
  attr_accessible :image
  if Rails.env.production?
    has_attached_file :image,
		  :styles => { :thumb => ["110x110#", :jpg],:icon=> ["45x45#", :jpg] },
		  :url  => "attachment/:id/:style/:basename.:extension",
		  #:default_url => '/images/no_thumbnail_:style.png',
		  :storage => :s3,
		  #:s3_host_name => "cccccccc.s3-website-us-east-1.amazonaws.com",
		  :s3_credentials => "#{Rails.root}/config/s3.yml",
		  :path => ":attachment/:id/:style.:extension",
		  :bucket => 'ccccc'
	else
		   has_attached_file :image,
		  :styles => { :thumb => ["110x110#", :jpg],:icon=> ["45x45#", :jpg] }
		end  
end
