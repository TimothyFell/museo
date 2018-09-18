require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/artist'
require './lib/photograph'
require './lib/curator'

class CuratorTest < Minitest::Test

  def setup
    @curator = Curator.new
    @photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    @photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }
    @artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }
    @artist_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
  end

  def test_it_exists
    assert_instance_of Curator, @curator
  end

  def test_artists_and_photos_start_empty
    assert_equal [], @curator.artists
    assert_equal [], @curator.photographs
  end

  def test_can_add_photos
    @curator.add_photograph(@photo_1)
    assert_equal 1, @curator.photographs.length
    assert_equal "1", @curator.photographs.first.id

    @curator.add_photograph(@photo_2)
    assert_equal 2, @curator.photographs.length
    assert_equal "2", @curator.photographs.last.id
  end

  def test_can_add_artists
    @curator.add_artist(@artist_1)
    assert_equal 1, @curator.artists.length
    assert_equal "1", @curator.artists.first.id

    @curator.add_artist(@artist_2)
    assert_equal 2, @curator.artists.length
    assert_equal "2", @curator.artists.last.id
  end

  def test_can_find_photo_by_id
    @curator.add_photograph(@photo_1)
    @curator.add_photograph(@photo_2)
    photo_2 = @curator.photographs.last

    assert_equal photo_2, @curator.find_photograph_by_id("2")
  end

  def test_can_find_artist_by_id
    @curator.add_artist(@artist_1)
    @curator.add_artist(@artist_2)
    artist_2 = @curator.artists.last

    assert_equal artist_2, @curator.find_artist_by_id("2")
  end

end
