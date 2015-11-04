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
    document.getElementById('email').value = document.getElementById(event.target.name + '-' + 'email').innerText
    document.getElementById('guests').value = document.getElementById(event.target.name + '-' + 'guests').innerText
    document.getElementById('guest_contact').value = document.getElementById(event.target.name + '-' + 'guest_contact').innerText
    document.getElementById('info').value = document.getElementById(event.target.name + '-' + 'info').innerText
    document.getElementById('guestload').value = document.getElementById(event.target.name + '-' + 'guestload').innerText


  "click .deletebtn": (event) ->
    event.preventDefault()

    Meteor.call 'deleteHostById', event.target.name

  "click .mailbtn": (event) ->
    event.preventDefault()

    Meteor.call 'mailHostById', event.target.name
    to: document.getElementById('email').value = document.getElementById(event.target.name + '-' + 'email').innerText
    from: "Euromasters"
    subject: "Your Guests – Euromasters"
    text: "One of your guests arrived, please pick him/her up"

  "click #addNewHost": (event) ->
    event.preventDefault()

    console.log 'addNewHost'

    guests = document.getElementById('guests').value.replace(" ", "").split(",")

    newHost =
      "_id": document.getElementById('_id').value or Random.id()
      "info" : {
        "first_name" : document.getElementById('first_name').value
        "last_name" : document.getElementById('last_name').value
        "contact" : document.getElementById('contact').value
        "email" : document.getElementById('email').value
        "guests" : document.getElementById('guests').value
        "guest_contact": document.getElementById('guest_contact').value
        "info": document.getElementById('info').value
        "guestload": document.getElementById('guestload').value
      }
      "createdAt": new Date


    Meteor.call 'addNewHost', newHost
    document.getElementById('_id').value = ''
    document.getElementById('first_name').value = ''
    document.getElementById('last_name').value = ''
    document.getElementById('contact').value = ''
    document.getElementById('email').value = ''
    document.getElementById('guests').value = ''
    document.getElementById('guest_contact').value = ''
    document.getElementById('info').value = ''
    document.getElementById('guestload').value = ''
