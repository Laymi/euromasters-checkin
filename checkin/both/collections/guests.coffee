@guests = new Mongo.Collection 'guests'

if Meteor.isServer
  # XXX Temporary permission
  guests.allow
    insert: -> true
