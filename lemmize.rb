#!/usr/bin/env ruby

###
# Usage: comment or uncomment (add/remove #) from the begining of print
# lines to customize what kind of file to output.
# Save output with redirection, eg: ./lemmize.rb > tanach.txt
###

require 'rexml/document'

# WLC ordering
books = ['Gen','Exod','Lev','Num','Deut',
				 'Josh','Judg','1Sam','2Sam','1Kgs','2Kgs','Isa','Jer','Ezek',
				 'Hos','Joel','Amos','Obad','Jonah','Mic',
				 'Nah','Hab','Zeph','Hag','Zech','Mal',
				 'Ps','Prov','Job','Song','Ruth','Lam',
				 'Eccl','Esth','Dan','Ezra','Neh','1Chr','2Chr']

books.each do |file|

	doc = REXML::Document.new IO.read('wlc/'+file+'.xml')

	doc.elements.each('osis/osisText/div/chapter/verse') do |verse|
		osis = verse.attribute('osisID')

		# At the verse level
		#print osis, ' '

		verse.elements.each_with_index do |ele, i|
			type = ele.name
			if type=='w' then
				lemma = ele.attributes['lemma'].gsub(/\s+/, "")
				word = ele.text.gsub('/', '').gsub(/\s+/, "")

				# At the word leve.gsub(/\s+/, "")
				#print lemma, ':', word, ' '
				#print lemma, " "
				print osis, " ", lemma, " ", word, "\n"
			end
		end
		
		# end of verse level
		#print "\n"
	end
end
