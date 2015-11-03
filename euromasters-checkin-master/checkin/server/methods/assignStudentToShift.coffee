Meteor.methods
  assignStudentToShift: (manualStudentSelection, manualShiftSelection) ->
    check manualStudentSelection, String
    check manualShiftSelection, String
    Assignments.update manualShiftSelection, $addToSet: assignedStudents:manualStudentSelection
