NewMovies::Movie_Scraper

class Movie_Scraper
  @@all = []

  attr_accessor :starring, :summary, :name, :genre, :rating

  def initialize
    @@all << self #might make more sense to put this in the scraper method..
  end

  def self.namescrape #div.panel.each do
    page = Nokogiri::HTML(open('http://www.movieinsider.com/movies/coming-soon')) #movieinsider/new-movies main

    page.css('div.panel').collect do |mov| #collect from each 'moov resource'
      movie = Movie_Scraper.new() #will of course have to change this to NewMovies::Movie_Scraper later

      movie.name     =  mov.css('h4.media-heading a').text.strip.split("  ").join #grabs names.to_a ["Harry Potter", "Serenity"]
      movie.starring =  mov.css('p.credits').text.strip.split("   ") #isolates actors by groups (actors per movie)
      movie.summary  =  mov.css('div.show-more-hidden p.media-content').text.strip.split("  ").join #.mpaa #grabs movie summaries
      movie.genre    =  mov.css('p span.label').text.strip
      movie.rating   =  mov.css('ins.mpaa').to_s.scan(/\d+/).join.to_i #(mpaa rating); probably doesn't need to be converted to an int here actually(or +)

      movie #Returns collected array, I believe. Only just realized I did this..
    end
  end

  def self.all
    @@all
  end

end
