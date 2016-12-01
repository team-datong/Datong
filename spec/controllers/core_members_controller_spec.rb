require 'rails_helper'

RSpec.describe CoreMembersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit_multiple" do
    it "returns http success" do
      get :edit_multiple
      expect(response).to have_http_status(:success)
    end
    it "lists all users" do
      get :edit_multiple
      expect(assigns(:users)).to eq(User.all)
    end
  end

  describe "PUT #update_multiple" do
    before :each do
      @user1 = User.create(email: 'user1@datong.com', password: 'password')
      @user2 = User.create(email: 'user2@datong.com', password: 'passwordpassword')
    end
    it "assigns core_members" do
      put :update_multiple, :user_ids => [@user1.id]
      assigns(:core_members).should eq(["#{@user1.id}"])
      @user1.reload
      @user1.is_core_member.should be_truthy
      @user2.reload
      @user2.is_core_member.should be_falsey
    end
    it "correctly updates one user" do
      put :update_multiple, :user_ids => [@user1.id]
      @user1.reload
      @user1.is_core_member.should be_truthy
      @user2.reload
      @user2.is_core_member.should be_falsey
    end
    it "correctly updates unchecks" do
      put :update_multiple, :user_ids => [@user1.id]
      @user1.reload
      @user1.is_core_member.should be_truthy
      @user2.reload
      @user2.is_core_member.should be_falsey
      put :update_multiple, :user_ids => []
      @user1.reload
      @user1.is_core_member.should be_falsey
      @user2.reload
      @user2.is_core_member.should be_falsey
    end
    it "redirects to index" do
      put :update_multiple, :user_ids => [@user2.id]
      expect(response).to redirect_to(core_members_index_path)
    end
  end
end
