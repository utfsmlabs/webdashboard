document.onkeydown = (e)->
  keyCode = e.keyCode || e.which
  arrow = {left: 37, up: 38, right: 39, down: 40 }
  switch (keyCode)
    when arrow.left then move('left')
    when arrow.up then move('up')
    when arrow.right then move('right')
    when arrow.down then move('down')

select = (elem)->
	elem.addClass("selected")
unselect = (elem) ->
	elem.removeClass("selected")

select($('#leftpanel'))

move = (position) ->
	switch $('.selected').first().attr('id')
		when 'leftpanel'
			switch position
				when 'right'
					unselect($('#leftpanel'))
					select($('#centerpanel'))
				when 'up'
					unselect($('#leftpanel'))
					select($('#toppanel'))
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
					select($('#toppanel'))
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


