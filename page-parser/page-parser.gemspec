Gem::Specification.new do |s|
  s.name = 'page-parser'
  s.version = '0.0.5'
  s.date = '2017-01-09'
  s.description = 'Extracts h1, h2, h3 and links from html documents'
  s.summary = 'Page Parser'
  s.authors = ['Philip Morris']
  s.email = 'philiplmorris@googlemail.com'
  s.files = ['lib/parser.rb', 'lib/document.rb']
  s.license = 'MIT'
  s.add_runtime_dependency "nokogiri",
    ["= 1.7.0.1"]
  s.add_development_dependency "nokogiri",
    [">= 1.7.0.1"]
end
