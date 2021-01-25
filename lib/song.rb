class Song
    attr_accessor :name, :artist 

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file_name)
        title = file_name.split(" - ")[1]
        new_song = self.new(title)
        new_song.artist_name=(file_name.split(" - ")[0])
        new_song
    end

    def artist_name=(artist_name)
        # binding.pry
        self.artist = Artist.find_or_create_by_name(artist_name)
        self.artist.add_song(self)
    end

    
end