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
  'click #manuallyAssignGuestsToHostToShift': ->
    Meteor.call 'assignGueststToHosts', document.getElementById('manualGuestSelection').value, document.getElementById('manualHostSelection').value

  'click #automaticallyAssignStudentsToShift': ->
    shiftId = document.getElementById('automaticShiftSelection').value
    studentN = parseInt(document.getElementById('studentN').value)

    Meteor.call 'automaticallyAssignStudentsToShift', shiftId, studentN, (err, res) ->
      if err
        toastr.error err.error
      else
        toastr.success 'Ok.'

  'focus #studentN': ->
    studentN.value = Shifts.findOne(automaticShiftSelection.value)?.workload or ''
