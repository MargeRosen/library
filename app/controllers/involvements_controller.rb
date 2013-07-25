class InvolvementsController < ApplicationController
  def new
    @involvement = Involvement.new
  end  

  def create
    if @involvement = Involvement.create(params[:involvement])
      flash[:notice] = "Involvement has been registered."
      redirect_to @involvement.movie
    else
      flash[:alert] = "Involvement has not been registered."
      render action: 'new'
    end
  end

  def destroy
    @involvement = Involvement.find(params[:id])
    if !@involvement.nil? 
      movie = @involvement.movie
      @involvement.destroy
      flash[:notice] = "Association has been destroyed."
    else
      flash[:notice] = "Association has not been destroyed."
    end
      redirect_to movie_path
  end
end
