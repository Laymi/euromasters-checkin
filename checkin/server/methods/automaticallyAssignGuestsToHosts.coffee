Meteor.methods
  automaticallyAssignGuestsToHosts: (GuestId, HostN) ->
    check GuestId, String
    check HostN, Number

    if guestId == '' || guestId == undefined
      throw new Meteor.Error 'guestId invalid'
    if hostN == '' || hostN == 0|| hostN == undefined || isNaN hostN
      throw new Meteor.Error 'hostN invalid'

    for i in [0...hostN]
      counter = 0
      possibleHostWithLowestGuestload = Hosts.find({ $query: {}, $orderby: { guestload : 1 }})?.fetch()?[counter]
      hostsAlreadyAssignedToGuest = Assignments.findOne(guestId)?.assignedHosts
      counter++
      while hostsAlreadyAssignedToGuest.indexOf(possibleHostWithLowestWorkload?._id) > -1
        possibleHostWithLowestWorkload = Hosts.find({ $query: {}, $orderby: { workload : 1 }})?.fetch()?[counter]
        counter++
      hostWithLowestWorkload = possibleHostWithLowestWorkload
      if hostWithLowestWorkload?._id?
        Assignments.update guestId, $addToSet: assignedHosts:hostWithLowestWorkload?._id
      else
        throw new Meteor.Error 'Insufficient hosts available'
