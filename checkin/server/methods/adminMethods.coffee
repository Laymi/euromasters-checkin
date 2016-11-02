Mandrill.config
  username: "Daniel Pesch Software"
  key: "G6re1XDVlBCbIUb0ybqOsg"

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
    assignment = Assignments.findOne("_id":assignmentId)
    console.log 'assignment', assignment
    client = Twilio('ACefe8c60a1534e65e49210fc106fcd5e7', '956f806569be3a8e12adec4ebaeef884')
    client.sendMessage {
      to: assignment?.mobile
      from: '+4915735986734'
      body: 'Strategy& dankt Ihnen für Ihre Bewerbung.'
    }, (err, responseData) ->
      if !err
        console.log responseData.from
        console.log responseData.body
      return
    Mandrill.messages.send
      message:
        subject: 'Your schlafie arrived.'
        text: "Go pick him/her up at H001"
        from_email: 'schichten@danielpesch.com'
        to: [
            email: assignment?.email
        ]
