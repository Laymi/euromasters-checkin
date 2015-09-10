#Meteor.subscribe 'allShifts'
Template.Hosts.helpers
  hosts: ->
    hosts = Hosts.find().fetch()
    if hosts.length then hosts else null

  userId: ->
    Router?.current()?.params?._id

  formatDate: (date) ->
    moment(date).format('MM-DD-YYYY hh:mm:ss')

Template.Hosts.events
  "click .editbtn": (event) ->
    event.preventDefault()

    Meteor.call 'deleteShiftById', event.target.name
    document.getElementById('_id').value = document.getElementById(event.target.name + '-' + '_id').innerText
    document.getElementById('supervisor').value = document.getElementById(event.target.name + '-' + 'supervisor').innerText
    document.getElementById('supervisorContact').value = document.getElementById(event.target.name + '-' + 'supervisorContact').innerText
    document.getElementById('location').value = document.getElementById(event.target.name + '-' + 'location').innerText
    document.getElementById('start').value = document.getElementById(event.target.name + '-' + 'start').innerText
    document.getElementById('end').value = document.getElementById(event.target.name + '-' + 'end').innerText
    document.getElementById('info').value = document.getElementById(event.target.name + '-' + 'info').innerText
    document.getElementById('requiredAmountOfStudents').value = document.getElementById(event.target.name + '-' + 'requiredAmountOfStudents').innerText

  "click .deletebtn": (event) ->
    event.preventDefault()

    Meteor.call 'deleteShiftById', event.target.name

  "click #addNewShift": (event) ->
    event.preventDefault()
    newShift =
      "_id": document.getElementById('_id').value or Random.id()
      "info" : {
        "supervisor" : document.getElementById('supervisor').value
        "supervisorContact" : document.getElementById('supervisorContact').value
        "location" : document.getElementById('location').value
        "info" : document.getElementById('info').value
        "start": new Date document.getElementById('start').value
        "end": new Date document.getElementById('end').value
        "requiredAmountOfStudents": document.getElementById('requiredAmountOfStudents').value
      }
      "assignedStudents": []
      "createdAt": new Date

    Meteor.call 'addNewShift', newShift

    document.getElementById('_id').value = ''
