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
  path: '/',
#  waitOn: ->
    #Meteor.subscribe 'allAssignments',
  cache: true
# Non-Administrative routes
  @route 'login', path: '/login'

  @route 'assignments'
  path: 'assignments'

  @route 'individual'
  path: '/individual/:_id'

  @route 'guests'
  path: '/guests'

  @route 'hosts'
  path: '/hosts'

  @route 'users'
  path: '/users'
  #waitOn: -> Meteor.subscribe 'findAllAssignmentsForStudent', Router?.current()?.params?._id,
  cache: false

  @route 'publicstatistics', path: '/publicstatistics'

# Administrative routes
  @route 'backend', path: '/backend'

  @route 'privatestatistics', path: '/privatestatistics'


  @route 'logs', path: '/logs'

  @route 'imprint', path: '/imprint'
  @route 'privacy', path: '/privacy'
  @route 'terms', path: '/terms'

### Require signing in for all routes, except:
Router.plugin 'ensureSignedIn',
  except: ['home', 'imprint', 'privacy', 'terms']
###
