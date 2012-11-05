$ ->
  $('.imglightboxopener').fancybox
    fitToView: true
    autoSize: true
    closeClick: false
    openEffect: 'none'
    closeEffect: 'none'

  $('.thumbwrapper h4, .img h3').wrapInner "<span>"
  $(".thumbwrapper h4 br, .img h3 br").before("<span class='spacer'>").after("<span class='spacer'>");
