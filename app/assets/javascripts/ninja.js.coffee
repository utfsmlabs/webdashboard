document.onkeydown = (e)->
  keyCode = e.keyCode || e.which
  arrow = {left: 37, up: 38, right: 39, down: 40 }
  action = {enter: 13, escape: 27}
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

escape = (elem) ->
	if elem.hasClass('selected')
		unselect(elem)
	else
		if $('.selected').length == 0
			window.location = '/'

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
					select($('#rightpanel'))
				when 'right'
					select($('#leftpanel'))
				when 'up'
					select($('#bottompanel'))
				when 'down'
					select($('#upperpanel'))

