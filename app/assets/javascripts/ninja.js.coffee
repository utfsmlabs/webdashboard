document.onkeydown = (e)->
	keyCode = e.keyCode || e.which
	arrow = {left: 37, up: 38, right: 39, down: 40 }
	action = {enter: 13, escape: 27}
	if $('.subselected').length != 0
		switch (keyCode)
			when arrow.left then movecam('left')
			when arrow.right then movecam('right')
			when action.enter then entercam($('.subselected').first())
			when action.escape then  escapecam($('.subselected').first())  	
	else
		switch (keyCode)
			when arrow.left then move('left')
			when arrow.up then move('up')
			when arrow.right then move('right')
			when arrow.down then move('down')
			when action.enter then enter($('.selected').first())
			when action.escape then  escape($('.selected').first())

select = (elem)->
	elem.addClass("selected")
	elem.tooltip()
unselect = (elem) ->
	elem.removeClass("selected")

enter = (elem) ->
	if elem.attr('href')
		window.location = elem.attr('href')
	else
		if elem.attr('id')=='centerpanel'
			unselect($('#centerpanel'))
			$('#centerpanel').addClass('sub-selected')
			$('#cam2').addClass('subselected')

escape = (elem) ->
	if elem.hasClass('selected')
		unselect(elem)
	else
		if $('.selected').length == 0
			window.location = '/'

entercam = (elem) ->
	elem.addClass('modalizado')
	$('#modalcam'+elem.attr('camara_id')).modal('show')
	TIMEOUT2 = 300;
	refreshInterval2 = setInterval(->
		random = Math.floor(Math.random() * Math.pow(2, 31))
		$('img#modcamera'+elem.attr('camara_id')).attr('src', 'http://localhost:3001/camera'+elem.attr('camara_id')+'?i=' + random)
	, TIMEOUT2);	

escapecam = (elem) ->
	if elem.hasClass('modalizado')
		elem.removeClass('modalizado')
		$('#modalcam'+elem.attr('camara_id')).modal('hide')
		$('img#modcamera'+elem.attr('camara_id')).attr('src','')
	else
		if $('.subselected').length != 0
			$('.subselected').first().removeClass('subselected')
			select($('#centerpanel'))
			$('#centerpanel').removeClass('sub-selected')

move = (position) ->
	switch $('.selected').first().attr('id')
		when 'leftpanel'
			switch position
				when 'right'
					unselect($('#leftpanel'))
					select($('#centerpanel'))
				when 'up'
					unselect($('#leftpanel'))
					select($('#upperpanel'))
				when 'down'
					unselect($('#leftpanel'))
					select($('#bottompanel'))

		when 'rightpanel'
			switch position
				when 'left'
					unselect($('#rightpanel'))
					select($('#centerpanel'))
				when 'up'
					unselect($('#rightpanel'))
					select($('#upperpanel'))
				when 'down'
					unselect($('#rightpanel'))
					select($('#bottompanel'))

		when 'centerpanel'
			switch position
				when 'left'
					unselect($('#centerpanel'))
					select($('#leftpanel'))
				when 'right'
					unselect($('#centerpanel'))
					select($('#rightpanel'))
				when 'up'
					unselect($('#centerpanel'))
					select($('#upperpanel'))
				when 'down'
					unselect($('#centerpanel'))
					select($('#bottompanel'))

		when 'upperpanel'
			switch position
				when 'left'
					unselect($('#upperpanel'))
					select($('#leftpanel'))
				when 'right'
					unselect($('#upperpanel'))
					select($('#rightpanel'))
				when 'down'
					unselect($('#upperpanel'))
					select($('#centerpanel'))

		when 'bottompanel'
			switch position
				when 'left'
					unselect($('#bottompanel'))
					select($('#leftpanel'))
				when 'right'
					unselect($('#bottompanel'))
					select($('#rightpanel'))
				when 'up'
					unselect($('#bottompanel'))
					select($('#centerpanel'))
		else
			switch position
				when 'left'
					select($('#centerpanel'))
				when 'right'
					select($('#centerpanel'))
				when 'up'
					select($('#bottompanel'))
				when 'down'
					select($('#centerpanel'))


movecam = (position) ->
	selected = $('.subselected').first();
	switch selected.attr('id')
		when 'cam1'
			switch position
				when 'left'
					selected.removeClass('subselected')
				when 'right'
					selected.removeClass('subselected')
					$('#cam2').addClass('subselected')
		when 'cam2'
			switch position
				when 'left'
					selected.removeClass('subselected')
					$('#cam1').addClass('subselected')
				when 'right'
					selected.removeClass('subselected')
					$('#cam3').addClass('subselected')
		when 'cam3'
			switch position
				when 'left'
					selected.removeClass('subselected')
					$('#cam2').addClass('subselected')
				when 'right'
					selected.removeClass('subselected')


TIMEOUT = 1000;
refreshInterval = setInterval(->
	random = Math.floor(Math.random() * Math.pow(2, 31))
	$('img#camera1').attr('src', 'http://localhost:3001/camera1?i=' + random)
	$('img#camera2').attr('src', 'http://localhost:3001/camera2?i=' + random)
	$('img#camera3').attr('src', 'http://localhost:3001/camera3?i=' + random)
, TIMEOUT);	

