Meteor.methods
  assignHostToGuest: (manualGuestSelection, manualHostSelection) ->
    if Meteor.users.findOne(Meteor.userId()).profile.role == 'admin'
      check manualHostSelection, String
      check manualGuestSelection, String
      Hosts.update manualHostSelection, $addToSet: assignedGuests:manualGuestSelection
