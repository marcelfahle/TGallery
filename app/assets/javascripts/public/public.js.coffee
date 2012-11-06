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
