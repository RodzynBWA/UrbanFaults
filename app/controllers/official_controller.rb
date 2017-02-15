class OfficialController < ApplicationController
  
  def index
    
  end
  
  def new_statement
    
  end
  
  def reports
    
  end
  
  private
    def set_user
      @user = current_user.id
    end
end
