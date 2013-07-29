#encoding: utf-8
require 'open-uri'
class Task < ActiveRecord::Base
	has_many :task_comment, dependent: :destroy
	def self.fetch
		begin
			base_url = "http://code.inf.santiago.usm.cl/projects/primos/issues"
			issue_url = "http://code.inf.santiago.usm.cl/issues"
			code_api = Settings.api_key.code #API KEY DASHBOARD USER
			json_end = ".json?key="+code_api+"&limit=11"
			incluir_changesets = "&include=changesets,journals"
			@tareas = JSON.parse(open(base_url+json_end).read)['issues']
			@tareas.each do |issue|
				sub_url = "/"+issue['id'].to_s
				@extras = JSON.parse(open(issue_url+sub_url+json_end+incluir_changesets).read)['issue']['journals']
				issue['journals'] = @extras 
			end
			puts "parte 1 check"
			puts "total de tareas recuperadas: " + @tareas.count.to_s
			#ahora que se tienen las tareas mas los comentarios, a revisar si existen en la bd
			@tareas.each do |issue|
				puts "recuperando tarea numero: " + issue['id'].to_s
				if Task.where(:number=>issue['id']).empty?
					tarea = Task.new
					tarea.name = issue['subject']
					tarea.number = issue['id']
					tarea.status = issue['status']['name']
					tarea.percentage = issue['done_ratio']
					tarea.assigned_user = issue['assigned_to']['name'] unless issue['assigned_to'].nil?
					tarea.description = issue['description']
					tarea.save()
					puts "revisando detalles ahora"
					unless issue['journals'].nil? 
						issue['journals'].each do |desc|
							tc = TaskComment.new
							tc.message = desc['notes']
							tc.message_date = desc['created_on']
							tc.task_id = tarea.id
							tc.comment_user = desc['user']['name']
							tc.save()
							puts tc.inspect
						end
					end
				end
			end
		rescue
			"Ha fallado la obtención o actualización de Tareas"
		end
	end
end
