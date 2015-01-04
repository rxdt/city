$(document).ready ->
  $(".datepicker").datepicker
    startDate: "today"
    multidate: true
    todayBtn: true
    clearBtn: true
    calendarWeeks: true
    autoclose: true
    todayHighlight: true
    beforeShowDay: (date) ->
      if date.getMonth() is (new Date()).getMonth()
        switch date.getDate()
          when 4
            tooltip: "Example tooltip"
            classes: "active"
          when 8
            false
          when 12
            "green"

  return
