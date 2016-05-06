var SupervisorFilter = {
  setup: function() {
    $('#user_institution_id').change(SupervisorFilter.list);
    $('#user_roles').change(SupervisorFilter.isResearcher);
  },
  isResearcher: function() {
    //$('#user_supervisor_id').prop("disabled", ($('#user_roles').val() != 4));
    if ($('#user_roles').val() != 4)
      $('#user_supervisor_id').empty();
    else {
      SupervisorFilter.list();
    }
  },
  list: function() {
    if ($('#user_institution_id').val()) {
      SupervisorFilter.submit($('#user_institution_id').val());
    } else {
      $("#user_supervisor_id option").remove();
    }
  },
  submit: function(institution_id) {
    $.ajax({type: 'GET',
            url: '/users/'+institution_id,
            timeout: 5000,
            success: SupervisorFilter.updateSupervisors,
            error: function(xhrObj, textStatus, exception) {alert('Erro ao carregar supervisores!\n'+exception);},
            });
    return(false);
  },
  updateSupervisors: function(data, requestStatus, xhrObject) {
    $('#user_supervisor_id').replaceWith(data);
    return(false);
  }
}

$(document).on('page:load', function(){
   SupervisorFilter.setup();
});
