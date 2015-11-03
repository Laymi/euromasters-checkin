#Meteor.subscribe 'allShifts'
Template.Assignments.helpers
  hosts: ->
    hosts = Hosts.find().fetch()
    console.log 'hosts', hosts
    if hosts.length then hosts else null

  guests: ->
    guests = Guests.find().fetch()
    console.log 'guest', guests
    if guests.length then guests else null


Template.Assignments.events
  'click #manuallyAssignGuestToHosts': ->
    Meteor.call 'assignGuestToHosts', document.getElementById('manualGuestSelection').value, document.getElementById('manualHostSelection').value

  'click #automaticallyAssignGuestsToHosts': ->
    guestId = document.getElementById('automaticGuestSelection').value
    hostN = parseInt(document.getElementById('hostN').value)

    Meteor.call 'automaticallyAssignGuestsToHosts', guestId, hostN, (err, res) ->
      if err
        toastr.error err.error
      else
        toastr.success 'Ok.'

  'focus #hostN': ->
    hostN.value = Hosts.findOne(automaticHostSelection.value)?.guestload or ''
