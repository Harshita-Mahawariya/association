class AccountHistory < ApplicationRecord
	belongs_to :account
	scope :credit_rating, ->{ where("credit_rating > 2")}
	scope :account_id, ->{ where("account_id > 7")}
	#scope :credit_rating, ->(rate) { where("credit_rating > ?", rate )}
	#default_scope { where(credit_rating > 4) }
end
