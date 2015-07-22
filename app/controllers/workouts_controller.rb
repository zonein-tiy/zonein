class WorkoutsController < ApplicationController
  before_action :authenticate_with_token!

  # Creates a new Workout
  def create
    @workout = Workout.new(name: params[:name], steps: params[:steps], description: params[:description], time: params[:time], image_url: params[:image_url], video_url: params[:video_url], running: params[:running], weightlifting: params[:weightlifting], swimming: params[:swimming], circuit_training: params[:circuit_training], cycling: params[:cycling], creator_id: current_athlete.id, workout_creator: current_athlete.username)

    if @workout.save
      AthleteWorkout.create(workout_id: @workout.id, athlete_id: current_athlete.id)
      render 'create.json.jbuilder', status: :created
    else
      render json: { errors: @athlete.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Queries for ALL workouts 
  def index
    @workouts = Workout.all 
    render 'index.json.jbuilder', status: :created
  end

  # Queries for workouts CREATED by the signed-in Athlete
  def index_create
    @workouts = Workout.where(creator_id: current_athlete.id)
    render 'index_create.json.jbuilder', status: :created
  end



  #Queries for workouts based on description type
  def index_description
    choice = params[:description]
    @results = Workout.where(description: choice)
    render 'index_description.json.jbuilder', status: :created
  end

  def index_creator
    username = params[:username]
    # binding.pry
    @workouts = Workout.where(workout_creator: params[:username])
    render 'index_creator.json.jbuilder', status: :created
  end
  # def index_category
  #   choice = Workout.find_by(params[:category])
  #   @results = Workout.where()
  # end 

  def index_category
    @results = Workout.where(nil)
    
    @results = @results.where(running: true) if params[:running].present?
    @results = @results.where(weightlifting: true) if params[:weightlifting].present?
    @results = @results.where(cycling: true) if params[:cycling].present?
    @results = @results.where(circuit_training: true) if params[:circuit_training].present?
    @results = @results.where(swimming: true) if params[:swimming].present?
    
    render 'index_category.json.jbuilder'
  end

  def destroy
    @workout = Workout.find(params[:id])
    if @workout.creator_id == current_athlete.id
      @workout.destroy
      render plain: 'Workout was deleted.'
    else
      render plain: 'You must be the creator of the workout to delete it.'
    end
  end



end
