require 'pry'

class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        self.name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|songs| songs.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(artist_name)
      found_artist = self.all.find { |artist| artist.name == artist_name }
        found_artist ? found_artist : Artist.new(artist_name)
    end

    def print_songs
        song_array = Song.all.select {|songs| songs.artist == self}
        song_array.each {|song| puts song.name}
    end

end