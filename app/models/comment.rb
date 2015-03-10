class Comment < ActiveRecord::Base

  validates_presence_of :name, :comment
  belongs_to :post 

end
