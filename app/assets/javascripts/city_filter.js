var CityFilter = {
  setup: function() {
    $('#state').change(CityFilter.list);
  },
  list: function() {
    if ($('#state').val()) {
      CityFilter.submit($('#state').val());
    } else {
      $("#incident_city option").remove();
    }
  },
  submit: function(state_id) {
    $.ajax({type: 'GET',
            url: '/cities/'+state_id,  //no meu caso não é isso
            timeout: 5000,
            success: CityFilter.updateCities,
            error: function(xhrObj, textStatus, exception) {alert('Erro ao carregar cidades!\n'+exception);},
            });
    return(false);
  },
  updateCities: function(data, requestStatus, xhrObject) {
    $('#incident_city').replaceWith(data);
    return(false);
  }
}
$(CityFilter.setup);
