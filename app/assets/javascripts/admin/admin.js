$(function() {
  $("#evaluations_search input").keyup(function() {
    $.get($("#evaluations_search").attr("action"), $("#evaluations_search").serialize(), null, "script");
    return false;
  });
});