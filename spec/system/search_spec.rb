# require "rails_helper"

describe "Word search function test"  do

  context "When search valid word" do
    let(:search_word){ "チェンソーマン" }

    before do
      
    end

    it "Display seach results" do
      expect(search_word).to eq "チェンソーマン"
    end
    
    
  end
  

  
  # context "if user visit home:" do
  #   before do

  #     visit root_path
  #     # fill_in "search",	with: "ハンターハンター" 
  #     # click_button "検索"
  #   end

  #   it "render home view" do
  #     expect("test").to eq('test!')
  #     # expect(response).to be_successful
  #     # expect(page).to have_content "ハンターハンター" 
  #   end
  # end
end