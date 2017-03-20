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
         
   has_many :invites
   has_many :items
   has_many :listings
   has_many :events
end
