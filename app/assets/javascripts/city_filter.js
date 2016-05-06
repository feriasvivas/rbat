var CityFilter = {
  setup: function() {
    $('#state').change(CityFilter.list);
  },
  list: function() {
    if ($('#state').val()) {
      CityFilter.submit($('#state').val());
    } else {
      $("#incident_city_id option").remove();
    }
  },
  submit: function(state_id) {
    $.ajax({type: 'GET',
            url: '/cities/'+state_id,
            timeout: 5000,
            success: CityFilter.updateCities,
            error: function(xhrObj, textStatus, exception) {alert('Erro ao carregar cidades!\n'+exception);},
            });
    return(false);
  },
  updateCities: function(data, requestStatus, xhrObject) {
    $('#incident_city_id').replaceWith(data);
    return(false);
  }
}

$(document).on('page:load', function(){
   CityFilter.setup();
});
