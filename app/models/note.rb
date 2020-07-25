class Note < ActiveRecord::Base
  # add associations here
  belongs_to :song

  # def song_ids=(ids)
  #    ids.each do |id|
  #      song = Song.find(id)
  #      self.songs << song
  #    end
  #  end
end
