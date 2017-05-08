class Comment < ApplicationRecord

	 attr_accessor :UserId,:MovieId,:description
     validates :description, :presence => true
	 belongs_to :user
end
