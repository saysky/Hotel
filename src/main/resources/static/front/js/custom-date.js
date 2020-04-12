$('#date-range12').dateRangePicker({
    inline:true,
    separator : ' to: ',
    container: '#date-range12-container', 
    alwaysOpen:true ,
    stickyMonths: true,
    showTopbar: false,
    format: 'MMM D, YYYY',
    customTopBar: '',
    startDate: new Date(),
    hoveringTooltip: false,
    showShortcuts: false,
    customArrowPrevSymbol: '<span class="fa fa-angle-left"></span>',
    customArrowNextSymbol: '<span class="fa fa-angle-right"></span>'
    
  });


$('#date-range200,#date-range201').dateRangePicker({
    separator : ' to ',
    // inline:false,
    // container:'#date-range1-container',
    extraClass: 'reserved-form',
    showTopbar: false,
    customArrowPrevSymbol: '<span class="fa fa-angle-left"></span>',
    customArrowNextSymbol: '<span class="fa fa-angle-right"></span>',
      getValue: function()
      {
        if ($('#date-range200').val() && $('#date-range201').val() )
          return $('#date-range200').val() + ' to ' + $('#date-range201').val();
        else
          return '';
      },
      setValue: function(s,s1,s2)
      {
        $('#date-range200').val(s1);
        $('#date-range201').val(s2);
      }

    
  });

