class Vote < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :candidate
  scope :valid,   -> { where(validity: "during") }
  scope :invalid, -> { where.not(validity: "during") }
  scope :on,      -> (campaign) { where(campaign: campaign) }
end
