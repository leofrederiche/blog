class Post < ActiveRecord::Base
  
  validates_presence_of :title, :text
  has_many :comments, class_name: Comment, foreign_key: :id_post

end
