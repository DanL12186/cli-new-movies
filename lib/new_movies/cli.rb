class NewMovies::CLI

  def call
    NewMovies::Movie_Scraper.namescrape #was handled by the @@all ||= scrape in the example. Probably shouldn't *really* have this here, but...
    movie_list  #x. Movie (Genre)
    display_movie_details
    puts "\nGoodbye!"
  end

  def movie_list
    puts
    puts "############### Movie List: ################"
    puts
    NewMovies::Movie_Scraper.all.each.with_index(1) do |mov, num| #borrowed code from example
      puts "#{num}. #{mov.name} (#{mov.genre})"
    end
    puts "############################################"
  end

  def display_movie_details #this badly needs to be cleaned up and and abstracted. Too much unrelated funcationality going on in one method.
    input = nil
    puts "\nEnter the number of the movie you want more info on, or type 'exit' to quit.\n\n"

    until input == "exit"
    input = gets.strip.downcase

    mov = NewMovies::Movie_Scraper.all[input.to_i - 1] #rn input is, e.g., 2 ("3" => 2)

    if input != 'exit' && input != "list" && !input.to_i.between?(1,(NewMovies::Movie_Scraper.all.length))
      puts "\nUnrecognized command. Enter the number of the movie you wish to learn more about, type 'list' to view list, or 'exit' to quit.\n"
    elsif input != 'exit'
      puts "\n*******************************************************"
      puts "#{mov.name} (#{mov.genre}) - Starring: #{mov.starring} \n\nSummary: #{mov.summary}"
      puts

      if mov.rating == "No rating available"
        puts mov.rating
      else
        puts "Rated #{mov.rating}"
      end

    if input == 'list'
      movie_list
      puts
      puts "Enter the number of the movie you want more info on, or type 'exit' to quit."
      puts
    else
      puts
      print "Would you like to see another movie? Enter its number here: "
      end
    end
  end
end

end
