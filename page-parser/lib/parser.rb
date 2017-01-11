require 'document'

class Parser
  def initialize request, repository
    @request = request
    @repository = repository
  end

  def parse url
    html = @request.get url
    @repository.save process(html).merge({url: url})
  end 

  private
  def process html
    doc = Document.new html
    { h1: doc.textFor('h1'), 
      h2: doc.textFor('h2'), 
      h3: doc.textFor('h3'), 
      links: doc.links }
  end
end

