$(function() {
  $("#evaluations_search input").keyup(function() {
    $.get($("#evaluations_search").attr("action"), $("#evaluations_search").serialize(), null, "script");
    return false;
  });
  $("#exams_search input").keyup(function() {
    $.get($("#exams_search").attr("action"), $("#exams_search").serialize(), null, "script");
    return false;
  });
  $("#users_search input").keyup(function() {
    $.get($("#users_search").attr("action"), $("#users_search").serialize(), null, "script");
    return false;
  });
  $("#signups_search input").keyup(function() {
    $.get($("#signups_search").attr("action"), $("#signups_search").serialize(), null, "script");
    return false;
  });
});