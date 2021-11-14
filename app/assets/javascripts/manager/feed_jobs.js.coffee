jQuery ->
  $('.open-modal').on 'click', (e) =>
    e.preventDefault();
    $('.feed-jobs-popup-bg').fadeIn(800)

  $('.close-popup').on 'click', (e) =>
    e.preventDefault();
    $('.feed-jobs-popup-bg').fadeOut(800)
