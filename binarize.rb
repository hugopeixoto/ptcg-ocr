#!/usr/bin/env ruby

palette = [
  { type: 'grass',     color: [145,189, 74], threshold: '60%' },
  { type: 'metal',     color: [170,181,184], threshold: '45%' },
  { type: 'lightning', color: [236,197, 40], threshold: '60%' },
  { type: 'psychic',   color: [152,100,160], threshold: '50%' },
  { type: 'water',     color: [ 42,164,211], threshold: '60%' },
  { type: 'fire',      color: [223, 96, 61], threshold: '60%' },
  { type: 'fighting',  color: [200,126, 44], threshold: '60%' },
  { type: 'dark',      color: [ 32, 54, 52], threshold: '60%' },
  { type: 'colorless', color: [213,209,204], threshold: '60%' },
]

r,g,b = File.read(ARGV[0]).split(',').map(&:to_i)

pc = palette.min_by do |p|
  (pr,pg,pb) = p[:color]
  Math.sqrt((r - pr).abs**2 + (g - pg).abs**2 + (b - pb).abs**2)
end

if pc[:type] == 'dark'
  puts "-threshold #{pc[:threshold]} -negate"
else
  puts "-threshold #{pc[:threshold]}"
end
