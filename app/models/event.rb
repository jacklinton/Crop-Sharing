class Event < ApplicationRecord
    attr_accessor :address
    
    has_many :items
    has_many :photos
    has_many :invites
    
    def address
        return params[:address]
    end
    
    geocoded_by :address, latitude: :lat, longitude: :lng   # can also be an IP address
    after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }          # auto-fetch coordinates
    
    reverse_geocoded_by :lat, :lng
    after_validation :reverse_geocode, unless: ->(obj) { obj.address.present? },
                 if: ->(obj){ obj.lat.present? and obj.lat_changed? and obj.lng.present? and obj.lng_changed? }
[...]  # auto-fetch address
    
    has_attached_file :picture,
    styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png",
        :storage => :s3,
        :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
        s3_region: ENV["AWS_REGION"]
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  def s3_credentials
    {:bucket => "railsblogbucket", :access_key_id => ENV["AWS_ACCESS_KEY_ID"], :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"]}
  end
end
