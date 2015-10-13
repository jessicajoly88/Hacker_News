class Comment < ActiveRecord::Base
  belongs_to :post
  validates :description, :presence => true
  validates :author, :presence => true
end
