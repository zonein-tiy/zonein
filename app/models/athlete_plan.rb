class AthletePlan < ActiveRecord::Base
  belongs_to :athlete
  has_many :plans

end
