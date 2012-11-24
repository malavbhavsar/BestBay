# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

if typeof gon isnt "undefined"
  if gon.item_closing_date
    $(document).ready ->
      countdown = ->
        if moment(gon.item_closing_date) < moment()
          $("#bid-closing-in").text("Bidding closed: "+moment(gon.item_closing_date).fromNow())
        else
          $("#bid-closing-in").text("Bidding closes in: "+moment(gon.item_closing_date).fromNow())
      countdown()
      setInterval countdown, 1000

$("#item_closing_day").datepicker
  format: "yyyy-mm-dd"
  weekStart: 1
  autoclose: true

$("#item_closing_time").timepicker defaultTime: '12:00 AM'