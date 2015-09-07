Meteor.methods
  addNewStudent: (newGuest) ->
    check newGuest, Object
    Guests.insert newGuest
