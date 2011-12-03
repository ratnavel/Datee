class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  
  acts_as_mappable
  
  attr_protected  :is_admin
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :dob, :address1, :address2, :zip, :city, :state, :country, :email, :password, :password_confirmation, :remember_me
  attr_accessor   :email_confirmation, :old_password
  
  validates_presence_of :first_name, :last_name, :email
  validates_presence_of :address1, :zip, :city, :state, :country
  validates_presence_of :dob
  
#  has_attached_file :profilepic, 
#    :default_url => 'http://static.datee.com/profilepics/missing.png',
#    :styles => { :profile => "201x244#", :thumb => "120x140#" },
#    :storage => :s3,
#    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
#    :url => ":s3_alias_url", 
#    :s3_host_alias => 'static.datee.com',
#    :path => ":attachment/:id/:style/:basename.:extension",
#    :bucket => 'static.datee.com'
#  
#  validates_attachment_size :profilepic, :less_than => 2.megabytes, :if => Proc.new { |imports| !imports.profilepic_file_name.blank? }  
#  validates_attachment_content_type :profilepic, :content_type => ['image/gif', 'image/jpg','image/jpeg', 'image/png' ], :if => Proc.new { |imports| !imports.profilepic_file_name.blank? }
#    
  ajaxful_rater
    
  before_validation :geocode_address
  before_save :sanitize_data
  
  def validate
    if dob
      if dob > (Date.today - 18.years) 
        errors.add(:dob, " should be 18 years or older")
      end
    end
  end
  
  def full_name
    @full_name ||= "#{first_name} #{last_name}"
  end
  
  def firstlast
    name
  end
  
  def email_with_name
    "#{first_name} #{last_name} - #{email}"
  end
  
  def name
    if self.is_admin
      @name ||= "Datee"
    else
      @name ||= "#{first_name} #{last_name.first}."
    end
  end  
  
  def coords
    @coords ||= [lat, lng]
  end
  
  def age
    birthday = Date.parse(dob)
    now = Time.now.utc.to_date
    now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  end
    
  def embeddable_youtube_url
     url = URI.parse(self.youtube_url)
     query  = url.query
     query_params = url.query.inject({}) {|hsh,i| sides=i.split("="); hsh[sides[0]]=sides[1]; hsh}
     "http://youtube.com/v/#{query_params["v"]}"
  end
  
  def location
   "#{city},#{state} #{zip}"
  end
  
private

  def geocode_address
    geo = Geokit::Geocoders::MultiGeocoder.geocode(self.zip)
    errors.add(:address1, "Could not Geocode address") if !geo.success
    self.lat, self.lng = geo.lat,geo.lng if geo.success
  end

  def sanitize_data
  end
  
end
