class RubigonsController < ApplicationController
  def index
    
  end

  def new
    basic_auth
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
    if @rubigon.update(rubigon_params)
      redirect_to new_rubigon_path
    else
      render :edit
    end
  end


  private
    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == 'admin' && password == '2222'
      end
    end
    
    def rubigon_params
      params.require(:rubigon).permit(:stage_no, :enemy, :image)
    end
end
