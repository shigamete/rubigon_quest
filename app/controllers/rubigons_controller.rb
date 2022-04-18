class RubigonsController < ApplicationController
  def index
    
  end

  def new
    @rubigon = Rubigon.new
    @rubigons = Rubigon.all
    @act = Act.new
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
    @acts = @rubigon.acts.all
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
    if @rubigon.update(act_params)
      redirect_to new_rubigon_path
    else
      render :edit
    end
  end


  private
    def rubigon_params
      params.require(:rubigon).permit(:stage_no, :enemy, :image)
    end
end
