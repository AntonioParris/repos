class Article < ApplicationRecord
	has_many :reviews

	validates :title, presence: true
	validates :body, presence: true, length: { minimum: 10 }
	validates :author, presence: true, length: { minimum: 3 }
end
