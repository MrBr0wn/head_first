# frozen_string_literal: true

require './app'
require 'minitest/autorun'
require 'rack/test'

# class of Application
class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    @movies = MovieStore.new('movies.yml')
    @movie = Movie.new
    @movie.title = 'Test title'
    @movie.director = 'Any director'
    @movie.year = '2000'
  end

  def test_index_movies_page
    get '/movies'
    assert last_response.ok?
    assert_match(/Movie list/, last_response.body)
  end

  def test_new_movie_page
    get '/movies/new'
    assert last_response.ok?
    assert_match(/Add New Movie/, last_response.body)
  end

  def test_show_movie_page
    get '/movies/1'
    assert last_response.ok?
    assert_match(/Title:/, last_response.body)
  end

  def test_show_first_movie_page
    id = 1
    get "/movies/#{id}"
    assert last_response.ok?
    assert_match(/Star Wars/, last_response.body)
  end

  def test_all_method
    assert(@movies.all)
  end

  def test_find_metnod
    assert(@movies.find(1))
  end

  def test_save_method
    assert(@movies.save(@movie))
  end
end
