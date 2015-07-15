class AthletePlan < ActiveRecord::Base
  belongs_to :athlete
  belongs_to :plan
end
