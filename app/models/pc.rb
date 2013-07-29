require 'open-uri'
class Pc < ActiveRecord::Base
	def self.fetch
		begin
			url = "http://meru.inf.santiago.usm.cl/icinga/cgi-bin/status.cgi?hostgroup=lds&hostgroup=lpa&style=overview&scroll=0&hoststatustypes=4&jsonoutput"
    		@labs = JSON.parse(open(url,:http_basic_authentication=>['icingaadmin', Settings.api_key.icinga]).read)["status"]["hostgroup_overview"].flat_map{|group| group["members"]}.map{|host| host["host_name"]}
		rescue
			puts "Informacion de laboratorios no obtenida"
		end
		return @labs
	end
end
