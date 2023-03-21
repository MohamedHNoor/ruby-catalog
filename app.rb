require './classes/game'
require './modules/game_module'

class App
  include GameModule

  def initialize
    @games = load_game
    @options = [
      'List all books',
      'List all music albums',
      'List all games',
      'List all genres',
      'List all labels',
      'List all authors',
      'Add a book',
      'Add a music album',
      'Add a game',
      'Exit'
    ]
  end

  def run
    puts '----------------------'
    puts 'Welcome to the app!'
    puts '----------------------'
    puts 'Please choose an option: [1-10]'

    @options.each_with_index do |option, index|
      puts "#{index + 1}. #{option}"
    end
    user_input
  end

  def user_input
    user_option = gets.chomp.to_i
    operation(user_option)
  end

  def operation(user_option)
    case user_option
    when 1 then list_all_books
    when 2 then list_all_music_albums
    when 3 then list_all_games
    when 4 then list_all_genres
    when 5 then list_all_labels
    when 6 then list_all_authors
    else operation_two(user_option)
    end
  end

  def operation_two(user_option)
    case user_option
    when 7 then add_book
    when 8 then add_music_album
    when 9 then add_game
    when 10 then exit_app
    else
      puts 'Invalid option'
    end
  end

  def list_all_books
    # TODO
  end

  def list_all_music_albums
    # TODO
  end

  def list_all_games
    if @games.empty?
      puts 'There are no games in the List'
      nil
    else
      @games.each do |game|
        puts "Publish date: #{game.publish_date}"
        puts "Archived: #{game.archived}"
        puts "Multiplayer: #{game.multiplayer}"
        puts "Last played: #{game.last_played}"
        puts '----------------------'
      end
    end
  end

  def list_all_genres
    # TODO
  end

  def list_all_labels
    # TODO
  end

  def list_all_authors
    # TODO
  end

  def add_book
    # TODO
  end

  def add_music_album
    # TODO
  end

  def add_game
    puts 'Enter the date of publication: '
    publish_date = gets.chomp
    puts 'Enter if the game is archived: true or false '
    archived = gets.chomp
    puts 'Enter if the game is multiplayer: true or false '
    multiplayer = gets.chomp
    puts 'Enter the last time the game was played: '
    last_played = gets.chomp

    @games << Game.new(publish_date, archived, multiplayer, last_played)
    save_game
    puts 'Game added successfully'
  end

  def exit_app
    puts 'Thank you for using the app!'
    exit
  end
end
