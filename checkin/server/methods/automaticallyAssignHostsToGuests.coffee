Meteor.methods
  automaticallyAssignHostsToGuests: (GuestId, HostN) ->
    check GuestId, String
    check HostN, Number

    console.log hostN

    if guestId == '' || guestId == undefined
      throw new Meteor.Error 'guestId invalid'
    if hostN == '' || hostN == 0|| hostN == undefined || isNaN hostN
      throw new Meteor.Error 'hostN invalid'

    for i in [0...hostN]
      counter = 0
      possibleHostWithLowestGuestload = Hosts.find({ $query: {}, $orderby: { guestload : 1 }})?.fetch()?[counter]
      hostsAlreadyAssignedToGuest = Assignments.findOne(guestId)?.assignedHosts
      counter++
      while hostsAlreadyAssignedToGuest.indexOf(possibleHostWithLowestGuestload?._id) > -1
        possibleHostWithLowestGuestload = Hosts.find({ $query: {}, $orderby: { guestload : 1 }})?.fetch()?[counter]
        counter++
      hostWithLowestGuestload = possibleHostWithLowestGuestload
      if hostWithLowestGuestload?._id?
        Assignments.update guestId, $addToSet: assignedHosts:hostWithLowestGuestload?._id
      else
        throw new Meteor.Error 'Insufficient hosts available'
