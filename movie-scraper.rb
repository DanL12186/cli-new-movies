NewMovies::Movie_Scraper

class Movie_Scraper

  attr_reader :name, :starring

  #def initialize(name="", starring=[])

  def self.namescrape
    page = Nokogiri::HTML(open('http://www.movieinsider.com/movies/coming-soon')) #movieinsider/new-movies main
    movie_names = page.css('h4.media-heading a').text.strip.split("  ") #grabs names.to_a ["Harry Potter", "The Bourne Identity", "Serenity", "The Matrix,"] etc.
    credits = page.css('p.credits').text.strip.split("   ") #isolates actors by groups (actors per movie)
    
  end




end
