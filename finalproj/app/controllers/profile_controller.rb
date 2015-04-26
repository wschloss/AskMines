class ProfileController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :delete]

  # GET /profile/1
  def show
    
  end

  # GET /profile/username/edit
  def edit
  end

  def index
    @users = User.all.order(:reputation).reverse
  end

  # POST /profile/username
  def update
      if @user.update(user_params)
        redirect_to user_profile_path(@user), notice: "Updated profile successfully"
      end
  end

  #DELETE /profile/1/delete
  def delete
    #put delete code here
    @user.destroy
    redirect_to profile_list_url, notice: "Deleted user successfully"
  end

  private
    def set_profile
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:signature, :avatar)
    end
end
