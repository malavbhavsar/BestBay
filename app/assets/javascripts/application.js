// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.superfish
//= require jquery.autocomplete
//= require bootstrap-datepicker
//= require bootstrap-timepicker
//= require_tree .

window.App = {
    completeProjectLine: function(data) {
        var html, watchs;
        html = "";
        watchs = "";
        watchs = "<abbr>(" + moment(data[3]).fromNow()+")</abbr>";
        html += "<div class='info' style='overflow: hidden;'>"+"<div style='float: left; padding: 1em;'> <img src=\"" + data[5] + "\" style='max-width: 40px;'>" + "</div>" +"<div style='overflow: hidden; padding: 1em;'> <a href=\"" + data[1] + "\">" + data[0] + "</a>" + watchs + "<br />" + data[4].replace(/\\n/g, "<br>") + "</div> </div>";
        return html;
    },
    completeProjects: function(el) {
        var hash;
        hash = {
            minChars: 1,
            delay: 50,
            width: 350,
            scroll: false,
            formatItem: function(data, i, total) {
                return App.completeProjectLine(data);
            }
        };
        return $(el).autocomplete("/items/search", hash).result(function(e, data, formatted) {
            location.href = "" + data[1];
            return false;
        });
    }
};

$(document).ready(function() {
    return App.completeProjects(".searchbox input.query");
});