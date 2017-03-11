NewMovies::Movie_Scraper

class Movie_Scraper
  @@all = []

  attr_accessor :starring, :summary, :name, :genre, :rating

  def initialize#(name="")#, starring=[], summary="")
    #@name = name
    # @starring = starring
    # @summary = summary
    @@all << self
  end

  def self.namescrape #div.panel.each do
    page = Nokogiri::HTML(open('http://www.movieinsider.com/movies/coming-soon')) #movieinsider/new-movies main

    page.css('div.panel').collect do |mov| #moov
      movie = Movie_Scraper.new() #will of course have to change this to NewMovies::Movie_Scraper later

      movie.name= mov.css('h4.media-heading a').text.strip.split("  ").join#, page.css('p span.label').text.strip  #grabs names.to_a ["Harry Potter", "Serenity"]
      movie.starring= mov.css('p.credits').text.strip.split("   ") #isolates actors by groups (actors per movie)
      movie.summary = mov.css('div.show-more-hidden p.media-content').text.strip.split("  ").join #grabs movie summaries
      movie.genre = mov.css('p span.label').text.strip
      movie.rating = mov.css('ins.mpaa').to_s.scan(/\d+/).join.to_i #(mpaa rating)
      #self.all
      movie
    end
  end

  def self.all
    @@all
  end


end
