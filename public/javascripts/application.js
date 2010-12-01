(function() {
  $(document).ready(function() {
    var loadActionForm;
    loadActionForm = function(container, type, index) {
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
          var html;
          html = $('<div/>').append(responseText.replace(/NEW_RECORD/g, index)).find('.pluck')[0].innerHTML;
          return container.html(html);
        },
        error: function() {
          return container.html("Error!");
        }
      });
    };
    $('form.splash select.type-changer').live('change', function(e) {
      var index;
      index = /\[actions_attributes\]\[(\d+)\]/.exec(this.name);
      if ((index != null) && (index[1] != null)) {
        loadActionForm($(this).parent().parent(), $(this).val(), index[1]);
        return true;
      } else {
        alert("Error!");
        e.preventDefault();
        return false;
      }
    });
    $('form.splash a.delete_action').live('click', function(e) {
      var container;
      container = $(this).parent();
      $('input.destroy_action', container).val(1);
      return container.hide();
    });
    $('form.splash a.add_new_action').click(function(e) {
      var container, index;
      e.preventDefault();
      container = $('<div class="action_box">');
      container.appendTo('#actions_list');
      index = $("#actions_list .action_box").length;
      return loadActionForm(container, $('#new_action_type').val(), index + 1);
    });
    return $('form.splash a.add_new_code').click(function(e) {
      var container;
      e.preventDefault();
      container = $('#codes_list');
      return $.ajax({
        url: "/codes/new",
        type: "GET",
        success: function(responseText) {
          var html;
          html = $('<div/>').append(responseText.replace(/NEW_RECORD/g, $('.code_box', container).length + 1)).find('.pluck')[0].innerHTML;
          container.append(html);
          return $('input.splash_id', container).val($('#splash_id').val());
        },
        error: function() {
          return container.append("Error loading new code! Please try again.");
        }
      });
    });
  });
}).call(this);
