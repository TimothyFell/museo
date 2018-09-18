class Artist

  attr_reader :id,
              :name,
              :born,
              :died,
              :country

  def initialize(arg_hash)
    @id = arg_hash[:id].to_i
    @name = arg_hash[:name]
    @born = arg_hash[:born].to_i
    @died = arg_hash[:died].to_i
    @country = arg_hash[:country]
  end

end
