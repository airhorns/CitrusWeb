(function() {
  $(document).ready(function() {
    var loadActionForm;
    loadActionForm = function(container, type) {
      return $.ajax({
        url: "/actions/new",
        type: "GET",
        data: {
          type: type,
          beforeSend: function() {
            return container.html("Loading ...");
          }
        },
        success: function(responseText) {
          return container.html(responseText);
        },
        error: function() {
          return container.html("Error!");
        }
      });
    };
    $('form.splash select.type-changer').live('change', function() {
      return loadActionForm($(this).parent().parent(), $(this).val());
    });
    $('form.splash a.delete_action').live('click', function() {
      var container;
      container = $(this).parent();
      $('input.destroy_action', container).val(1);
      return container.hide();
    });
    $('form.splash a.add_new_action').click(function(e) {
      var container;
      e.preventDefault();
      container = $('<div class="action_box">').addClass(nextPaneClass);
      container.appendTo('#actions_list');
      return loadActionForm(container, $('#new_action_type').val());
    });
    return $('form.splash a.add_new_code').click(function(e) {
      var container;
      e.preventDefault();
      container = $('#codes_list');
      return $.ajax({
        url: "/codes/new",
        type: "GET",
        success: function(responseText) {
          container.append(responseText);
          return $('input.splash_id', container).val($('#splash_id').val());
        },
        error: function() {
          return container.append("Error loading new code! Please try again.");
        }
      });
    });
  });
}).call(this);
