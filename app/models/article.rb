class Article < ApplicationRecord
	belongs_to :user

	def self.new_article
	end
end
