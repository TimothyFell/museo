require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/artist'
require './lib/photograph'
require './lib/curator'

class CuratorTest < Minitest::Test

  def setup
    photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }
    photo_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
    }
    photo_4 = {
      id: "4",
      name: "Child with Toy Hand Grenade in Central Park",
      artist_id: "3",
      year: "1962"
    }
    artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }
    artist_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    artist_3 = {
      id: "3",
      name: "Diane Arbus",
      born: "1923",
      died: "1971",
      country: "United States"
    }
    @curator = Curator.new
    @curator.add_photograph(photo_1)
    @curator.add_photograph(photo_2)
    @curator.add_photograph(photo_3)
    @curator.add_photograph(photo_4)
    @curator.add_artist(artist_1)
    @curator.add_artist(artist_2)
    @curator.add_artist(artist_3)
    @diane_arbus = @curator.find_artist_by_id("3")
  end

  def test_it_exists
    curator = Curator.new

    assert_instance_of Curator, curator
  end

  def test_artists_and_photos_start_empty
    curator = Curator.new

    assert_equal [], curator.artists
    assert_equal [], curator.photographs
  end

  def test_can_add_photos
    assert_equal 4, @curator.photographs.length
    assert_equal "1", @curator.photographs.first.id
    assert_equal "4", @curator.photographs.last.id
  end

  def test_can_add_artists
    assert_equal 3, @curator.artists.length
    assert_equal "1", @curator.artists.first.id
    assert_equal "3", @curator.artists.last.id
  end

  def test_can_find_photo_by_id
    photo_4 = @curator.photographs.last

    assert_equal photo_4, @curator.find_photograph_by_id("4")
  end

  def test_can_find_artist_by_id
    artist_3 = @curator.artists.last

    assert_equal artist_3, @curator.find_artist_by_id("3")
  end

  def test_can_find_photos_by_artist
    actual = @curator.find_photographs_by_artist(@diane_arbus)
    expected = @curator.photographs[-2..-1]

    assert_equal expected, actual
  end

  def test_can_find_artists_with_multiple_photos
    actual = @curator.artists_with_multiple_photographs

    assert_equal [@diane_arbus], actual
  end

  def test_can_find_photos_taken_in_country
    expected = @curator.photographs[-3..-1]
    actual = @curator.photographs_taken_by_artists_from("United States")
    bad_actual = @curator.photographs_taken_by_artists_from("Argentina")

    assert_equal expected, actual
    assert_equal [], bad_actual
  end

  def test_can_load_photograph_csv_files
    curator = Curator.new
    curator.load_photographs('./data/photographs.csv')
    actual = curator.photographs.last.name
    expected = "Child with Toy Hand Grenade in Central Park"

    assert_equal expected, actual
  end

  def test_can_load_artist_csv_files
    curator = Curator.new
    curator.load_artists('./data/artists.csv')
    actual = curator.artists.last.name
    expected = "Bill Cunningham"

    assert_equal expected, actual
  end

  def test_can_find_photos_within_range
    curator = Curator.new
    curator.load_photographs('./data/photographs.csv')
    actual = curator.photographs_taken_between(1950..1965)
    expected = [curator.photographs.first, curator.photographs.last]

    assert_equal expected, actual
  end

end
