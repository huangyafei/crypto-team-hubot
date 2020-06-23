# Description:
#   Receive a useless idea
#
# Commands:
#   hubot useless idea - Receive a useless idea
#
# Author:
#   lomohuang

module.exports = (robot) ->

  robot.respond /useless idea/i, (msg) ->
    msg.http("https://q24.io/api/v1/idea")
      .get() (err, res, body) ->
        data = JSON.parse(body)
        msg.send "#{data.idea} —— #{data.author}"
