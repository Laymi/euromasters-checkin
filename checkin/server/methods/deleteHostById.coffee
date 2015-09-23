Meteor.methods
  deleteHostById: (_id) ->
    check _id, String
    Hosts.remove _id
