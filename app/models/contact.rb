class Contact < ApplicationRecord
	validates :name, presence: true, length: { maximum: 55 }
	validates :phone_number, presence: true,  length: { maximum: 14 }
	belongs_to :user
end
