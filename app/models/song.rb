class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  # custom getter and setter methods
  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre) 
  end

  def genre_name
    genre ? genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist ? artist.name : nil
  end

  def note_contents=(contents)
    contents.each do |content|
      unless content.strip == ''
        notes.build(content: content)
      end
    end
  end

  def note_contents
    notes.map(&:content)
  end

end
