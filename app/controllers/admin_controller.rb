class AdminController < ApplicationController
  before_action :require_user
  before_action :require_admin
  before_action :set_user
  
  def users
    @user = User.all
  end
  
  def reports
    
  end
  
  private
    def set_user
      @user = current_user.id
    end
end
