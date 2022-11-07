class Book < ApplicationRecord
	belongs_to :author
	#scope :id, -> {id.where(author_id :3}
end
