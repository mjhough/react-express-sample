const cities = ["Sydney", "Prague", "Aspen", "Tokyo", "Perth", "Denver"];
var counter = 0;
setInterval(change, 1000);

function change() {
  $('#changingTitleText').text(cities[counter]);
  counter++;
  if (counter >= cities.length) {
    counter = 0;
  }
}
