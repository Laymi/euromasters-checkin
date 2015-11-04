Router.configure
  notFoundTemplate: 'NotFound'
  loadingTemplate: 'Loading'
  templateNameConverter: 'upperCamelCase'
  routeControllerNameConverter: 'upperCamelCase'
  layoutTemplate: 'MasterLayout'

# For individual route configuration, see /client/controllers
Router.map ->
# All routes for the normal users
  @route 'home',
  waitOn: ->
    Meteor.subscribe 'allAssignments'
  path: '/',
  cache: true

  @route 'login',
  path: '/login'

  @route 'assignments',
  path: '/assignments/:_id',
  waitOn: ->
    Meteor.subscribe 'allAssignments'

  @route 'assignmentsAll',
  template: 'Assignments',
  path: '/assignments',
  waitOn: ->
    Meteor.subscribe 'allAssignments'

  @route 'users'
  path: '/users'
  #waitOn: -> Meteor.subscribe 'findAllAssignmentsForStudent', Router?.current()?.params?._id,
  cache: false


# Administrative routes
  @route 'imprint', path: '/imprint'
  @route 'privacy', path: '/privacy'
  @route 'terms', path: '/terms'
