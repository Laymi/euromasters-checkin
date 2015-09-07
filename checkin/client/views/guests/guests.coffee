#Meteor.subscribe 'allShifts'
Template.Guests.helpers
  guests: ->
    guests = Guests.find().fetch()
    if guests.length then guests else null

Template.Guests.events
  "click .editbtn": (event) ->
    event.preventDefault()
    if confirm 'Do you really want to edit the guest' + event.target.name
      alert 'We will now delete the user and prefill the user creation inputs'
      Meteor.call 'deleteGuestById', event.target.name
      document.getElementById('first_name').value = document.getElementById(event.target.name + '-' + 'first_name').innerText
      document.getElementById('last_name').value = document.getElementById(event.target.name + '-' + 'last_name').innerText
      document.getElementById('expectedTimeOfArrival').value = document.getElementById(event.target.name + '-' + 'expectedTimeOfArrival').innerText
      document.getElementById('hostName').value = document.getElementById(event.target.name + '-' + 'hostName').innerText
      document.getElementById('contact').value = document.getElementById(event.target.name + '-' + 'contact').innerText
      document.getElementById('_id').value = document.getElementById(event.target.name + '-' + '_id').innerText

  "click .deletebtn": (event) ->
    event.preventDefault()
    if confirm 'Do you really want to delete the guest' + event.target.name
      Meteor.call 'deleteGuestById', event.target.name

  "click #addNewStudent": (event) ->
    event.preventDefault()
    newGuest =
      "_id": document.getElementById('_id').value or Random.id()
      "first_name" : document.getElementById('first_name').value
      "last_name" : document.getElementById('last_name').value
      "hostName" : document.getElementById('workload').value
      "contact" : document.getElementById('contact').value
      "createdAt": new Date

    Meteor.call 'addNewGuest', newGuest

    document.getElementById('_id').value = ''
