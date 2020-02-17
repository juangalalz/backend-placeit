class MoviesController < ApplicationController
  before_action :load_movies, only: [:index]

  def index
    render json: ListResponse.new(data: @movies,
                                  message: "")
  end

  def create
    movie = Movie.new(movie_params)
    unless movie.valid?
      render json: movie.errors, status: :unprocessable_entity
      return
    end
    movie.save!

    render json: movie, serializer: MovieSerializer, status: :created
  end

  private

  def load_movies
    params = query_params
    @movies = Movie
    @movies = @movies.where(:movie_date => params[:initial_date]..params[:final_date]) if (params[:initial_date] && params[:final_date])
    @movies = @movies.order(movie_date: :asc)
  end

  def query_params
    params.permit(:initial_date, :final_date)
  end

  def movie_params
    params.require(:movie).permit(:name,
                                 :description,
                                 :image_url,
                                 :movie_date)
  end
end
