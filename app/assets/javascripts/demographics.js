$(document).ready(function() {
  $("#custom_race").focus(function () {
    $("input#participant_demographic_attributes_race_custom").click();
  });
  $("#custom_race").blur(function () {
    var race = $("#custom_race").prop("value");
    $("input#participant_demographic_attributes_race_custom").prop("value", race);
  });
});
