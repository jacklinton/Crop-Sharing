class Event < ApplicationRecord
    attr_accessor :address
    
    belongs_to :user
    has_many :items
    has_many :photos
    has_many :invites
    
    geocoded_by :address, latitude: :lat, longitude: :lng   # can also be an IP address
    after_validation :geocode         # auto-fetch coordinates
    
    reverse_geocoded_by :lat, :lng
    after_validation :reverse_geocode
    
    has_attached_file :photo,
    styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png",
        :storage => :s3,
        :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
        s3_region: ENV["AWS_REGION"]
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  def s3_credentials
    {:bucket => "railsblogbucket", :access_key_id => ENV["AWS_ACCESS_KEY_ID"], :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"]}
  end
end
