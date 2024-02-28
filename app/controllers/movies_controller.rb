class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :foo, only: [:new, :index]
  def foo
    p "hiya" * 100
  end

  def new
    self.foo
    @movie = Movie.new
  end

  def index
    self.foo
    @movies = Movie.order(created_at: :desc)

    respond_to do |format|
      format.json { render json: @movies }

      format.html
    end
  end

  def show
  end

  def create
    #movie_params = params.require(:movie).permit(:title, :description, :image_url)

    @movie = Movie.new(movie_params)

    if @movie.valid?
      @movie.save

      redirect_to movies_url, notice: "Movie created successfully."
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @movie = Movie.find(params.fetch(:id))

    #movie_params = params.require(:movie).permit(:title, :description, :image_url)

    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie updated successfully."
    else
      render "edit"
    end
  end

  def destroy
    @movie = Movie.find(params.fetch(:id))

    @movie.destroy

    redirect_to movies_url, notice: "Movie deleted successfully."
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :image_url, :released_on)
  end

  def set_movie
    @movie = Movie.find(params.fetch(:id))
  end

end
