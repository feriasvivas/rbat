$(document).ready( function(){
  $.fn.dataTable.moment('DD/MM/YYYY');
  $.fn.dataTableExt.oStdClasses.sWrapper = "row table-responsive dataTables_wrapper"
  $('#incidentsList').DataTable( {
    retrieve: true,
    pageLength: 100,
    language: {
      url: 'http://cdn.datatables.net/plug-ins/1.10.12/i18n/Portuguese-Brasil.json'
    }
  } );
});
