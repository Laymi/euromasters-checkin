Meteor.methods sendEmail: (to, from, subject, text) ->
    check [
      to
      from
      subject
      text
    ], [ String ]
