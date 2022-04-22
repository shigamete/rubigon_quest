class ActsController < ApplicationController
  before_action :rubigon_set, only: [:create, :edit, :update, :destroy]
  before_action :act_set, only: [:edit, :update, :destroy]

  def create
    @rubigons = Rubigon.all
    @act = Act.new(act_params)
    if @act.save
      redirect_to edit_rubigon_path(@rubigon.id)
    else
      render '/rubigons/new'
    end
  end

  def edit
  end

  def update
    @acts = @rubigon.acts.all
    if @act.update(act_params)
      redirect_to edit_rubigon_path(@rubigon.id)
    else
      render :edit
    end
  end

  def destroy
    @act.destroy
    redirect_to edit_rubigon_path(@rubigon.id)
  end

  private
  def act_params
    params.require(:act).permit(:choice, :ans).merge(rubigon_id: @rubigon.id)
  end

  def rubigon_set
    @rubigon = Rubigon.find(params[:rubigon_id])
  end

  def act_set
    @act = Act.find(params[:id])
  end
end
