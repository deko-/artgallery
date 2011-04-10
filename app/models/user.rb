class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
	belongs_to :artist
	#has_many :artworks, :through => :artist
	has_many :comments#, :through => :artworks
	#has_many :user_roles
	#has_many :roles, :through => :user_roles
	
	# Facebook login
	def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
  	data = access_token['extra']['user_hash']
  	if user = User.find_by_email(data["email"])
	    user
	  else # Create a user with a stub password. 
  	  User.create!(:email => data["email"], :password => Devise.friendly_token[0,20]) 
  	end
	end 
	
end
