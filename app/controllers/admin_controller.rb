class AdminController < ApplicationController
  before_action :require_user
  before_action :require_admin
  before_action :set_user, only: [:users, :reports]
  layout false, only: [:ban_user]
  
  def users
    @users = User.all
  end
  
  def reports
    @statement = Statement.new
  end
  
  def ban_user
    #byebug
    user_id = params[:id]
    @err = ''
    if user_id == nil
      @err = 'no id'
       respond_to do |format|
          format.js
        end
    end
    user_id = user_id.to_i unless user_id.is_a? Integer
    @user_to_ban = User.find user_id
    if @user_to_ban == nil
      @err = 'Wrong id: ' + user_id
      respond_to do |format|
        format.js
      end
    end
    respond_to do |format|
      format.js
    end
    
  end
  
  def new_statement
  
  end
  
  private
    def set_user
      @user = current_user.id
    end
end
