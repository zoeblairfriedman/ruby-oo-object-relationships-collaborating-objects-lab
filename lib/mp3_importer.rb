require 'pry'

class MP3Importer
attr_accessor :path

def initialize(path)
    @path = path
end


def files
    Dir.chdir(@path) do |path|
        Dir.glob("*.mp3")
    end
end

def import 
    song = files.each do |mp3|
        # binding.pry
        song_name = mp3.split(" - ")[1]
        Song.new_by_filename(song_name)
    end
end

end