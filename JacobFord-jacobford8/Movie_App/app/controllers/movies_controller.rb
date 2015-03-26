class MoviesController < ApplicationController
  def index
  	@movies = Movie.all
  end	

  def new
  end

  def edit
  end

  def show
  end
end
