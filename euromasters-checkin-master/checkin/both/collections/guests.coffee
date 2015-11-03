@Guests = new Mongo.Collection 'guests'

if Meteor.isServer
  # XXX Temporary permission
  Guests.allow
    insert: -> true
