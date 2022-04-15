class ActsController < ApplicationController
  def create
    @rubigon = Rubigon.find(params[:rubigon_id])
    @act = Act.new(act_params)
    if @act.save
      redirect_to edit_rubigon_path(@rubigon.id)
    else
      render '/rubigon/new'
    end
  end

  private
    def act_params
      params.require(:act).permit(:num, :choice, :ans).merge(rubigon_id: @rubigon.id)
    end
end
