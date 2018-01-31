var text = ["Sydney", "Prague", "Aspen", "Tokyo", "Perth", "Denver"];
var counter = 0;
var elem = document.getElementById("changingTitleText");
setInterval(change, 1000);

function change() {
  elem.innerHTML = text[counter];
  counter++;
  if (counter >= text.length) {
    counter = 0;
  }
}
