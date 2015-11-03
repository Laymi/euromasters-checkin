@Hosts = new Mongo.Collection 'hosts'

if Meteor.isServer
  # XXX Temporary permission
  Hosts.allow
    insert: -> true
