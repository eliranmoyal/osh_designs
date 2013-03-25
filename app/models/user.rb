class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable , :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :phone,:email,:name, :password, :password_confirmation, :remember_me , :provider , :uid
  
  #orders
has_many :orders, dependent: :destroy
  VALID_PHONE_REGEX =/((^05[0-9]-[0-9]{7}$)|(^0[1-9]-[0-9]{7}$)|(^05[0-9]{8}$)|(^0[1-9][0-9]{7}$))/
  validates :name, :presence => true

  validate :check_phone

  def check_phone
    if !(phone.blank? || phone.nil?) and !(self.phone =~ VALID_PHONE_REGEX)
      errors.add(:phone, "should look like valid phone number")
    end
  end


  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user 
      user = check_if_already_exists_and_update(auth)
      unless user
       user = User.create(name:auth.extra.raw_info.name,
         provider:auth.provider,
         uid:auth.uid,
         email:auth.info.email,
         password:""
         )
     end

   end
   user
 end



 def self.check_if_already_exists_and_update(auth)
   user = User.find_by_email(auth.info.email)
   if user
    user.update_attributes(provider:auth.provider , uid: auth.uid)
  end
  user
end

def password_required?
  provider.blank? && super
end

def update_with_password(params,*options)
  if encrypted_password.blank?
    update_attributes(params,*options)
  else
    super
  end
end




end
