$(document).ready ->
	loadActionForm = (container, type) ->
		$.ajax
			url: "/actions/new"
			type: "GET"
			data:
				type: type
				beforeSend: () ->
					container.html("Loading ...")
			success: (responseText) ->
				container.html(responseText)
				$('input.action-id', container).val($('#splash_id').val())
			error: () ->
				container.html("Error!")

	$('form.splash select.type-changer').live 'change', () ->
		loadActionForm $(this).parent().parent(), $(this).val()

	nextPaneClass = "pane"
	$('form.splash a.add_new_action').click (e) ->
		e.preventDefault()
		lastPane = $('form.splash .action_box:last')
		if lastPane.length > 0
			nextPaneClass = if lastPane.hasClass('pane') then "last_pane" else "pane"
		container = $('<div class="action_box">').addClass(nextPaneClass)

		container.appendTo('#actions_list')
		loadActionForm container, $('#new_action_type').val()

		
