$(document).ready(function () {
 $('.modal').on('show.bs.modal', function (e) {
     if (typeof (e.relatedTarget) != "undefined") {
         window.location.hash = $(e.relatedTarget).attr('href');
     } 
 });

 $(window.location.hash).modal('show');
 $('a[data-toggle="modal"]').click(function(){
    window.location.hash = $(this).attr('href');
 });
});
