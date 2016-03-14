class Campaign < ActiveRecord::Base
  has_many :votes
  has_many :candidates, through: :votes
end
