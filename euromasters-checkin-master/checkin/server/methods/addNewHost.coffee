Meteor.methods
  addNewHost: (newHost) ->
    check newHost, Object
    Hosts.insert newHost
