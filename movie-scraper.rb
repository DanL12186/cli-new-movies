NewMovies::Movie_Scraper

class Movie_Scraper
  @@all = []

  attr_accessor :starring, :summary, :name, :genre

  def initialize(name="")#, starring=[], summary="")
    @name = name
    # @starring = starring
    # @summary = summary
    @@all << self
  end

  def self.namescrape #div.panel.each do
    page = Nokogiri::HTML(open('http://www.movieinsider.com/movies/coming-soon')) #movieinsider/new-movies main
    page.css('div.panel').collect do |mov|
      movie = Movie_Scraper.new
      movie.name= mov.css('h4.media-heading a').text.strip.split("  ")#, page.css('p span.label').text.strip  #grabs names.to_a ["Harry Potter", "The Bourne]
      movie.starring= mov.css('p.credits').text.strip.split("   ") #isolates actors by groups (actors per movie)
      movie.summary = mov.css('div.show-more-hidden p.media-content').text.strip.split("  ") #grabs movie summaries
      movie.genre = mov.css('p span.label').text.strip
      #ratings =       #s.scan(/\d+/).first (mpaa rating)
    #self.all
    movie
    end
  end

  # def name=(name)
  #   @name= self.namescrape
  # end


  def self.all
    @@all
  end


end
