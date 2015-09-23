Meteor.methods
  deleteGuestById: (_id) ->
    check _id, String
    Guests.remove _id
