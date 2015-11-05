Meteor.methods
  populateDatabase: (N = 0) ->
    check N, Number
    for i in [0...N]
      newStudent =
        "_id": Random.id()
        "first_name" : Math.random().toString(36).substring(7)
        "last_name" : Math.random().toString(36).substring(7)
        "guestload" : 0
        "exemptionStatus" : ""
        "createdAt": new Date

      Students.insert newStudent

      newShift =
        "_id": Random.id()
        "info" : {
          "supervisor" : Math.random().toString(36).substring(7) + ' ' + Math.random().toString(36).substring(7)
          "supervisorContact" : '+123456789'
          "location" : 'WHU'
          "info" : 'some info'
          "start": new Date
          "end": new Date
          "requiredAmountOfStudents": Math.random().toString(10).substring(3,4)
        }
        "assignedStudents": []
        "createdAt": new Date

      Assignments.insert newShift

  createExampleUser: ->
    Accounts.createUser
      email: 'test1337@test.test'
      password: 'test1234'

    console.log 'test@test.de', 'test1234'

  notifyHost: (assignmentId) ->
    check assignmentId, String
    assignment = Assignments.findOne(assignmentId)
    console.log 'assignment', assignment
    Email.send({
      to: 'service@danielpesch.com',
      from: 'bettenboerse@whu.edu',
      subject: 'You Quietschie arrived',
      text: 'You Quietschie arrived, come to H001'
    });
