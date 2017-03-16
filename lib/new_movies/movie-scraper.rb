class NewMovies::Movie_Scraper
  @@all = []

  attr_accessor :name, :starring, :summary, :genre, :rating

  def initialize
    @@all << self #might make more sense to put this in the scraper method..
  end

  def self.namescrape
    page = Nokogiri::HTML(open('http://www.movieinsider.com/movies/coming-soon')) #page to scrape

    page.css('div.panel').each do |mov|
      movie = NewMovies::Movie_Scraper.new()

      movie.name     =  mov.css('h4.media-heading a').text.strip
      movie.starring =  mov.css('p.credits').text.strip
      movie.summary  =  mov.css('div.show-more-hidden p.media-content').text.strip
      movie.genre    =  mov.css('p span.label').text.strip
      movie.rating   =  mov.css('ins.mpaa').to_s.scan(/\d/).join #mpaa rating as "int"

      movie.mpaa #calls mpaa method and converts all ratings from string-nums==> ratings
      movie.summary == "" ? movie.summary = mov.css('p.media-content').text.strip : movie.summary = movie.summary #ugly :/
    end
   self.all
  end

  def mpaa #would prefer to map to a hash if I knew how.
    @@all.each do |mov|
      case mov.rating
      when ''
        mov.rating = "No rating available"
      when '1'
        mov.rating = "G"
      when '2'
        mov.rating = "PG"
      when '3'
        mov.rating = "PG-13"
      when '4'
        mov.rating = "R"
      when '6'
        mov.rating = "Unrated"
      end
    end
  end

  def self.all
    @@all
  end

end
