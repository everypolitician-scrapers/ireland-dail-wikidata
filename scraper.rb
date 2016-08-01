#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

en_names = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://en.wikipedia.org/wiki/Members_of_the_32nd_D%C3%A1il',
  after: '//h2[span[@id="TDs_by_party"]]',
  xpath: '//table[1]//td[position() = last() - 1]//a[not(@class="new")]/@title',
) 
  
names = WikiData::Category.new( 'Category:Members of the 31st Dáil', 'en').member_titles |
        WikiData::Category.new( 'Category:Members of the 32nd Dáil', 'en').member_titles |
        en_names

EveryPolitician::Wikidata.scrape_wikidata(names: { en: names }, output: false)
