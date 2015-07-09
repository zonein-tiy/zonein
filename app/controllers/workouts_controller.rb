class WorkoutsController < ApplicationController

# def new
#   @workout = Workout.new(workout_params)
#   @workout = Workout.new (name: params[:name], description: params[:description], type: params[:type], time: params[:time], image_url: params[:image_url], video_url: params[:video_url], running: params[:running], weightlifting: params[:weightlifting])
# end

def create
  # add creator_id in params
    @workout = Workout.new(name: params[:name], steps: params[:steps], description: params[:description], time: params[:time], image_url: params[:image_url], video_url: params[:video_url], running: params[:running], weightlifting: params[:weightlifting])
# @workout = current-user.workouts.new
    if @workout.save
        render 'workout.json.jbuilder', status: :created
    else
        render json: { errors: @athlete.errors.full_messages }, status: :unprocessable_entity
    end
end

# def workout_params
#   params.require(:workout).permit(:name, :description, :type, :time, :image_url,
#     :video_url, :running, :weightlifting)
# end
end
