$(function(){
  
  $('.kase_control').on('click', function(){
    $('#kase_content').toggle("slow");
    $('#kase_add').toggle("slow");
    return false;
  });