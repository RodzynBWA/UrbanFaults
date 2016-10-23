class UsersController < ApplicationController
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:show, :edit, :update, :destroy]
  before_action :redirect_logged_in, only: [:new]
  
  def autocomplete_city_cname
    ca = City.where("name LIKE '%#{params[:term]}%'").order(:name)
    render :json => ca.map { |city| {id: city.id, label: city.cname, value: city.cname} }
  end
  
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
    up = user_params
    @user = User.new(up)
    cn = params[:user][:city]
    if cn.length != 0
      c = City.where(name: cn.downcase).take
      if c == nil
        c = City.create(name: cn)
      end
      @user.city = c
    end
    respond_to do |format|
      if @user.save
        format.html { 
          session[:user_id] = @user.id
          redirect_to home_path, notice: t('.user_created') 
        }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, alert: t('reg.bad_data') + @user.errors.full_messages.join(" ") }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: t('.user_updated') }
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
      format.html { redirect_to users_url, notice: t('.user_removed') }
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
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
