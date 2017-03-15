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
    puts
    until input == "exit"
    input = gets.strip.downcase

    mov = NewMovies::Movie_Scraper.all[input.to_i - 1] #rn input is, e.g., 2 ("3" => 2)

    puts
    puts "#{mov.name} (#{mov.genre}) - Starring: #{mov.starring} \n\nSummary: #{mov.summary}."
    puts

    if mov.rating == "No rating available"
      puts mov.rating
    else
      puts "Rated #{mov.rating}"
    end

    puts
    puts "Would you like to see another movie? Enter its number here:"
    puts
    end
  end
end
