class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
    attr_accessor :address
    
    geocoded_by :address, latitude: :lat, longitude: :lng   # can also be an IP address
    after_validation :geocode        # auto-fetch coordinates
    
    reverse_geocoded_by :lat, :lng
    after_validation :reverse_geocode
    
    acts_as_mappable
    
    acts_as_messageable
    
    def mailboxer_name
      self.username
    end

    def mailboxer_email(object)
      self.email
    end
    
    has_attached_file :avatar,
    styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" },
    default_url: "assets/images/shatner.jpg",
        :storage => :s3,
        :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
        s3_region: ENV["AWS_REGION"]
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def s3_credentials
    {:bucket => "railsblogbucket", :access_key_id => ENV["AWS_ACCESS_KEY_ID"], :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"]}
  end
         
   has_many :invites
   has_many :items
   has_many :listings
   has_many :events
end
