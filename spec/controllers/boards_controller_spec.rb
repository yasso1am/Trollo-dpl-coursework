require 'rails_helper'

RSpec.describe BoardsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns http success" do
      # get /boards/nothing
      board = Board.create(title: 'I am a new board')
      get :show, params: { id: board.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it 'returns http success' do
      board = Board.create(title: 'I am a new board')
      get :edit, params: {id: board.id}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new Board' do
        expect {
          post :create, params: {board: {title: 'I have a title'}}
        }.to change(Board, :count).by(1)
      end

      it 'redirects to the created board' do
        post :create, params: {board: {title: 'I have a title'}}
        expect(response).to redirect_to(Board.last)
      end
    end

    context 'with invalid params' do
      it 'does not create a new board' do
        expect {
          post :create, params: {board: {title: nil}}
        }.to change(Board, :count).by(0)
      end

      it 'displays the :new template again' do
        post :create, params: {board: {title: ''}}
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested board" do
      board = Board.create(title: 'I am a board')
      expect {
        delete :destroy, params: 
      }
    end
  end


end
