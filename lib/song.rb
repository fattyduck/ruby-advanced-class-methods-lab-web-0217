class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.bsearch{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    return self.find_by_name(name) if @@all.include?(name)
    self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort{|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(file_name)
    artist_name = file_name.split(" - ")[0]
    name = file_name[0...file_name.length-4].split(" - ")[1]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file_name)
    artist_name = file_name.split(" - ")[0]
    name = file_name[0...file_name.length-4].split(" - ")[1]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    @@all << song
    song
  end

  def self.destroy_all
    @@all = []
  end

end
