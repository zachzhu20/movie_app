require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @movie = movies(:one)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Movie.count' do
      post movies_path, params: { movie: { name: "Movie1", comment: "Comment1" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Movie.count' do
      delete movie_path(@movie)
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy for wrong movie" do
    log_in_as(users(:michael))
    movie = movies(:ants)
    assert_no_difference 'Movie.count' do
      delete movie_path(movie)
    end
    assert_redirected_to root_url
  end
end
