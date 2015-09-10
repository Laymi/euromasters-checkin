Template.Assignments.helpers

  assignments: ->
    assignments = Assignments.find().fetch()
    if assignments.length then assignments else null

  userId: ->
    Router?.current()?.params?._id

  formatDate: (date) ->
    moment(date).format('MM-DD-YYYY hh:mm:ss')

  students: ->
    students = Students.find().fetch()
    if students.length then students else null

Template.Assignments.events
  'click #manuallyAssignStudentToShift': ->
    Meteor.call 'assignStudentToShift', document.getElementById('manualStudentSelection').value, document.getElementById('manualShiftSelection').value

  'click #automaticallyAssignStudentsToShift': ->
    shiftId = document.getElementById('automaticShiftSelection').value
    studentN = parseInt(document.getElementById('studentN').value)

    Meteor.call 'automaticallyAssignStudentsToShift', shiftId, studentN, (err, res) ->
      if err
        toastr.error err.error
      else
        toastr.success 'Ok.'

  'focus #studentN': ->
    studentN.value = Assignments.findOne(automaticShiftSelection.value)?.workload or ''
