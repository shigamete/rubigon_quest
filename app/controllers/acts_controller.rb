class ActsController < ApplicationController
  def create
    @rubigons = Rubigon.all
    @rubigon = Rubigon.find(params[:rubigon_id])
    @act = Act.new(act_params)
    if @act.save
      redirect_to edit_rubigon_path(@rubigon.id)
    else
      render '/rubigons/new'
    end
  end

  def edit
    @rubigon = Rubigon.find(params[:rubigon_id])
    @act = Act.find(params[:id])
  end

  def update
    @rubigon = Rubigon.find(params[:rubigon_id])
    @act = Act.find(params[:id])
    @acts = @rubigon.acts.all
    if @act.update(act_params)
      redirect_to edit_rubigon_path(@rubigon.id)
    else
      render :edit
    end
  end
    

  private
    def act_params
      params.require(:act).permit(:choice, :ans).merge(rubigon_id: @rubigon.id)
    end
end
