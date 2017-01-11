class Page < ApplicationRecord
  serialize :h1, Array
  serialize :h2, Array
  serialize :h3, Array
  serialize :links, Array
end
