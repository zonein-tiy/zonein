class PlansController < ApplicationController
  before_action :authenticate_with_token!

  # Queries for ALL plans CREATED by EVERYBOBY
  def index
    @plans = Plan.joins(:plan_workouts)
    render 'index.json.jbuilder', status: :created
  end

  # Queries for ALL plans CREATED by the SIGNED-IN Athlete only
  def index_creator
    @plans = Plan.joins(:athlete_plans).
      where("athlete_plans.athlete_id" => current_athlete.id,
          "athlete_plans.completion" => false,
          "plans.creator_id" => current_athlete.id)
    render 'index_creator.json.jbuilder', status: :created
  end

  # Queries for plans ADOPTED by the SIGNED-IN Athlete regardless of whom they were created by
  def index_adopted
    @athlete_plans = AthletePlan.where(athlete_id: current_athlete.id, completion: false)
    plan_ids = @athlete_plans.map(&:plan_id).uniq
    @athlete_workouts = AthleteWorkout.where(athlete_id: current_athlete.id, plan_id: plan_ids)
    render json: @athlete_workouts, status: :ok
  end

  # Creates a Plan shell, but without workouts
  def create
    @plan = Plan.new(name: params[:name], description: params[:description], creator_id: current_athlete.id, plan_creator: current_athlete.username)

    if @plan.save
      @athleteplan = AthletePlan.create(athlete_id: current_athlete.id, plan_id: @plan.id, start_date: params[:start_date], end_date: params[:end_date])
      render 'create.json.jbuilder', status: :created
    else
      render json: { errors: @athlete.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Adds workouts to previously-created Plan
  def add_workout
    workout_array = params[:workouts]
    @athlete_workout =[]
    @plan_workout =[]
    @plan = Plan.find(params[:plan_id])
    workout_array.each do |w|
      @plan_workout << PlanWorkout.create(plan_id: @plan.id, workout_id: w[:workout_id])
        w[:workout_dates].each do |dodate|
        @athlete_workout << AthleteWorkout.create(athlete_id: current_athlete.id, workout_id: w[:workout_id], do_date: dodate, plan_id: @plan.id)
        end
    end
    render 'add_workout.json.jbuilder', status: :created
  end

  # Updates status of a Plan to completed
  def update_completion
    plan_id = params[:id]
    @athlete_plan = AthletePlan.find_by("athlete_id = ? AND plan_id = ?", current_athlete.id, plan_id)
    @athlete_plan.update(completion: true)

    render 'update_completion.json.jbuilder', status: :created
  end

  # Updates status of a Workout to completed
  def update_workout_completion
    athlete_workout_id = params[:athlete_workout_id]
    @athlete_workout = AthleteWorkout.find(athlete_workout_id)
    @athlete_workout.update(workout_completion: true)
    render 'update_workout_completion.json.jbuilder', status: :created
  end
# athlete_id: athlete_plan.athlete_id, plan_id: athlete_plan.plan_id).update_all(completion: true)
#  end

  def destroy
    @plan = AthletePlan.find_by(plan_id: params[:id])
    if @plan.athlete_id == current_athlete.id
      @plan.destroy
      render plain: "Plan had been deleted from the dashboard of #{@plan.athlete.username}."
    else
      render plain: 'You can only delete a plan from your own dashboard.'
    end
  end
  # def destroy
  #   @plan = Plan.find(params[:id])
  #   if @plan.creator_id == current_athlete.id
  #     @plan.destroy
  #     render plain: 'Plan was deleted.'
  #   else
  #     render plain: 'You must be the creator of the Plan in order to delete it.'
  #   end
  # end
end