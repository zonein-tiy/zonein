class WorkoutsController < ApplicationController
before_action :authenticate_with_token!
# def new
#   @workout = Workout.new(workout_params)
#   @workout = Workout.new (name: params[:name], description: params[:description], type: params[:type], time: params[:time], image_url: params[:image_url], video_url: params[:video_url], running: params[:running], weightlifting: params[:weightlifting])
# end

def create
  # binding.pry
    # creator_id = current_athlete.id

    @workout = Workout.new(name: params[:name], steps: params[:steps], description: params[:description], time: params[:time], image_url: params[:image_url], video_url: params[:video_url], running: params[:running], weightlifting: params[:weightlifting], swimming: params[:swimming], circuit_training: params[:circuit_training], cycling: params[:cycling], creator_id: current_athlete.id)


    if @workout.save
        # workout.athlete_workout.create(athlete_id: current_user_id)
        AthleteWorkout.create(workout_id: @workout.id, athlete_id: current_athlete.id)
        render 'create.json.jbuilder', status: :created
    else
        render json: { errors: @athlete.errors.full_messages }, status: :unprocessable_entity
    end
end

def index
  @workouts = Workout.all 
  render 'index.json.jbuilder', status: :created
end

def index_create
    @workouts = Workout.where(creator_id: current_athlete.id)
   # binding.pry
    render 'index_create.json.jbuilder', status: :created
end
#   workouts = Workout.all
#   workouts.each do |workout|
#     workout.creator = creator_name
#   @workouts = Workout.all
#   @creator = 
#   if @creator.nil? : creator_id = current_user
#   @workouts = 
#   @workouts = @creator.workouts.all 
# end

# def show_other
# # def workout_params
# #   params.require(:workout).permit(:name, :description, :type, :time, :image_url,
# #     :video_url, :running, :weightlifting)
# # end
end
