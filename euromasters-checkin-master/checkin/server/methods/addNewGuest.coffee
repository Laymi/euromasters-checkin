Meteor.methods
  addNewGuest: (newGuest) ->
    check newGuest, Object
    Guests.insert newGuest
