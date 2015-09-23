Meteor.methods
  deleteHostById: (_id) ->
    check _id, String
    Assignments.remove _id
