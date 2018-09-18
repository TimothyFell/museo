class Artist

  attr_reader :id,
              :name,
              :born,
              :died,
              :country

  def initialize(arg_hash)
    @id = arg_hash[:id]
    @name = arg_hash[:name]
    @born = arg_hash[:born]
    @died = arg_hash[:died]
    @country = arg_hash[:country]
  end

end
