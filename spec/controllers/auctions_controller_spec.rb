require 'rails_helper'

RSpec.describe AuctionsController, :type => :controller do

  describe '#index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe '#new' do
    context 'user not signed in' do
      it 'redirects to sign in page' do
        get :new
        expect(response).to redirect_to(new_session_path)
      end
    end
    context 'user signed in' do
      before do
        user = FactoryGirl.create(:user)
        request.session[:user_id] = user.id
        get :new
      end
      it 'renders new template' do
        expect(response).to render_template(:new)
      end
    end
  end

  describe '#create' do
    context 'user signed in' do
      before do
        user = FactoryGirl.create(:user)
        request.session[:user_id] = user.id
        get :new
      end
      context 'with a valid parameters' do
        it 'creates a new auction in database' do
          count_before = Auction.count
          post :create, params: { auction:FactoryGirl.attributes_for(:auction)}
          count_after = Auction.count
          expect(count_after).to eq(count_before + 1)
        end
      end
    end
  end

end
