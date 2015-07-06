class AthletesController < ApplicationController

  def register
    passhash = Digest::SHA1.hexdigest(params[:password])
    @athlete = Athlete.new(username: params[:username], first_name: params[:first_name], last_name: params[:last_name], home_address: params[:home_address], city: params[:city], state: params[:state], email: params[:email], interests: params[:interests], password: passhash)
    if @athlete.save
        render 'register.json.jbuilder', status: :created
    else
      render json: { errors: @athlete.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def signin
    @athlete = Athlete.find_by(username: params[:username])
    passhash = Digest::SHA1.hexdigest(params[:password])
    if @athlete && passhash == @athlete.password
      render 'sign_in.json.jbuilder',
        status: :created
    else
      render json: { message: "Invalid login or password." },
        status: :unauthorized
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
