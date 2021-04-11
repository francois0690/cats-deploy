const initDropDownForm = () => {

$(document).ready(function(){
  $('#click').click(function() {
    if($('#hidden-info').css("display")=="block") {
      $('#hidden-info').slideUp();
      $('.arrow').css('-webkit-transform', 'rotate(0deg)');
      $('.arrow').css('-moz-transform', 'rotate(0deg)');
      $('.arrow').css('transform', 'rotate(0deg)');
    }
    else {
      $('#hidden-info').slideDown();
      $('.arrow').css('-webkit-transform', 'rotate(180deg)');
      $('.arrow').css('-moz-transform','rotate(180deg)');
      $('.arrow').css('transform', 'rotate(180deg)');
    }
  });
  // $('#save').click(function() {
  //   alert("Login Successful"); $('#hidden-info').slideUp();
  //   $('.arrow').css('-webkit-transform', 'rotate(0deg)');
  //   $('.arrow').css('-moz-transform', 'rotate(0deg)');
  //   $('.arrow').css('transform', 'rotate(0deg)');
  // });
});
}

export { initDropDownForm };
