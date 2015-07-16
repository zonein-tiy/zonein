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
  @plan = Plan.new(name: params[:name], description: params[:description], creator_id: current_athlete.id, plan_creator: current_athlete.username)

  if @plan.save
    @athleteplan = AthletePlan.create(athlete_id: current_athlete.id, plan_id: @plan.id, start_date: params[:start_date], end_date: params[:end_date])
    render 'create.json.jbuilder', status: :created
  else
    render json: { errors: @athlete.errors.full_messages }, status: :unprocessable_entity
  end
end


# def add_workout
#   workout_array = params[:workout_array]

#   @plan = Plan.find(params[:plan_id])
#   workout_array.map {|w| w.to_i}
#   workout_array.each do |w|
#     PlanWorkout.create(plan_id: @plan.id, workout_id: w)
#   end
#   render 'add_workout.json.jbuilder', status: :created
# end

def add_workout
  workout_array = params[:workouts]
  @athlete_workout =[]
  @plan_workout =[]
  @plan = Plan.find(params[:plan_id])
  workout_array.each do |w|
    @plan_workout << PlanWorkout.create(plan_id: @plan.id, workout_id: w[:workout_id])
    w[:workout_dates].each do |dodate|
        @athlete_workout << AthleteWorkout.create(athlete_id: current_athlete.id, workout_id: w[:workout_id], do_date: dodate)
    end
   end
   # binding.pry
   render 'add_workout.json.jbuilder', status: :created
end
#         { plan_id: 9,

#           workouts: [{
#             workout_id: 2,
#             workout_dates: ["2015-07-15-0000T", "2015-07-15-0000T", "2015-07-15-0000T"]
#           },
#           {
#             workout_id: 5,
#             workout_dates: ["2015-07-15-0000T", "2015-07-15-0000T", "2015-07-15-0000T"]
#           },
#           {
#             workout_id: 7,
#             workout_dates: ["2015-07-15-0000T", "2015-07-15-0000T", "2015-07-15-0000T"]
#           },
#           {
#             workout_id: 9,
#             workout_dates: ["2015-07-15-0000T", "2015-07-15-0000T", "2015-07-15-0000T"]
#           }];
#         }

def update_completion
  plan_id = params[:id]
  @athlete_plan = AthletePlan.find_by("athlete_id = ? AND plan_id = ?", current_athlete.id, plan_id)
  @athlete_plan.update(completion: true)

  render 'update_completion.json.jbuilder', status: :created
end

# def update_workout_completion
#   planid = params[:plan_id]
#   workoutid = params[:workout_id]
#   @athlete_plan = AthletePlan.find_by("athlete_id = ? AND plan_id = ?", current_athlete.id, planid)
#   @athlete_workout = AthleteWorkout.find_by("athlete_id = ? AND workout_id = ?", current_athlete, workoutid)

#   @athlete_plan.update(completion: true)

#   render 'update_completion.json.jbuilder', status: :created
# end
  
  # plan_id = params[:id]
  # athlete_plan = AthletePlan.find_by("athlete_id = ? AND plan_id = ?", current_athlete.id, plan_id)
  # AthletePlan.where(athlete_id: athlete_plan.athlete_id, plan_id: athlete_plan.plan_id).update_all(completion: true)
  # @athlete_plan = AthletePlan.find_by("athlete_id = ? AND plan_id = ?", current_athlete.id, plan_id)
    # @athlete_plan.update
      # @athlete_plan.update_attribute(:completion, status)

 end