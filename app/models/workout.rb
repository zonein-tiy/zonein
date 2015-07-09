class Workout < ActiveRecord::Base
  serialize :steps

  validates :creator_id, presence: true
  
  has_many :plan_workouts
  has_many :plans, through: :plan_workouts

  has_many :athlete_workouts
  has_many :athletes, through: :athlete_workouts


  belongs_to :athlete_workout
  belongs_to :plan_workout 

  belongs_to :creator, class_name: 'Athlete'


end
