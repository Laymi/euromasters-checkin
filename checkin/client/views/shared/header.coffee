Template.Header.helpers
  isActiveRoute: (name) ->
    if name is Router.current().route.getName() then 'active' else ''

  assignments: ->
    Session.get 'possibleAssignments'

  currentUserIsAdmin: ->
    return Meteor.user()?.profile?.role == 'admin'

Template.Header.events
  'keyup input': (event, template) ->
    if event.target.value != ''
      search = new RegExp event.target.value, 'i'
      possibleAssignments = Assignments.find($or : [{"participant_first_name": search},{"participant_last_name": search}]).fetch()
      Session.set 'possibleAssignments', possibleAssignments
    else
      Session.set 'possibleAssignments', undefined

  'click #logout': ->
    Meteor.logout()
