class PlansController < ApplicationController
  before_action :authenticate_with_token!

  # Queries for ALL plans CREATED by EVERYBOBY
  def index
    @plans = Plan.includes(:plan_workouts)
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
    # binding.pry
    plan_ids = @athlete_plans.map(&:plan_id).uniq
    @athlete_workouts = AthleteWorkout.where(athlete_id: current_athlete.id, plan_id: plan_ids)
    render json: @athlete_workouts, status: :ok
  end

  def show
    @plan = AthletePlan.find(params[:id])
    athleteid = @plan.athlete_id
    planid = @plan.plan_id
    @athlete_workouts = AthleteWorkout.where(plan_id: planid, athlete_id: athleteid)
    render 'show.json.jbuilder', status: :created
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
    # binding.pry
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
# {"plan_id"=>34, "workouts"=>[{"workout_id"=>"1", "workout_dates"=>["2015-08-10T04:00:00.000Z"]}, {"workout_id"=>"2", "workout_dates"=>["2015-08-11T04:00:00.000Z”]}

  def adopt_plan
    workout_array = params[:workouts]
    @athlete_workout = []
    @plan = Plan.find(params[:plan_id])
    @athleteplan = AthletePlan.create(athlete_id: current_athlete.id, plan_id: @plan.id, start_date: params[:start_date], end_date: params[:end_date])
    # binding.pry
    # {"plan_id"=>34, "start_date"=>"2015-08-10T04:00:00.000Z", "end_date"=>"2015-08-11T04:00:00.000Z", "workouts"=>[{"workout_id"=>"1", "workout_dates"=>["2015-08-10T04:00:00.000Z"]}, {"workout_id"=>"2", "workout_dates"=>["2015-08-11T04:00:00.000Z"]}
    workout_array.each do |w|
      w[:workout_dates].each do |dodate|
        @athlete_workout << AthleteWorkout.create(athlete_id: current_athlete.id, workout_id: w[:workout_id], do_date: dodate, plan_id: @plan.id)
      end
    end
    render 'adopt_plan.json.jbuilder'
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
    athlete_workout = AthleteWorkout.find(params[:athlete_workout_id])
    athlete_workout.update(workout_completion: true, completion_date: params[:completion_date],lift_weight: params[:lift_weight], lift_reps: params[:lift_reps], run_distance: params[:run_distance], run_time: params[:run_time])
    @athlete_workout = AthleteWorkout.find(params[:athlete_workout_id])
    # @athlete_workout.update(lift_weight: params[:lift_weight], lift_reps: params[:lift_reps], run_distance: params[:run_distance], run_time: params[:run_time])
    # @athlete_workout.update(completion_date: params[:completion_date])
    render 'update_workout_completion.json.jbuilder', status: :created
  end


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