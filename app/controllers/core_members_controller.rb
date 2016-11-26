class CoreMembersController < ApplicationController
  include CoreMembersHelper
  def index
    @core_members = User.all
  end

  def edit_multiple
    @users = User.all
  end

  def update_multiple
    @core_members = params[:user_ids]
    reset_is_core_member
    if !@core_members.nil? && !@core_members.empty?
      set_is_core_member(@core_members)
    end
    redirect_to core_members_index_path
  end
end