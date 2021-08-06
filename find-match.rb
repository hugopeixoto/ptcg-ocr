#!/usr/bin/env ruby

require 'csv'

entries = CSV
  .new(File.read("pokemon_species_flavor_text.csv"), headers: true)
  .read
  .map(&:to_h)
  .filter { |e| e["language_id"] == "9" }
  .map { |e| [e["flavor_text"], e["flavor_text"].split(/[.,\s]+/)] }

filename = ARGV[0]
text = File.read(filename)
words = text.split(/[.,\s]+/)

entries.sort_by! do |(entry, text_words)|
  -words.count { |word| text_words.include?(word) }
end

File.write("#{filename}.best-entry", entries[0][0])
