require 'rails_helper'

RSpec.describe "System test of Search", type: :system do


  before do
    visit root_path
  end

  
  it "have content 'home'" do
    expect(page).to have_content 'home'
  end

  context "when search blank form" do
    it "display '検索する文字を入力してください'" do
      fill_in "search_word", with: ""
      click_button "検索"
      expect(page).to have_content "検索する文字を入力してください"
      
    end
  end
  
  context "when search valid word" do
    before do
      fill_in "search_word", with: "チェンソーマン"
      click_button "検索"
    end


    it "display '検索する文字を入力してください'" do
      expect(page).to have_content "「 チェンソーマン 」の検索結果"
    end

    it "display first page No." do
      expect(page).to have_content "1 ページ目"
    end

    context "when push 'Geegle検索'" do
      before do
        click_on "Geegle検索"
      end

      it "return to #home" do
        expect(page).to have_content 'home'
      end
      
    end
    
  end

end