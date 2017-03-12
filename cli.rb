class NewMovies::CLI

  def call
    puts
    puts "Movie List:"
    puts
    movie_list  #wiil call a list of all movies in a particular visual format
    display_movie_details #calls display_movie_details in some future form
  end

  def display_movie_details
    input = nil
    puts "Enter the number of the movie you want more info on, or type 'exit' to quit."

    until input == "exit" || "Exit"
    input = gets.strip

    puts
    puts "#{mov.name} (#{mov.genre}) \nStarring: #{mov.starring} \n\nSummary: #{mov.summary}."
  end

end
