require 'rails_helper'

RSpec.describe Article, type: :model do
 #current_user = 
 it "has a title" do
 	article = Article.new(
 		title:"",
 		body:"A valid body",
 		author:"A valid author")
 	expect(article).to_not be_valid
 	article.title = "Has a title"
 	expect(article).to be_valid
 end

 it "has a body length minimun 10" do
 	 	article = Article.new(
 		title:"A valid title",
 		body:"invalid",
 		author:"A valid author")
 	expect(article).to_not be_valid
 	article.body = "Has a body"
 	expect(article).to be_valid
 end

 it "has a author min 3" do
 	 	 	article = Article.new(
 		title:"A valid title",
 		body:"A valid body",
 		author:"a")
 	expect(article).to_not be_valid
 	article.author = "Has a author"
 	expect(article).to be_valid
 end
end
