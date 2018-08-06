#!/bin/env ruby
# encoding: utf-8

require 'everypolitician'
require 'wikidata/fetcher'

sparq = 'SELECT ?item WHERE { ?item wdt:P39 wd:Q654291 }'
members = EveryPolitician::Wikidata.sparql(sparq)
EveryPolitician::Wikidata.scrape_wikidata(ids: members, batch_size: 500)
