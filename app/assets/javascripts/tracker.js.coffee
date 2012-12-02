$(document).ready ->
  $("#bids table tr").each ->
    time = $(this).find("td").eq(2)
    time.html(moment(time.html(), "YYYY-MM-DD hh:mm:ss Z").fromNow())
  $("#auctions table tr").each ->
    time = $(this).find("td").eq(3)
    time.html(moment(time.html(), "YYYY-MM-DD hh:mm:ss Z").fromNow())