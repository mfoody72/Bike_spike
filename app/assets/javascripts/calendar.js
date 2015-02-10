//Calendar

$(document).ready(function() { 
    $("#start").bind("click", function() {
      var dateString = $("#date").val().replace(/-/g, "/");
      var date = new Date(dateString);
      var startDate = $("#date").val();
      $("#starteDateObject").text(date.toString()); 
    });

    $("#end").bind("click", function() {
      var dateString = $("#date2").val().replace(/-/g, "/");
      var date2 = new Date(dateString);
      var endDate = ("#date2").val());
      $("#endDateObject").text(date.toString()); 
    });
  });

