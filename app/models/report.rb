class Report < ActiveRecord::Base
  belongs_to :report_category
  belongs_to :user
  belongs_to :city
  has_one :statement
  
  mount_uploader :report_image, ReportImage
  before_validation :check_state
  
  $States = ["New", "Doing", "Done", "Canceled"]
  
  def check_state
    if self.state == nil || $States.include?(self.state)
      self.state = $States[0]
    end
  end
  
  scope :_new, -> { where(state: $States[0]) }
  scope :_doing, -> { where(state: $States[1]) }
  scope :_done, -> { where(state: $States[2]) }
  scope :_canceled, -> { where(state: $States[3]) }
  
  def set_state_as_new
    self.update_attribute state, $States[0]
  end
  
  def set_state_as_doing
    self.update_attribute state, $States[1]
  end
  
  def set_state_as_done
   self.update_attribute state, $States[2]
  end
  
  def set_state_as_canceled
    self.update_attribute state, $States[3]
  end
  
  validates :title, presence: true, uniqueness: false
  validates :street, presence: true, uniqueness: false
  validates :house, presence: false, uniqueness: false
  validates :short_place_desc, presence: false, uniqueness: false
  validates :descr, presence: true, uniqueness: false
  validates :state, presence: true, uniqueness: false
  validates :report_image, presence: false, uniqueness: false
  validates :ip, presence: true, uniqueness: false
  
  validates :city, presence: true, uniqueness: false
  validates :user, presence: true, uniqueness: false
  validates :report_category, presence: true, uniqueness: false
end
