# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  topics = $('#convo_topic_id').html()
  $('#convo_subject_id').change ->
    subject = $('#convo_ subject_id :selected').text()
    options = $(topics).filter("optgroup[label='#{subject}']").html()
    if options
      $('#convo_topic_id').html(options)
    else
      $('#convo_topic_id').empty()
