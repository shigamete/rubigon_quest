class RubigonsController < ApplicationController
  def index
    
  end

  def new
    @rubigon = Rubigon.new
    @rubigons = Rubigon.all
  end

  def create
    @rubigon = Rubigon.new(rubigon_params)
    if @rubigon.save
      redirect_to new_rubigon_path
    else
      render :nuw
    end
  end

  def edit
    @rubigon = Rubigon.find(params[:id])
    @act = Act.new
  end

  def show
    @rubigon = Rubigon.find(params[:id])
    @act = Act.new
    @acts = @rubigon.acts.all
  end

  def destroy
    @rubigon = Rubigon.find(params[:id])
    @rubigon.destroy
    redirect_to new_rubigon_path
  end

  def update
    @rubigon = Rubigon.find(params[:id])
    

  private
    def rubigon_params
      params.require(:rubigon).permit(:stage_no, :enemy, :image)
    end
end
