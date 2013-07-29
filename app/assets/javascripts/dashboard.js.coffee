# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#icinga cada 30s
#r_icinga = setInterval () ->
#	$('#icinga').load(location.href+"dashboard/icinga")
#,30000

#servidores cada 30s
#r_servicios = setInterval () ->
#	$('#servicios').load(location.href+"dashboard/servicios")
#,30000

#frases cada 1 dia = 24h = 86400s
r_frases = 
	setInterval () ->
		$('#frases').load(location.href+"dashboard/frases")
	,86400000

#red cada 5m
#r_red = setInterval () ->
#	xred()
#,300000

#tareas cada 1h = 60m = 3600s
#r_code = setInterval () ->
#	$('#code').load(location.href+"dashboard/code")
#,3600000

not ((d, s, id) ->
  js = undefined
  fjs = d.getElementsByTagName(s)[0]
  p = (if /^http:/.test(d.location) then "http" else "https")
  unless d.getElementById(id)
    js = d.createElement(s)
    js.id = id
    js.src = p + "://platform.twitter.com/widgets.js"
    fjs.parentNode.insertBefore js, fjs
) document, "script", "twitter-wjs"

#turnos cada 5m = 300s
r_turnos =
	setInterval () ->
		$('#turno').load(location.href+"dashboard/turno")
	,300000

r_turnos()
r_frases()