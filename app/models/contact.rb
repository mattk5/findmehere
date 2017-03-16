class Contact < ApplicationRecord
	validates :contact_name, presence: true, length: { maximum: 55 }
	validates :phone_number, presence: true,  length: { maximum: 14 }
	belongs_to :user, optional: true, inverse_of: :contacts
	validates_presence_of :user 
end
