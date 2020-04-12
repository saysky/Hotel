 var swiper = new Swiper('.swiper-container', {
      direction: 'vertical',
      autoClose: true,
      speed: 2500,
      autoplay: true,
      zoom: true,
      grabCursor:true,
      loop:true,
      slidesPerView: 'auto',
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      }
    });