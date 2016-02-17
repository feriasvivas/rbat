require 'rails_helper'

RSpec.describe IncidentsHelper, type: :helper do
  context "convert number to Sim, Não or NA" do
    it "translates 1 to Sim" do
      expect(helper.yesNoNA2text(1)).to eq("Sim")
    end
    it "translates 2 to Não" do
      expect(helper.yesNoNA2text(2)).to eq("Não")
    end
    it "translates 0 to NA" do
      expect(helper.yesNoNA2text(0)).to eq("NA")
    end
    it "translates nil to NA" do
      expect(helper.yesNoNA2text(nil)).to eq("NA")
    end
  end
end
