class RubigonsController < ApplicationController
  before_action :rubigon_set, only: [:edit, :show, :destroy, :update]
  before_action :act_set, only: [:new, :edit, :show]
  before_action :acts_set, only: [:edit, :show]

  def index  
  end

  def new
    basic_auth
    @rubigon = Rubigon.new
    @rubigons = Rubigon.all
  end

  def create
    @rubigon = Rubigon.new(rubigon_params)
    if @rubigon.save
      redirect_to new_rubigon_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def destroy
    @rubigon.destroy
    redirect_to new_rubigon_path
  end

  def update
    if @rubigon.update(rubigon_params)
      redirect_to new_rubigon_path
    else
      render :edit
    end
  end

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
    username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def rubigon_params
    params.require(:rubigon).permit(:stage_no, :enemy, :image)
  end

  def rubigon_set
    @rubigon = Rubigon.find(params[:id])
  end

  def act_set
    @act = Act.new
  end
  
  def acts_set
    @acts = @rubigon.acts.all
  end
end
