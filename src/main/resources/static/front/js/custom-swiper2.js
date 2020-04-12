 var swiper = new Swiper('.swiper-container', {
      direction: 'horizontal',
      autoClose: true,
      speed: 2500,
      autoplay: true,
      grabCursor:true,
      loop:true,
      slidesPerView: 'auto',
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
    });