class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show]

  def index
    @campaigns = Campaign.all
  end

  def show
    @candidates = @campaign.candidates.uniq.map do |candidate|
      valid   = candidate.votes.on(@campaign).valid.count
      invalid = candidate.votes.on(@campaign).invalid.count

      { name: candidate.name, valid_count: valid, invalid_count: invalid }
     end
  end

  private
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    def campaign_params
      params.require(:campaign).permit(:name)
    end
end
