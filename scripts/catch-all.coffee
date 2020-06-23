module.exports = (robot) ->
  robot.catchAll (msg) ->
    if msg.message.match /// ^#{robot.name}\s ///
      msg.reply "pardon?" # or whatever
