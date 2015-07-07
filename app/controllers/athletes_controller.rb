class AthletesController < ApplicationController

  def signup
    passhash = Digest::SHA1.hexdigest(params[:password])
    @athlete = Athlete.new(username: params[:username], email: params[:email]), password: passhash, access_token: access_token)
    if @athlete.save
      render 'signup.json.jbuilder', status: :created
    else
      render json: { errors: @athlete.errors.full_messages },
  end

  def register
    @athlete = current_athlete(first_name: params[:first_name], last_name: params[:last_name], phone_number: params[:phone_number], home_address: params[:home_address], city: params[:city], state: params[:state], zip: params[:zip], interests: params[:interests], image_url: params[:image_url])

   if @athlete.update
      render 'register.json.jbuilder'
   else
     render json: { errors: @athlete.errors.full_messages }
   end
    # if @athlete.save
    #     render 'register.json.jbuilder', status: :created
    # else
    #   render json: { errors: @athlete.errors.full_messages },
    #     status: :unprocessable_entity

     render json: {user: @athlete}ser.as_json(only: [:id, :email, :access_token]) },
  #   status: :created
    end
  end

  def signin
    @athlete = Athlete.find_by(email: params[:email])
    passhash = Digest::SHA1.hexdigest(params[:password])
    if @athlete && passhash == @athlete.password
      render 'sign_in.json.jbuilder',
        status: :created
    else
      render json: { errors: @athlete.errors.full_messages }
    end

  end

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end