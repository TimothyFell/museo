class Photograph

  attr_reader :id,
              :name,
              :artist_id,
              :year

  def initialize(arg_hash)
    @id = arg_hash[:id]
    @name = arg_hash[:name]
    @artist_id = arg_hash[:artist_id]
    @year = arg_hash[:year]
  end

end
