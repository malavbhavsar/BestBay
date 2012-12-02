# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

if typeof gon isnt "undefined"
  if gon.item_closing_date
    $(document).ready ->
      countdown = ->
        closing_date = moment(gon.item_closing_date, "YYYY-MM-DD hh:mm:ss Z")
        if closing_date < moment()
          $("#bid-closing-in").text("Bidding closed: "+closing_date.fromNow())
        else
          $("#bid-closing-in").text("Bidding closes in: "+closing_date.fromNow())
      countdown()
      setInterval countdown, 1000

$(document).ready ->
  $("#bid-history tr").each ->
    time = $(this).find("td").eq(2)
    time.html(moment(time.html(), "YYYY-MM-DD hh:mm:ss Z").fromNow())

$("#closing_day").datepicker
  format: "yyyy-mm-dd"
  weekStart: 1
  autoclose: true

$("#closing_time").timepicker defaultTime: '12:00 AM'

$(document).ready ->
  $("#top_navigation ul").superfish()