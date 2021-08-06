#!/usr/bin/env ruby

puts "<meta charset='UTF-8'>"

puts "<style>
div { display: flex; align-items: center; }
div > * { width: 25%; }
span { padding: 5px; border: 1px solid black; }
</style>"

Dir["dataset/*.jpg"].each do |f|
  puts "<div>"
  puts "<img src='#{f}.cropped' />"
  puts "<img src='#{f}.processed' />"
  puts "<span>" + File.read(f + ".processed.txt") + "</span>"
  puts "<span>" + File.read(f + ".processed.txt.best-entry") + "</span>"
  puts "</div>"
end
