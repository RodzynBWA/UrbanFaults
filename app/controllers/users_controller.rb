class UsersController < ApplicationController
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:show, :edit, :update, :destroy]
  before_action :redirect_logged_in, only: [:new]
  
  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to controller: :users, action: :show, id: @user.id, notice: 'User was successfully created.', locale: I18n.locale }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, alert: t('reg.bad_data')+@user.errors.full_messages }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def redirect_logged_in
    if logged_in?
      redirect_to root_path
    end
  end
  
  private
    def set_user
      @user = User.find(params[:id] || current_user.id)
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :city)
    end
end
