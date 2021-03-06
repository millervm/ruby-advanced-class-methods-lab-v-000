require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    new_song = self.new
    self.all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song ? song : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    artist_and_name = filename.split(".mp3").join.split(" - ")
    song = self.new_by_name(artist_and_name[1])
    song.artist_name = artist_and_name[0]
    song
  end

  def self.create_from_filename(filename)
    artist_and_name = filename.split(".mp3").join.split(" - ")
    song = self.create_by_name(artist_and_name[1])
    song.artist_name = artist_and_name[0]
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
