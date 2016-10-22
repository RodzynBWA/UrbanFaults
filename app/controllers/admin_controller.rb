class AdminController < ApplicationController
  before_action :require_user
  before_action :is_admin?
  before_action :set_user
  
  def index
    
  end
  
  
  private
    def set_user
      @user = current_user.id
    end
end
