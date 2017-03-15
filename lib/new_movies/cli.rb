class NewMovies::CLI

  def call
    NewMovies::Movie_Scraper.namescrape #was handled by the @@all ||= scrape in the example. Probably shouldn't *really* have this here, but...
    movie_list  #calls a list of all movies; Movie (Genre)
    display_movie_details #calls display_movie_details in some future form
  end

  def movie_list
    puts
    puts "Movie List:"
    puts
    NewMovies::Movie_Scraper.all.each.with_index(1) do |mov, num| #borrowed code from example
      puts "#{num}. #{mov.name} (#{mov.genre})"
    end
  end

  def display_movie_details
    input = nil
    puts
    puts "Enter the number of the movie you want more info on, or type 'exit' to quit."

    until input == "exit"
    input = gets.strip.downcase

    puts
    puts "#{mov.name} (#{mov.genre}) \nStarring: #{mov.starring} \n\nSummary: #{mov.summary}."
    end
  end
end
