$(document).ready(function() {
  $.fn.dataTable.moment('DD/MM/YYYY');
  $('#incidentsList').DataTable( {
    retrieve: true,
    pageLength: 100,
    language: {
      url: 'http://cdn.datatables.net/plug-ins/1.10.12/i18n/Portuguese-Brasil.json'
    }
  } );
});
