#Meteor.subscribe 'allShifts'
Template.Users.helpers
  users: ->
    users = Meteor.users.find().fetch()
    for user in users
      if !user.profile?.role?
        user.profile?.role = 'user'
      if !user.profile?
        user.profile = {}
        user.profile?.role = 'user'
      user.emailAddress = user.emails?[0]?.address
    if users.length then users else null

Template.Users.events
  "click .editbtn": (event) ->
    event.preventDefault()
    if confirm 'Do you really want to edit the student ' + event.target.name
      alert 'We will now delete the user and prefill the user creation inputs'
      document.getElementById('email').value = document.getElementById(event.target.name + '-' + 'email').innerText
      document.getElementById('role').value = document.getElementById(event.target.name + '-' + 'role').innerText
      document.getElementById('_id').value = document.getElementById(event.target.name + '-' + '_id').innerText

  "click #saveUser": ->
    event.preventDefault()
    user =
      "_id": document.getElementById('_id').value
      "role" : document.getElementById('role').value

    Meteor.call 'saveUser', user

    document.getElementById('_id').value = ''
    document.getElementById('email').value = ''
    document.getElementById('role').value = ''
