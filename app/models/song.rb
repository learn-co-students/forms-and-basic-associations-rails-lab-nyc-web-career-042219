class Song < ActiveRecord::Base
  belongs_to :genre
  belongs_to :artist
  has_many :notes

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_name
    genre ? genre.name : nil
  end

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by(name: artist)
  end

  def artist_name
    artist ? artist.name : nil
  end

  def note_contents=(notes)
    notes.each do |note|
      self.notes.build(content: note, song_id: self.id) unless note.blank?
    end
  end

  def note_contents
    note_content = []
    self.notes.each do |note|
      note_content << note.content
    end
    note_content
  end

end