$ ->
  $('.imglightboxopener').fancybox
    fitToView: true
    autoSize: true
    closeClick: false
    openEffect: 'none'
    closeEffect: 'none'

  $('.thumbwrapper h4, .img h3').wrapInner "<span>"

  $('.imglightboxopener').hover( 
    (e) => $(e.target).parent().parent().find($('.thumbcaption')).fadeIn('fast')
    (e) => $(e.target).parent().parent().find($('.thumbcaption')).fadeOut()
  )
  
  # inline form labels
  $('input[title], textarea[title]').each ->
    if $(@).val() == ''
      $(@).val($(@).attr('title'))
    
    $(@).focus ->
      if $(@).val() == $(@).attr('title')
        $(@).val('').addClass('focused')

    $(@).blur ->
      if $(@).val() == ''
        $(@).val($(@).attr('title')).removeClass('focused')



    #$('input[title]').each(function() {
    #  if($(this).val() === '') {
    #    $(this).val($(this).attr('title')); 
    #  }

    #  $(this).focus(function() {
    #    if($(this).val() === $(this).attr('title')) {
    #      $(this).val('').addClass('focused'); 
    #    }
    #  });

    #  $(this).blur(function() {
    #    if($(this).val() === '') {
    #      $(this).val($(this).attr('title')).removeClass('focused'); 
    #    }
    #  });
    #});

