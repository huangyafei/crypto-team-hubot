# Description:
#   Cryptocurrency price
#
# Configuration:
#   HUBOT_CRYPOTPRICE_API_URL - Optional coincap.io API endpoint to use
#
# Commands:
#   hubot <cryptocurrency> price - Tells about the price in given cryptocurrency
#
# Author:
#   lomohuang

process.env.HUBOT_CRYPOTPRICE_API_URL ||=
  'https://api.coincap.io/v2/assets/'

module.exports = (robot) ->

    robot.respond /(\w+) price/i, (msg) ->
        crypot = msg.match[1]
        url = process.env.HUBOT_CRYPOTPRICE_API_URL + crypot
        msg.robot.http(url)
            .get() (err, res, body) ->
                data = JSON.parse(body)
                msg.send "The #{data.data.symbol} price is #{data.data.priceUsd} now."
