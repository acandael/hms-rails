require 'rails_helper'

describe Admin::ThemesController do
  before do
    @theme = Theme.create!(theme_attributes)
  end

  context 'when not signed in' do
    before do
      session[:user_id] = nil
    end

    it 'cannot access index' do
      get :index

      expect(response).to redirect_to new_session_url
    end

    it "cannot access show" do
      get :show, id: @theme.id

      expect(response).to redirect_to(new_session_url)
    end

    it "cannot access new" do
      get :new

      expect(response).to redirect_to(new_session_url)
    end

    it "cannot access create" do
      post :create

      expect(response).to redirect_to(new_session_url)
    end

    it "cannot access edit" do
      get :edit, id: @theme.id

      expect(response).to redirect_to(new_session_url)
    end

    it "cannot acces update" do
      patch :update, id: @theme.id

      expect(response).to redirect_to(new_session_url)
    end

    it "cannot access destroy" do
      delete :destroy, id: @theme.id

      expect(response).to redirect_to(new_session_url)
    end
  end
end
