;$(function(){
  $(".ui-listview-inset .ui-li").on( "swipe", function( e ) {
      console.log("FTW");
      if ( e.type === "swipeleft" ) {
          console.log('swiped left');
      } else if ( e.type === "swiperight" ) {
          console.log('swiped right');
      }
  })

  $('#ff-btn-add-item').on('click', function(event){
    $('#ff-form-panel-add-friend').fadeOut();
    $('#ff-form-panel-add-list').fadeOut();
    $('#ff-form-panel-add-item').fadeToggle();
  })
  $('#ff-btn-add-friend').on('click', function(event){
    $('#ff-form-panel-add-item').fadeOut();
    $('#ff-form-panel-add-list').fadeOut();
    $('#ff-form-panel-add-friend').fadeToggle();
  })
  $('#ff-btn-add-list').on('click', function(event){
    $('#ff-form-panel-add-friend').fadeOut();
    $('#ff-form-panel-add-item').fadeOut();
    $('#ff-form-panel-add-list').fadeToggle();
  })
  $('.ff-form-panel-cancel').on('click', function(event){
    $(this).fadeOut();
  })

})