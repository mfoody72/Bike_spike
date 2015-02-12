//Calendar
  var startDate, endDate, bikeRental;


  $(document).ready(function() { 
    $("#startbutton").bind("click", function() {
      var startDateString = $("#reservation_start_date").val();
      startDate = new Date(startDateString);
      console.log(startDate);
    });

    $("#endbutton").bind("click", function() {
      var endDateString = $("#reservation_end_date").val();
      var bikePrice = parseInt( $(".bike-price").data("price") ) * 100;
      endDate = new Date(endDateString);
      var bikeRental = "$" + (Math.round(Math.abs((endDate.getTime() - startDate.getTime())/(24*60*60*1000))) * bikePrice) / 100 + ".00";
      $("#priceObject").text(bikeRental);
    });
  });


  //Calendar Picker

  $(document).ready(function() { 
      $("td").on("click", function() {
      $(this).toggleClass("booked")
    });
  });


      
   

