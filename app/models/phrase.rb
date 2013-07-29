#encoding: utf-8
require 'open-uri'
require 'nokogiri'	
class Phrase < ActiveRecord::Base
	def self.fetch
		begin
			doc = Nokogiri::HTML(open('http://primos.inf.santiago.usm.cl/frases'))
		    doc.encoding = 'UTF-8'
			@frase = doc.css('.quote').children.text
			unless Phrase.first.nil?
				p = Phrase.first
				p.number = @frase.split("(")[0].split("#")[1]
				p.message = @frase
				p.save
			else
				p = Phrase.new
				p.message = @frase.split("-]")[1]
				p.number = @frase.split("(")[0].split("#")[1]
				p.save
			end
		rescue Exception => e
			puts "Frase del dia no encontrada: #{e}"
		end
		return Phrase.first
	end
end
