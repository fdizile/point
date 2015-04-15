class Computer < ActiveRecord::Base
	belongs_to :school


	before_save { 
		self.servicetag = servicetag.upcase
		if self.bpinumber.empty?
			self.bpinumber = "none"
		end 
		}
	VALID_REGEX = { acps: /\A\d{6}\z/, bpi: /\A\d{6}\z/, room: /\d{2}[-]\d{3}\z/ }
	validates :acpsnumber, presence: true, format: { with: VALID_REGEX[:acps] }, uniqueness: { case_sensitive: false }
	validate :bpinumber, format: { with: VALID_REGEX[:bpi] }, uniqueness: { case_sensitive: false }, allow_blank: true, :if => :should_validate_bpi?
	validates :servicetag, presence: true, uniqueness: { case_sensitive: false }

	def should_validate_bpi?
		self.bpinumber == "none" ? false : true
	end
end
