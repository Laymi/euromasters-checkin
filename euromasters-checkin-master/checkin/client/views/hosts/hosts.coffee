#Meteor.subscribe 'allAssignments'
Template.Hosts.helpers
  hosts: ->
    hosts = Hosts.find().fetch()
    console.log 'hosts', hosts
    if hosts.length then hosts else null

  userId: ->
    Router?.current()?.params?._id

  formatDate: (date) ->
    moment(date).format('MM-DD-YYYY hh:mm:ss')

Template.Hosts.events
  "click .editbtn": (event) ->
    event.preventDefault()

    console.log 'editbtn'

    Meteor.call 'deleteHostById', event.target.name
    document.getElementById('_id').value = document.getElementById(event.target.name + '-' + '_id').innerText
    document.getElementById('first_name').value = document.getElementById(event.target.name + '-' + 'first_name').innerText
    document.getElementById('last_name').value = document.getElementById(event.target.name + '-' + 'last_name').innerText
    document.getElementById('contact').value = document.getElementById(event.target.name + '-' + 'contact').innerText
    document.getElementById('guest').value = document.getElementById(event.target.name + '-' + 'guest').innerText
    document.getElementById('contactGuest').value = document.getElementById(event.target.name + '-' + 'contactGuest').innerText
    document.getElementById('location').value = document.getElementById(event.target.name + '-' + 'location').innerText
    document.getElementById('info').value = document.getElementById(event.target.name + '-' + 'info').innerText
    document.getElementById('capacity').value = document.getElementById(event.target.name + '-' + 'capacity').innerText


  "click .deletebtn": (event) ->
    event.preventDefault()

    Meteor.call 'deleteHostById', event.target.name

  "click #addNewHost": (event) ->
    event.preventDefault()

    console.log 'addNewHost'

    guests = document.getElementById('guest').value.replace(" ", "").split(",")

    newHost =
      "_id": document.getElementById('_id').value or Random.id()
      "info" : {
        "first_name" : document.getElementById('first_name').value
        "last_name" : document.getElementById('last_name').value
        "contact" : document.getElementById('contact').value
        "guests" : guests
        "contactGuest": new Date document.getElementById('contactGuest').value
        "location": new Date document.getElementById('location').value
        "info": document.getElementById('info').value
        "capacity": document.getElementById('capacity').value
      }
      "createdAt": new Date

    Meteor.call 'addNewHost', newHost

    document.getElementById('_id').value = ''
