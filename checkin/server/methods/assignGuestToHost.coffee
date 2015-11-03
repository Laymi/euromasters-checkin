Meteor.methods
  assignGuestToHost: (manualGuestSelection, manualHostSelection) ->
    check manualHostSelection, String
    check manualGuestSelection, String
    Hosts.update manualHostSelection, $addToSet: assignedGuests:manualGuestSelection
