$(document).ready(function(){
  //$.fn.dataTable.moment('DD/MM/YYYY');
  $('#usersList').DataTable( {
    //retrieve: true,
    pageLength: 50,
    JQueryUI: true,
    processing: true,
    serverSide: true,
    ajaxSource: $('#usersList').data('source'),
    language: {
      url: 'http://cdn.datatables.net/plug-ins/1.10.12/i18n/Portuguese-Brasil.json'
    }
  } );
});
