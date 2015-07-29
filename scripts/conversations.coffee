# Description:
#   クレジットカード
#
# Commands:
#   ガバガバ | がばがば - はじめてだよ

      _ = require('lodash')
request = require('request')

ENDPOINT = process.env.ENDPOINT

module.exports = (robot) ->
  komagata = {name: '@komagata', userName: 'komagata', gravatarId: 16577}
  ursm     = {name: '＠ursm',    userName: 'ursm',     gravatarId: 7548}
  takkanm  = {name: '@takkanm',  userName: 'takkanm',  gravatarId: 43500}

  compiledTemplate = _.template("""
    <img height='16' width='16' src='https://avatars2.githubusercontent.com/u/<%= gravatarId %>'>
    <b><%= userName %></b>(<a href="https://twitter.com/<%= userName %>"><%= name %></a>)
    <br/>
    <%= content %>
  """)

  robot.hear /ガバガバ|がばがば/, (msg) ->
    return if msg.envelope.user.id.match(/^hookendpoint/)

    # 外にしたい
    gabagaba = compiledTemplate(_.merge(komagata, content: """
      <p>@#{msg.envelope.user.name} に「不正利用とかウォレット不具合とか @komagata さんのクレジットカード、ガバガバじゃないですか」って言われた。こんな失礼なこと言われたのはじめてだよ。(<a href="https://twitter.com/komagata/status/317905462660042752">source</a>)</p>
    """))

    request.post ENDPOINT, form: {source: gabagaba, format: 'html'}

  robot.hear /はーふ|ハーフ|half|harf/, (msg) ->
    return if msg.envelope.user.id.match(/^hookendpoint/)

    half = compiledTemplate(_.merge(takkanm, content: """
      <p>「ハーフアンドハーフ」って変な単語だよな。1/4 を想像するじゃん(<a href="https://twitter.com/takkanm/status/477354348804988929">source</a>)</p>
    """))

    notAWord = compiledTemplate(_.merge(ursm, content: """
      <p>@takkanm まず単語じゃないですよね (<a href="https://twitter.com/ursm/status/477363838057062400">source</a>)</p>
    """))

    takkanm = compiledTemplate(_.merge(takkanm, content: """
      <p>＠ursm 熟語ですね...(<a href="https://twitter.com/takkanm/status/477382241148866560">source</a>)</p>
    """))

    request.post ENDPOINT, {form: {source: half, format: 'html'}}, (error, res, body) ->
      request.post ENDPOINT, {form: {source: notAWord, format: 'html'}}, (error, res, body) ->
        request.post ENDPOINT, {form: {source: takkanm, format: 'html'}}
