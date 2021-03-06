class User < ApplicationRecord
	attr_accessor :remember_token
	before_save { self.email = email.downcase }
	has_secure_password
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :name, presence: true, length: { maximum: 55 }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }, format: { with: EMAIL_REGEX }
	validates :password, presence: true, length: { minimum: 8 }
	has_many :contacts, inverse_of: :user
	accepts_nested_attributes_for :contacts, allow_destroy: true, reject_if: :all_blank

	def self.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost 
		BCrypt::Password.create(string, cost: cost)
	end

	def self.new_token
		SecureRandom.urlsafe_base64
	end	

	def remember 
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	def authenticate?(remember_token) 
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	def forget
		update_attribute(:remember_digest, nil)
	end
end
