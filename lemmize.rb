#!/usr/bin/env ruby

require 'rexml/document'

Dir.glob('wlc/*xml') do |file|

	doc = REXML::Document.new IO.read(file)

	doc.elements.each('osis/osisText/div/chapter/verse') do |verse|
		osis = verse.attribute('osisID')

		print osis

		verse.elements.each_with_index do |ele, i|
			type = ele.name
			if type=='w' then
				lemma =   ele.attributes['lemma'] 
				print " "+lemma
			end
		end
		print "\n"
	end
end
