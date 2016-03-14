require 'rails_helper'

describe "Campaign" do
  context "Index" do
    let!(:campaign) { Campaign.create(name: "test") }

    it "Lists all existing Campaigns" do
      visit campaigns_url

      expect(page).to have_content "test"
    end
  end

  context "Show" do
    let!(:campaign1)  { Campaign.create(name: "Testing Camaping") }
    let!(:candidate1) { Candidate.create(name: "Hugo") }
    let!(:candidate2) { Candidate.create(name: "Anna") }
    let!(:vote)       { Vote.create(candidate: candidate1, campaign: campaign1, validity: 'during') }
    let!(:vote1)      { Vote.create(candidate: candidate1, campaign: campaign1, validity: 'during') }
    let!(:vote2)      { Vote.create(candidate: candidate2, campaign: campaign1, validity: 'during') }
    let!(:vote3)      { Vote.create(candidate: candidate2, campaign: campaign1, validity: 'pre') }
    
    it "Visit a Campaign" do
      visit campaign_url(campaign1)
    end

     it "Show the candidates for this campaign" do
      visit campaign_url(campaign1.id)
      expect(page).to have_content "Anna"
      expect(page).to have_content "Hugo"
    end

    it "Show the candidates scores valid and invalid for this campaign" do
      visit campaign_url(campaign1.id)

      expect(candidate1.votes.on(campaign1).valid.count).to eq(2)
      expect(candidate2.votes.on(campaign1).valid.count).to eq(1)
      expect(candidate1.votes.on(campaign1).invalid.count).to eq(0)
      expect(candidate2.votes.on(campaign1).invalid.count).to eq(1)

    end
  end
end
