###Schemas.Hosts = new SimpleSchema
  emails:
    type: String
    optional: false
  name:
    type: String
    optional: false
  phoneNumber:
    type: String
    optional: true
  guests:
    type: [Object]
    optional: true
###
