class Comment < ApplicationRecord

	 attr_accessible :UserId,:MovieId,:description
     validates :description, :presence => true
	 belongs_to :user
end
