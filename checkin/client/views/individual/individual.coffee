#Meteor.subscribe 'allAssignments'
Template.Individual.helpers
  assignments: ->
    assignments = Assignments.find().fetch()
    if assignments.length then assignments else null

  userId: ->
    Router?.current()?.params?._id

  first_name: ->
    Students.findOne(Router?.current()?.params?._id).first_name

  last_name: ->
    Students.findOne(Router?.current()?.params?._id).last_name

  formatDate: (date) ->
    moment(date).format('DD-MM-YYYY hh:mm:ss')

Template.Individual.rendered = ->
  document.getElementById('searchStudent').value = ''
  Session.set('possibleStudents', undefined)
