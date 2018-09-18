require './lib/file_io.rb'

class Curator < FileIO

  attr_reader :artists,
              :photographs

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(attributes)
    @photographs << Photograph.new(attributes)
  end

  def find_photograph_by_id(id)
    @photographs.find do |photo|
      photo.id == id
    end
  end

  def find_photographs_by_artist(artist)
    @photographs.find_all do |photo|
      photo.artist_id == artist.id
    end
  end

  def photographs_taken_by_artists_from(country)
    @photographs.find_all do |photo|
       artist = find_artist_by_id(photo.artist_id)
       artist.country == country
    end
  end

  def load_photographs(file)
    load_photographs_csv(file).each do |photo_hash|
      add_photograph(photo_hash)
    end
  end

  def add_artist(attributes)
    @artists << Artist.new(attributes)
  end

  def find_artist_by_id(id)
    @artists.find do |artist|
      artist.id == id
    end
  end

  def artists_with_multiple_photographs
    @artists.find_all do |artist|
      photos = find_photographs_by_artist(artist)
      photos.length > 1
    end
  end

  def load_artists(file)
    load_artists_csv(file).each do |artist_hash|
      add_artist(artist_hash)
    end
  end

end
