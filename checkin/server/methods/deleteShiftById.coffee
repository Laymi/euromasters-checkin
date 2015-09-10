Meteor.methods
  deleteShiftById: (_id) ->
    check _id, String
    Assignments.remove _id
