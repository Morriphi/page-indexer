require 'minitest/autorun'
require 'parser'

class ParserTest < Minitest::Test
  def initialize t
    super
    @expectedUrl = 'http://www.someurl.com'
  end
  
  def test_creating_parser
    assert(Parser.new(nil, nil) != nil)
  end
  
  def test_parsing_empty_document
    request = MiniTest::Mock.new
    request.expect :get, '', [@expectedUrl]

    repository = MiniTest::Mock.new
    repository.expect :save, nil, [ {url: @expectedUrl, h1: [], h2: [], h3: [], links: []} ]

    parser = Parser.new request, repository
    parser.parse @expectedUrl

    request.verify
    repository.verify
  end

  def test_parsing_h1
    request = MiniTest::Mock.new
    request.expect :get, '<html><h1>Heading One</h1></html>', [@expectedUrl]

    repository = MiniTest::Mock.new
    repository.expect :save, nil, [{url: @expectedUrl, h1: ['Heading One'], h2: [], h3: [], links: []} ]

    parser = Parser.new request, repository
    parser.parse @expectedUrl

    repository.verify
  end

  def test_parsing_multiple_h1
    request = MiniTest::Mock.new
    request.expect :get, '<html><h1>Heading One</h1><h1>Heading Two</h1></html>', [@expectedUrl]

    repository = MiniTest::Mock.new
    repository.expect :save, nil, [{url: @expectedUrl, h1: ['Heading One', 'Heading Two'], h2: [], h3: [], links: []} ]

    parser = Parser.new request, repository
    parser.parse @expectedUrl

    repository.verify
  end

  def test_parsing_h2
    request = MiniTest::Mock.new
    request.expect :get, '<html><h2>Subheading One</h2></html>', [@expectedUrl]

    repository = MiniTest::Mock.new
    repository.expect :save, nil, [{url: @expectedUrl, h1: [], h2: ['Subheading One'], h3: [], links: []} ]

    parser = Parser.new request, repository
    parser.parse @expectedUrl

    repository.verify
  end

  def test_parsing_multiple_h2
    request = MiniTest::Mock.new
    request.expect :get, '<html><h2>Subheading One</h2><h2>Subheading Two</h2></html>', [@expectedUrl]

    repository = MiniTest::Mock.new
    repository.expect :save, nil, [{url: @expectedUrl, h1: [], h2: ['Subheading One', 'Subheading Two'], h3: [], links: []} ]

    parser = Parser.new request, repository
    parser.parse @expectedUrl

    repository.verify
  end

  def test_parsing_h3
    request = MiniTest::Mock.new
    request.expect :get, '<html><h3>Sub-subheading One</h3></html>', [@expectedUrl]

    repository = MiniTest::Mock.new
    repository.expect :save, nil, [{url: @expectedUrl, h1: [], h2: [], h3: ['Sub-subheading One'], links: []} ]

    parser = Parser.new request, repository
    parser.parse @expectedUrl

    repository.verify
  end

  def test_parsing_multiple_h3
    request = MiniTest::Mock.new
    request.expect :get, '<html><h3>Sub-subheading One</h3><h3>Sub-subheading Two</h3></html>', [@expectedUrl]

    repository = MiniTest::Mock.new
    repository.expect :save, nil, [{url: @expectedUrl, h1: [], h2: [], h3: ['Sub-subheading One', 'Sub-subheading Two'], links: []} ]

    parser = Parser.new request, repository
    parser.parse @expectedUrl

    repository.verify
  end

  def test_parsing_single_link
    request = MiniTest::Mock.new
    request.expect :get, '<html><a href="http://link.one">Link One</a></html>', [@expectedUrl]

    repository = MiniTest::Mock.new
    repository.expect :save, nil, [{url: @expectedUrl, h1: [], h2: [], h3: [], links: ['http://link.one'] }]


    parser = Parser.new request, repository
    parser.parse @expectedUrl

    repository.verify
  end

  def test_parsing_multiple_links
    request = MiniTest::Mock.new
    request.expect :get, '<html><a href="http://link.one">Link One</a><a href="http://link.two">Link Two</a></html>', [@expectedUrl]

    repository = MiniTest::Mock.new
    repository.expect :save, nil, [{url: @expectedUrl, h1: [], h2: [], h3: [], links: ['http://link.one', 'http://link.two'] }]


    parser = Parser.new request, repository
    parser.parse @expectedUrl

    repository.verify
  end
end
