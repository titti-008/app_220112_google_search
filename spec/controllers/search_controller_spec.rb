require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  context "GET #home" do
    before do
      get :home
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

  end

  context "GET #show" do
    before do
      get :show, params: {search_word: "チェンソーマン", start_index: 1}
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

end
