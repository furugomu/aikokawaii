Messages = new Meteor.Collection('messages')

if Meteor.is_client
  Meteor.subscribe "messages"

  Template.main.events =
    'submit': (e)->
      e.preventDefault()
      name = e.target.elements["name"].value.replace(/^\s+|\s+$/g, "")
      return if name == ""
      Messages.insert
        text: name+'かわいい'
        x: Math.ceil(Math.random() * 120) - 10
        y: Math.ceil(Math.random() * 110) - 5
        size: Math.ceil(Math.random() * 29) * 10 + 10

    'click #reset': ->
      Messages.remove({})

  Template.main.messages = ->
    Messages.find({})

  Template.main.manyMessages = ->
    Messages.find({}).count() > 100

if Meteor.is_server
  Meteor.publish "messages", ->
    Messages.find({})
