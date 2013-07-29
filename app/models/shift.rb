require 'open-uri'
class Shift < ActiveRecord::Base
	def self.fetch
		begin
	    	base_url = "http://ctm.inf.santiago.usm.cl/pdts"
	    	@turno = open(base_url).read
		rescue
			"Turnos no encontrados"
		end
	end
end
