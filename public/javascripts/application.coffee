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
			error: () ->
				container.html("Error!")

	$('form.splash select.type-changer').live 'change', () ->
		loadActionForm $(this).parent().parent(), $(this).val()

	$('form.splash a.delete_action').live 'click', () ->
		container = $(this).parent()
		$('input.destroy_action', container).val(1)
		container.hide()

	$('form.splash a.add_new_action').click (e) ->
		e.preventDefault()
		container = $('<div class="action_box">').addClass(nextPaneClass)

		container.appendTo('#actions_list')
		loadActionForm container, $('#new_action_type').val()
	
	$('form.splash a.add_new_code').click (e) ->
		e.preventDefault()
		container = $('#codes_list')
		$.ajax
			url: "/codes/new"
			type: "GET"
			success: (responseText) ->
				container.append(responseText)
				$('input.splash_id', container).val($('#splash_id').val())
			error: () ->
				container.append("Error loading new code! Please try again.")
				

