$(document).ready( function(){
  $.fn.dataTable.moment('DD/MM/YYYY');
  $.fn.dataTableExt.oStdClasses.sWrapper = "row table-responsive dataTables_wrapper"
  $('#incidentsList').DataTable( {
    //retrieve: true,
    //pageLength: 100,
    //lengthMenu: [3, 5, 10, 20],
    paginationType: "full_numbers",
    JQueryUI: true,
    processing: true,
    serverSide: true,
    ajaxSource: $('#incidentsList').data('source'),
    language: {
      url: 'http://cdn.datatables.net/plug-ins/1.10.12/i18n/Portuguese-Brasil.json'
    },
    columns: [
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      {orderable: false},
      null,
      {orderable: false}
    ]
  } );
});
