class PlansController < ApplicationController

def create
  @plan = Plan.new(name: params[:name], description: params[:description], creator_id: current_athlete.id)

  if @plan.save
    @athleteplan = AthletePlan.create(athlete_id: current_athlete.id, plan_id: @plan.id, start_date: params[:start_date], end_date: params[:end_date])
    render 'create.json.jbuilder', status: :created
  else
    render json: { errors: @athlete.errors.full_messages }, status: :unprocessable_entity
  end
end

def add_workout
  workout_array = params[:workout_array].split(",").map(&:to_i)
  @plan_id = params[:plan_id]
  workout_array.each do |w|
    PlanWorkout.create(plan_id: @plan_id, workout_id: w)
    # binding.pry
  end
  @planworkouts = PlanWorkout.where(plan_id: @plan_id)

  
  render 'add_workout.json.jbuilder', status: :created
end
end

# def update
# \  
#   plan = @Plan.find_by(params[:plan_id]
#   @PlanWorkout.create(plan_id: plan, workout_id: params[:workout_id], start_date params[:start_date], end_date params[:end_date])
#   AthletePlan.create(athlete_id: current_athlete, plan_id: plan)
#   @plan = Plan.find(:id)
#   @workout = Workout.find(:id)
#   @athlete = current_athlete
#   @plan.@workout.cr
# end