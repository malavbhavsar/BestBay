class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  attr_accessible :admin, :as => :admin
  # attr_accessible :title, :body

  has_many :wishlists
  has_many :xitems, :class_name => 'Item'

  has_many :bids
  has_many :items, :through => :bids

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      user = User.create(
                         email: data["email"],
                         password: Devise.friendly_token[0,20]
      )
    end
    user
  end
end
