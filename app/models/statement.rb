class Statement < ActiveRecord::Base
  belongs_to :user
  belongs_to :department
  belongs_to :report
end
