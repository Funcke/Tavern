# frozen_string_literal: true

class UsersController < ApplicationController
  ##
  # Set the user with id provided by request route
  before_action :set_user, only: %i[show edit update destroy]

  ##
  # check if current user is authenticated or else redirect
  before_action :authorize, only: %i[show edit update destroy index create]

  ##
  # check if current user has admin role or else redirect
  before_action :check_authorization, only: %i[index new create destroy]

  ##
  # GET /users
  # Index displays a list of all users that belong to the
  # organization of the current user.
  #
  # Access: Admin
  def index
    @users = User.where(organization_id: organization.id)
  end

  ##
  # GET /users/1
  # GET /users/1.json
  # Returns the user specified by :id path parameter
  def show; end

  ##
  # GET /users/new
  # Returns a view for creating a new User.
  #
  # Access: Admin
  def new
    @user = User.new
  end

  ##
  # GET /users/:id/edit
  # Return a edit view for the user provided by the
  # :id path parameter.
  #
  # path: :id
  # Access: Registered User
  def edit; end

  ##
  # POST /users
  # POST /users.json
  # Create new User Entry for current organization.
  #
  # Access: Admin
  def create
    @user = User.new(user_params)
    organization.roles.find(params[:user][:role]).users << @user
    organization.users << @user
    respond_to do |format|
      if @user.save
        authenticate(@user)
        format.html do
          redirect_to @user,
                      notice: 'User was successfully created.'
        end
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # PATCH/PUT /users/:id
  # PATCH/PUT /users/:id.json
  # update user specified by :id
  #
  # Access: Registered User
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html do
          redirect_to @user,
                      notice: 'User was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # DELETE /users/:id
  # DELETE /users/:id.json
  # Delete user specified by :id
  #
  # Access: Admin
  def destroy
    log_out_user
    @user.destroy
    respond_to do |format|
      format.html do
        redirect_to users_url,
                    notice: 'User was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  ##
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(session[:user_id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def user_params
    params.require(:user).permit(
      :username,
      :firstname,
      :lastname,
      :gender,
      :email,
      :password,
      :password_confirmation
    )
  end
end
