require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @movie = @user.movies.build(name: "Star Wars", comment: "A great syfy movie")
  end

  test "should be valid" do
    assert @movie.valid?
  end

  test "user id should be present" do
    @movie.user_id = nil
    assert_not @movie.valid?
  end
  
  test "name should be present" do
    @movie.name = "   "
    assert_not @movie.valid?
  end

  test "name should be at most 50 characters" do
    @movie.name = "a" * 51
    assert_not @movie.valid?
  end
  
  test "comment should be present" do
    @movie.comment = "   "
    assert_not @movie.valid?
  end

  test "comment should be at most 255 characters" do
    @movie.comment = "a" * 256
    assert_not @movie.valid?
  end
  
  test "order should be most recent first" do
    assert_equal movies(:most_recent), Movie.first
  end
end
