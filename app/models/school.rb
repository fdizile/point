class School < ActiveRecord::Base
	has_many :computers, dependent: :destroy
	has_many :users, dependent: :destroy

	before_save { self.abbreviation = abbreviation.upcase }
	validates :abbreviation, presence: true
	validates :code, presence: true
	validates :name, presence: true
	validates :phone, presence: true
	validates :address, presence: true
end