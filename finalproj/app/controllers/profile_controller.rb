class ProfileController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]

  # User authentication to change questions
  #before_action :authenticate_user!

  # GET /profile/username
  def show
    # Blank answer object so a user can submit an answer
  end

  # GET /profile/username/edit
  def edit
  end

  def index
    @users = User.all
  end
  # PATCH/PUT /profile/username
  def update
      @user.signature = params[:signature].to_s
      @user.avatar = params[:upload]

      if @user.save
        redirect_to :controller=>'profile', :action => 'show', :username => @user.username
      end


  end

  private
    def set_profile
      @user = User.find_by username: params[:username].to_s
    end


end
