require_relative 'genre'
require_relative 'music_album'
require 'json'

class MusicUI
  def initialize
    @genres = []
    @music_albums = []
  end

  def list_genres
    system 'cls'
    if @genres.empty?
      puts 'No genres found'.center(32)
      return
    end
    puts 'Genres'.center(32)
    count = 0
    @genres.each do |genre|
      puts "#{count += 1}: #{genre.name}"
    end
    print 'press any key to return to the main menu... : '
    gets
    system 'cls'
  end

  def list_music_albums
    system 'cls'
    if @music_albums.empty?
      puts 'No music albums found'.center(32)
      return
    end
    puts 'Music Albums'.center(32)
    count = 0
    @music_albums.each do |album|
      puts "#{count += 1}: Album title: #{album.title}  Release Date: #{album.publish_date}"
    end
    print 'press any key to return to the main menu... : '
    gets
    system 'cls'
  end

  def create_music_album
    print 'Enter album title: '
    album_title = gets.chomp
    print 'Enter album publish date [YYYY-MM-DD]: '
    album_publish_date = gets.chomp
    print 'Enter album genre: '
    album_genre = gets.chomp
    print 'Is the album on spotify? (y/n): '
    response = gets.chomp
    album_on_spotify = %w[y Y].include?(response)
    album = MusicAlbum.new(album_title, album_publish_date, on_spotify: album_on_spotify)
    genre = @genres.find { |g| g.name == album_genre }
    if genre.nil?
      genre = Genre.new(album_genre)
      @genres.push(genre)
    end
    album.add_genre(genre)
    @music_albums.push(album)
  end

  def loop_create_music_album
    loop do
      system 'cls'
      puts 'Create a music album'.center(32)
      create_music_album
      system 'cls'
      puts 'Album created successfully'.center(32)
      puts '1: Add another album'
      puts '2: Return to main menu'
      print 'Enter your choice: '
      response = gets.chomp.to_i
      if response == 2
        system 'cls'
        break
      end
      system 'cls'
    end
  end

  def preserve_music_album_genre
    return if @music_albums.empty?
  
    music = @music_albums.map do |album|
      {
        id: album.id,
        title: album.title,
        on_spotify: album.on_spotify,
        date: album.publish_date,
        genre: album.genre.name,
        genre_id: album.genre.id
      }
    end
  
    music_data = JSON.pretty_generate(music)
    File.write('./data/music.json', music_data)
  end
  

  def populate_music_album_genre
    return unless File.exist?('./data/music.json')
  
    music_data = File.read('./data/music.json')
    music = JSON.parse(music_data, symbolize_names: true)
    music.each do |album|
      genre = @genres.find { |g| g.name == album[:genre] }
      if genre.nil?
        genre = Genre.new(album[:genre], album[:genre_id])
        @genres << genre
      end
      music_album = MusicAlbum.new(album[:title], album[:date], on_spotify: album[:on_spotify], id: album[:id])
      music_album.add_genre(genre)
      @music_albums << music_album
    end
  end  
end  