$(function(){
  var timerId;
  $('#start').on('click',function(){
    clearInterval(timerId);
    var sel=$('#large_block div:not(.selected)');
    timerId=setInterval(function(){
      $('.active').removeClass('active');
      var idx=parseInt(Math.random()*sel.length);
      sel.eq(idx).addClass('active');
    },100);
  });
  $('#stop').on('click',function(){
    $('.active').addClass('selected').removeClass('active');
    clearInterval(timerId);
  });
  $('#reset').on('click',function(){
    clearInterval(timerId);
    $('.active').removeClass('active');
    $('.selected').removeClass('selected');
  });
});