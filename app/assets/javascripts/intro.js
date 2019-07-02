function main(){
  $("#intro").hide();
  $("#introbtn").on('click', function(){
    $("#intro").toggle(500);
  })
}

$(document).ready(main);