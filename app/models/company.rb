# R E S E T - T H E - C L A S S
class Company < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :state, presence: true
  has_many :employees, dependent: :destroy

  #scope :workers_in, ->(state) {where("state = ?", state)}
  scope :workers_in, ->(state) {includes(:employees).where("state = ?", state)}

  def to_s
    name
  end

  #private
  #after_create :expire_cache
  #def expire_cache
  #  ActionController::Base.new.expire_fragment('table_of_all_companies') # 1
  #end

end
