class Report < ActiveRecord::Base
  belongs_to :report_category
  belongs_to :user
  
  validates :title, presence: true, uniqueness: false
  validates :street, presence: true, uniqueness: false
  validates :house, presence: false, uniqueness: false
  validates :short_place_desc, presence: false, uniqueness: false
  validates :desc, presence: true, uniqueness: false
  validates :image, presence: false, uniqueness: false
  validates :ip, presence: true, uniqueness: false
  validates :user, presence: true, uniqueness: false
  validates :report_category, presence: true, uniqueness: false
end
