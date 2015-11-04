@Assignments = new Mongo.Collection 'assignments'

if Meteor.isServer
  # XXX Temporary permission
  Assignments.allow
    insert: -> true
