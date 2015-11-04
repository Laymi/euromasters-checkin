Meteor.subscribe 'allAssignments'
Template.Assignments.helpers
  assignments: ->
    specificAssignment = Router?.current()?.params?._id
    if specificAssignment != "" && specificAssignment != null && specificAssignment?
      assignments = Assignments.find(specificAssignment).fetch()
    else
      assignments = Assignments.find().fetch()
    console.log 'assignments', assignments
    if assignments.length then assignments else null

  specificAssignment: ->
    params = Router?.current()?.params?._id
    return (params != "" && params != null && params?)

Template.Assignments.events
  'click #manuallyAssignHostToGuests': ->
    Meteor.call 'assignHostToGuest', document.getElementById('manualGuestSelection').value, document.getElementById('manualHostSelection').value

  'click #automaticallyAssignHostsToGuests': ->
    guestId = document.getElementById('automaticGuestSelection').value
    hostN = parseInt(document.getElementById('hostN').value)

    Meteor.call 'automaticallyAssignHostsToGuests', guestId, hostN, (err, res) ->
      if err
        toastr.error err.error
      else
        toastr.success 'Ok.'

  'focus #hostN': ->
    hostN.value = Hosts.findOne(automaticHostSelection.value)?.guestload or ''
