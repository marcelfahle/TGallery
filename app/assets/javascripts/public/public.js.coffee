$ ->

  if $('.wrapper').hasClass 'narrow'
    $('.imglightboxopener').fancybox
      fitToView: true
      width: 550
      maxWidth: 550
      closeClick: false
      openEffect: 'none'
      closeEffect: 'none'
  else
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



  # textfield limit
  if $('#photo_caption').length > 0
    $('#photo_caption').limit('500','.publiccharsleft');

  if $('.commentfield').length > 0
    $('.commentfield').limit('250','.charsleft');

  #$('.new_comment').submit ->
    


