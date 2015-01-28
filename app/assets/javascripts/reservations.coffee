$(document).ready ->
	lines = $(".day-time")
	dayLines = $(".day-line")
	colHeadings = $(".col-heading")
	select = $("<div id='mouse-selection'><p>Reserve</p></div>")

	lines.hover ->
		this_el = $(this)
		hourWidth = colHeadings.width()
		this_el.append(select).fadeIn('fast')
		select.width(hourWidth)

		this_el.mousemove (e) ->
			pos = e.clientX - dayLines.position().left
			max = this_el.position().left + this_el.width()
			if pos + hourWidth <= max then select.css('left',  pos)
#				 else select.css('left', max - hourWidth)
			console.log(pos)

	lines.mouseleave ->
		this_el = $(this)
		this_el.find(".mouse-selection").remove()
		this_el.unbind('mousemove')
