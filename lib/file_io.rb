require 'csv'

class FileIO
  def load_artists_csv(file)
    artists = []
    contents = CSV.open file, headers: true, header_converters: :symbol
    contents.each do |row|
      artist_hash = {
        id: row[:id],
        name: row[:name],
        born: row[:born],
        died: row[:died],
        country: row[:country]
      }
      artists << artist_hash
    end
    return artists
  end

  def load_photographs_csv(file)
    photographs = []
    contents = CSV.open file, headers: true, header_converters: :symbol
    contents.each do |row|
      photograph_hash = {
        id: row[:id],
        name: row[:name],
        artist_id: row[:artist_id],
        year: row[:year],
      }
      photographs << photograph_hash
    end
    return photographs
  end

  def find_object(object_array, id)
    object_array.find do |object|
      object.id == id
    end
  end
end
