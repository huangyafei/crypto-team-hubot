# Description:
#   App & Web I18n Translation Search
#
# Commands:
#   hubot i18n <source> <phrase> - Searches for a translation for the <phrase> and then prints that bad boy out.
#
# Author:
#   lomohuang

module.exports = (robot) ->

    robot.respond /i18n (\w+) (.*)/i, (msg) ->
        srcWord = msg.match[2]
        srcLang = msg.match[1]
        data = {
            language: srcLang
            content: srcWord
        }
        postData = JSON.stringify(data)
        msg.http("https://i18ns.com/api/v1/search")
            .headers('Content-Type': 'application/json', 'x-access-token': '5f42e6c5c8d32543bc5cff684ce52ce4b60399f8')
            .post(postData) (err, res, body) ->
                outData = JSON.parse(body)
                msgData = {
                    "attachments": [
                        {
                            "mrkdwn_in": ["text"],
                            "color": "#36a64f",
                            "title": "Translation results for the word " + srcWord + " from i18ns.com",
                            "fields": [
                                {
                                    "title": "Chinese",
                                    "value": outData[0].translations.zh[0],
                                    "short": true
                                },
                                {
                                    "title": "English",
                                    "value": outData[0].translations.en[0],
                                    "short": true
                                },                                
                                {
                                    "title": "Japanese",
                                    "value": outData[0].translations.ja[0],
                                    "short": true
                                },
                                {
                                    "title": "Korean",
                                    "value": outData[0].translations.ko[0],
                                    "short": true
                                }
                            ],
                            "footer": "https://i18ns.com"
                        }
                    ]
                }
                msg.send(msgData)

