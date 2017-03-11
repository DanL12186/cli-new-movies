class NewMovies::CLI

  def call
    puts "Movie List:"
    puts
    movie_list  #wiil call a list of all movies in a particular visual format
    display_movie_details #calls below method in some future form
  end

  def display_movie_details
    puts "#{mov.name} (#{mov.genre}) \nStarring: #{mov.starring} \n\nSummary: #{mov.summary}."
  end

end
