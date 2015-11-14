#!/bin/env ruby
# encoding: utf-8

require 'scraperwiki'
require 'wikidata/fetcher'

@pages = [
  'Category:Members of the 31st Dáil'
]

@pages.map { |c| WikiData::Category.new(c, 'en').wikidata_ids }.flatten.uniq.each do |id|
  data = WikiData::Fetcher.new(id: id).data('en') or next
  ScraperWiki.save_sqlite([:id], data)
end

require 'rest-client'
warn RestClient.post ENV['MORPH_REBUILDER_URL'], {} if ENV['MORPH_REBUILDER_URL']

