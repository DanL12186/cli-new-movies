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
      movie.summary  =  mov.css('div.show-more-hidden p.media-content').text.strip #issue: short summaries not listed due to using diff div.
      movie.genre    =  mov.css('p span.label').text.strip
      movie.rating   =  mov.css('ins.mpaa').to_s.scan(/\d/).join #mpaa rating as "int"

      movie.mpaa #calls mpaa method and converts all ratings from string-nums==> ratings
    end
   self.all
  end

  def mpaa #would prefer to map to a hash if I knew how.
    @@all.each do |mov|
      if mov.rating.empty? #class-specific. blank didn't work. works for empty strings.
        mov.rating = "No rating available"
      elsif mov.rating == '1'
        mov.rating = "G"
      elsif mov.rating == '2'
        mov.rating = "PG"
      elsif mov.rating == '3'
        mov.rating = "PG-13"
      elsif mov.rating == '4'
        mov.rating = "R"
      elsif mov.rating == '6'
        mov.rating = "Unrated"
      else
        mov.rating = mov.rating
      end
    end
  end

  def self.all
    @@all
  end

end
