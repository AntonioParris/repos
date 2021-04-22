class Article < ApplicationRecord
	has_many :reviews, :dependent => :delete_all

	validates :title, presence: true
	validates :body, presence: true, length: { minimum: 10 }
	validates :author, presence: true, length: { minimum: 3 }
end
