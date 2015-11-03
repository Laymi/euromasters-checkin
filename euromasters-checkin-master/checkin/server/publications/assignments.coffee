# XXX Temporary publication
Meteor.publish 'allAssignments', ->
  Assignments.find()

Meteor.publish 'findAllAssignmentsForHosts', (HostId) ->
  check HostId, String
  Assignments.find 'assignedHosts': $in: [ hostsId ]
