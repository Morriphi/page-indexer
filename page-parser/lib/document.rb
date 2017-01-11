require 'nokogiri'

class Document
  def initialize html
    @doc = Nokogiri::HTML html
  end

  def textFor element
    @doc.css(element).map { |e| e.text }
  end

  def links
    @doc.css('a').map { |a| a['href'] }
  end
end
