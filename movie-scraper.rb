NewMovies::Movie_Scraper

class Movie_Scraper
  @@all = []

  attr_reader :name, :starring, :summary

  def initialize(name="")#, starring=[], summary="")
    @name = self.namescrape[movie_names]
    # @starring = starring
    # @summary = self.namescrape[summaries]
    @@all << self
  end


  def self.namescrape
    page = Nokogiri::HTML(open('http://www.movieinsider.com/movies/coming-soon')) #movieinsider/new-movies main
    movie_names = page.css('h4.media-heading a').text.strip.split("  ") #grabs names.to_a ["Harry Potter", "The Bourne Identity", "Serenity", "The Matrix,"] etc.
    movie_names.collect {|name| NewMovies::Movie_Scraper.new(name)} #should create a new Movie_Scraper object w/name for each on list
    # starring = page.css('p.credits').text.strip.split("   ") #isolates actors by groups (actors per movie)
    #summaries = page.css('div.show-more-hidden p.media-content').text.strip.split("  ") #grabs movie summaries
    # #ratings =       #s.scan(/\d+/).first (mpaa rating)
    # genres = page.css('p span.label').text.strip
  end

  # def name=(name)
  #   @name= self.namescrape
  # end


  def self.all
    @@all
  end

  end






end
