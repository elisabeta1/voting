class Candidate < ActiveRecord::Base
  has_many :votes
  has_many :campaigns, through: :votes
end
