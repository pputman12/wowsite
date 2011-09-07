class Guild < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :name, :faction, :realm

  attr_accessor :password
  before_save :encrypt_password
  belongs_to :user
  belongs_to :guild
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  has_many :characters
  has_many :topics
  

  def self.authenticate(email, password)
    guild = find_by_email(email)
    if guild && guild.password_hash == BCrypt::Engine.hash_secret(password, guild.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
