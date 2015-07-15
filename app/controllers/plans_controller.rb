class PlansController < ApplicationController
before_action :authenticate_with_token!

def index
  @plans = Plan.joins(:plan_workouts)
  render 'index.json.jbuilder', status: :created
end

def index_creator
  @plans = Plan.joins(:athlete_plans).
    where("athlete_plans.athlete_id" => current_athlete.id,
          "athlete_plans.completion" => false,
          "plans.creator_id" => current_athlete.id)
 render 'index_creator.json.jbuilder', status: :created
end

# def index_active
#   @plans = AthletePlan.where("athlete_id = ? && completion = ?", current_athlete.id, false)
#   render 'index_active.json.jbuilder', status: :created
# end

# def index_other
#   username = params[:username]
#   @athlete = Athlete.find_by!(username: username)
#   @athleteplans = AthletePlan.where(athlete_id: @athlete.id)
#   planids = athleteplans.pluck(:id)
#   @plans = 


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
  # binding.pry
  # workout_array = params[:workout_array].split(",").map(&:to_i)
  workout_array = params[:workout_array]
  # workout_array = receive_ary(workout_array)
  @plan = Plan.find(params[:plan_id])
  workout_array.map {|w| w.to_i}
  workout_array.each do |w|
    PlanWorkout.create(plan_id: @plan.id, workout_id: w)
    # binding.pry
  end
  # @athlete = plan_workouts.first
  # binding.pry
  render 'add_workout.json.jbuilder', status: :created
end


def update_completion

  # status = params[:completion]

  @athlete_plan = AthletePlan.find_by("athlete_id = ? AND plan_id = ?", current_athlete.id, params[:plan_id])

  if current_athlete.id == @athlete_plan.plan.creator_id
    @athlete_plan.completion = true
      # @athlete_plan.update_attribute(:completion, status)
    render plain: "Updated. Plan status changed to 'completed'.", status: :updated
      # render json 'update_completion.json.jbuilder', status: :updated
  else
    render json: { message: "You are not authorized to update this plan status." },status: :unauthorized
  end
end


 end