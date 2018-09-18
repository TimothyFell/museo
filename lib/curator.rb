class Curator

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

  def add_artist(attributes)
    @artists << Artist.new(attributes)
  end

  def find_artist_by_id(id)
    @artists.find do |artist|
      artist.id == id
    end
  end

end