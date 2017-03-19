require 'hexapdf'


Version=1
Copyright = "version: v#{Version}"

target = HexaPDF::Document.new

recto = HexaPDF::Document.open('_output/cards-white.pdf')
verso = HexaPDF::Document.open('_output/cards-back.pdf')

back = verso.pages[0]

recto.pages.each do |page|
                   target.pages << target.import(page)
                   target.pages << target.import(back)
                 end


#ARGV.each do |file|
#  pdf = HexaPDF::Document.open(file)
#  pdf.pages.each {|page| target.pages << target.import(page)}
#end

target.write("_output/deck-recto-verso.pdf", optimize: true)
