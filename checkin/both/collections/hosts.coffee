@hosts = new Mongo.Collection 'hosts'

if Meteor.isServer
  # XXX Temporary permission
  hosts.allow
    insert: -> true
