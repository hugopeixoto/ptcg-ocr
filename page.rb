#!/usr/bin/env ruby

puts "<meta charset='UTF-8'>"

puts "<style>
div.flavors { display: flex; align-items: center; }
div.flavors > * { width: 25%; }
span { padding: 5px; border: 1px solid black; }

div.colors { display: flex; }
div.colors > * { width: 100px; height: 100px; }
</style>"

Dir["dataset/*.jpg"].each do |f|
  pc = File.read(f + ".cropped.color").split(',').map(&:to_i)
  brightness = 0.21*pc[0] + 0.72*pc[1] + 0.07*pc[2]
  fgcolor = if brightness < 100 then 'white' else 'black' end

  puts "<div class='flavors'>"
  puts "<img src='#{f}.cropped' />"
  puts "<img src='#{f}.cropped.processed' />"
  puts "<span style='color: #{fgcolor}; background-color: rgb(#{pc.join(',')})'>" + File.read(f + ".cropped.processed.txt") + "</span>"
  puts "<span>" + File.read(f + ".cropped.processed.txt.best-entry") + "</span>"
  puts "</div>"
end
