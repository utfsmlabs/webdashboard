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
		when 'sda'
			switch position
				when 'right'
					unselect($('#sda'))
					select($('#lpa'))
				when 'up'
					unselect($('#sda'))
					select($('#ninja'))
				when 'down'
					unselect($('#sda'))
					select($('#tasks'))

		when 'lds'
			switch position
				when 'left'
					unselect($('#lds'))
					select($('#lpa'))
				when 'up'
					unselect($('#lds'))
					select($('#ninja'))
				when 'down'
					unselect($('#lds'))
					select($('#tasks'))

		when 'lpa'
			switch position
				when 'left'
					unselect($('#lpa'))
					select($('#sda'))
				when 'right'
					unselect($('#lpa'))
					select($('#lds'))
				when 'up'
					unselect($('#lpa'))
					select($('#ninja'))
				when 'down'
					unselect($('#lpa'))
					select($('#tasks'))

		when 'ninja'
			switch position
				when 'left'
					unselect($('#ninja'))
					select($('#sda'))
				when 'right'
					unselect($('#ninja'))
					select($('#lds'))
				when 'down'
					unselect($('#ninja'))
					select($('#lpa'))

		when 'tasks'
			switch position
				when 'left'
					unselect($('#tasks'))
					select($('#sda'))
				when 'right'
					unselect($('#tasks'))
					select($('#lds'))
				when 'up'
					unselect($('#tasks'))
					select($('#lpa'))
		else
			switch position
				when 'left'
					select($('#lds'))
				when 'right'
					select($('#sda'))
				when 'up'
					select($('#tasks'))
				when 'down'
					select($('#ninja'))

