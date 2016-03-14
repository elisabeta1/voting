require 'spec_helper'

describe "Campaign" do
  context "Index" do
    before do
      # create campaigns and stuff
    end

    it "Lists all existing Campaigns" do
      visit campaigns_path
      #  ...
      # expect the campaigns to be there with whatever info (name etc)
    end
  end

  context "Show" do
    let(:campaign) { # create 1 campaign }

    before do
      # not sure if you need this
    end

    it "Lists all existing Campaigns" do
      visit campaign_path(campaign)
      #  ...
      # expect the campaign to be there with whatever info (candidates votes etc)
    end
  end
end