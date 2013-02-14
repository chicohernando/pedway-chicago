class Article < ActiveRecord::Base
  belongs_to :location
  attr_accessible :body, :title

  validates :body, length: { in: 1..2500 }
  validates :title, length: { in: 1..40 }
end
