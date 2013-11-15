;$(function(){

  $('body').on('click', '#ff-btn-add-item', function(event){
    $('#ff-form-panel-add-friend').fadeOut();
    $('#ff-form-panel-add-list').fadeOut();
    $('#ff-form-panel-add-item').fadeToggle();
  })

  $('body').on('click', '#ff-btn-add-friend', function(event){
    $('#ff-form-panel-add-item').fadeOut();
    $('#ff-form-panel-add-list').fadeOut();
    $('#ff-form-panel-add-friend').fadeToggle();
  })

  $('body').on('click', '#ff-btn-add-list', function(event){
    $('#ff-form-panel-add-friend').fadeOut();
    $('#ff-form-panel-add-item').fadeOut();
    $('#ff-form-panel-add-list').fadeToggle();
  })
  $('body').on('click','.ff-form-panel-cancel', function(event){
    $(this).fadeOut();
  })

  // handlers for grocery lists

  $('#ff-btn-add-list-item').on('click', function(event){
    $('#ff-form-panel-add-list-item').fadeToggle();
  })

  $(".ui-listview-inset .ui-li").on( "swipe", function( e ) {
      console.log("FTW");
      if ( e.type === "swipeleft" ) {
          console.log('swiped left');
      } else if ( e.type === "swiperight" ) {
          console.log('swiped right');
      }
  })


})