class Photograph

  attr_reader :id,
              :name,
              :artist_id,
              :year

  def initialize(arg_hash)
    @id = arg_hash[:id].to_i
    @name = arg_hash[:name]
    @artist_id = arg_hash[:artist_id].to_i
    @year = arg_hash[:year].to_i
  end

end
