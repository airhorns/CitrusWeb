$(document).ready ->
	loadActionForm = (container, type, index) ->
		$.ajax
			url: "/actions/new"
			type: "GET"
			data:
				type: type
				beforeSend: () ->
					container.html("Loading ...")
			success: (responseText) ->
				html = $('<div/>').append(responseText.replace(/NEW_RECORD/g, index)).find('.pluck')[0].innerHTML
				container.html html
			error: () ->
				container.html("Error!")

	$('form.splash select.type-changer').live 'change', (e) ->
		index = /\[actions_attributes\]\[(\d+)\]/.exec(this.name)
		if index? && index[1]?
			loadActionForm $(this).parent().parent(), $(this).val(), index[1]
			return true
		else
			alert("Error!")
			e.preventDefault()
			return false

	$('form.splash a.delete_action, form.splash a.delete_code').live 'click', (e) ->
		container = $(this).parent()
		$('input.destroy', container).val(1)
		container.hide()

	$('form.splash a.add_new_action').click (e) ->
		e.preventDefault()
		container = $('<div class="action_box">')
		container.appendTo('#actions_list')
		index = $("#actions_list .action_box").length
		loadActionForm container, $('#new_action_type').val(), index+1
	
	$('form.splash a.add_new_code').click (e) ->
		e.preventDefault()
		container = $('#codes_list')
		$.ajax
			url: "/codes/new"
			type: "GET"
			success: (responseText) ->
				html = $('<div/>').append(responseText.replace(/NEW_RECORD/g,$('.code_box', container).length+1)).find('.pluck')[0].innerHTML
				container.append html
				$('input.splash_id', container).val($('#splash_id').val())
			error: () ->
				container.append("Error loading new code! Please try again.")

