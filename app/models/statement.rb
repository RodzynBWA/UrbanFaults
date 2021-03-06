class Statement < ActiveRecord::Base
  belongs_to :user
  belongs_to :report
  
  validates :user, presence: true, uniqueness: false
  validates :report, presence: true, uniqueness: false
  validates :state, presence: true, uniqueness: false
end
