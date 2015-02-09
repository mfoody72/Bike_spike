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

var carEmissionsPerKm = 0.19;
var routeDistance = 0;

function carEmissionsPerTrip() {

  var $selectedCar = $("#car-results").find("span").text();

  $.getJSON("/cars?search=" + $selectedCar, function(cars) {
    carEmissionsPerKm = cars[0].emissionperkm;

    updateSlider();
    updateCounter(); 

  });

}
  

function updateSlider() {

  // var carEmissionsPerTrip = carEmissionsPerKm * routeDistance;

  var currentDaysValue = $("input#days-slide").val();
  var currentTimePeriodValue = $("input#time-period-slide").val();

  // var totalCarbonEmissions = Math.round(carEmissionsPerTrip * currentDaysValue * currentTimePeriodValue);
  // var treeCost = 3.75
  // var totalCarbonCost = Math.round((totalCarbonEmissions/167) * treeCost);

  $("#days-counter").text(currentDaysValue);
  $("#time-period-counter").text(currentTimePeriodValue);
          
    // $("#carbon-emissions").text(totalCarbonEmissions + " Kg");
    // $("#carbon-cost").text("$" + totalCarbonCost);
}



function updateCounter() {

  var carEmissionsPerTrip = carEmissionsPerKm * routeDistance;

  var currentDaysValue = $("input#days-slide").val();
  var currentTimePeriodValue = $("input#time-period-slide").val();

  var totalCarbonEmissions = Math.round(carEmissionsPerTrip * currentDaysValue * currentTimePeriodValue);
  var treeCost = 3.75;
  var totalCarbonCost = Math.round((totalCarbonEmissions/167) * treeCost);  
  if (distance === undefined) {
    $("#carbon-emissions").text("0 Kg");
    $("#carbon-cost").text("0 Kg");

  } else { 

  var percent_number_step = $.animateNumber.numberStepFactories.append(' Kg')
  $('#carbon-emissions').animateNumber(
    {
      number: totalCarbonEmissions,
      color: 'red',
      'font-size': '30px',

      easing: 'easeInQuad',

      numberStep: percent_number_step
    },
    1000
  );

  var percent_number_step = $.animateNumber.numberStepFactories.append(' Dollars')
  $('#carbon-cost').animateNumber(
    {
      number: totalCarbonCost,

      'font-size': '30px',

      easing: 'easeInQuad',

      numberStep: percent_number_step
    },
    1000
  ); 
}  





$("input#days-slide").on("input", updateSlider);
$("input#time-period-slide").on("input", updateSlider); 

$("input#days-slide").on("change", updateCounter);
$("input#time-period-slide").on("change", updateCounter);



