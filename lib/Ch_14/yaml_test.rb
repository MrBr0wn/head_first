# frozen_string_literal: true

require './lib/movie'
require 'yaml/store'

store = YAML::Store.new('test.yml')

first = Movie.new
first.title = 'Spirited Away'
first.director = 'Hayao Miyazaki'
first.year = 2001

second = Movie.new
second.title = 'Inception'
second.director = 'Christopher Nolan'
second.year = 2010

store.transaction do
  store['Spirited Away'] = first
  store['Inception'] = second

  p store['Inception']
end
