(function() {
  $(document).ready(function() {
    var loadActionForm, nextPaneClass;
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
          container.html(responseText);
          return $('input.action-id', container).val($('#splash_id').val());
        },
        error: function() {
          return container.html("Error!");
        }
      });
    };
    $('form.splash select.type-changer').live('change', function() {
      return loadActionForm($(this).parent().parent(), $(this).val());
    });
    nextPaneClass = "pane";
    return $('form.splash a.add_new_action').click(function(e) {
      var container, lastPane;
      e.preventDefault();
      lastPane = $('form.splash .action_box:last');
      if (lastPane.length > 0) {
        nextPaneClass = lastPane.hasClass('pane') ? "last_pane" : "pane";
      }
      container = $('<div class="action_box">').addClass(nextPaneClass);
      container.appendTo('#actions_list');
      return loadActionForm(container, $('#new_action_type').val());
    });
  });
}).call(this);
