class SpotsController < ApplicationController

  def top
  end

  def search
    @spots = Spot.search(params[:search])
  end

  def index
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

end
