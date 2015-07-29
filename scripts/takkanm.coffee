# Description:
#   takkanm
#
# Commands:
#   takkanm - takkanm is the most important thing in your life

_ = require('lodash')

module.exports = (robot) ->
  robot.respond /hoi/, (msg) ->
    adapter  = msg.robot.adapter
    envelope = msg.envelope

    adapter.sendHTML envelope, """
      <h1><span style='color:red;'>hoi</span> is the most important thing in your life.</h1>
    """

  robot.hear /(Rails|rails)\s?(むずかしい|おしえて)/, (msg) ->
    msg.reply 'これでも呼んでろ https://pbs.twimg.com/media/BLkOYs0CUAEDI5X.jpg'

  robot.hear /(?:だめ|ダメ|駄目)/, (msg) ->
    dame = [
      '使いものになったときあんの？',
      'だから、だめじゃないときがあったん？',
      'だいじょうぶな日あるんですか？',
      'だからお前はつめがあまい。ラードでも飲んでろ。'
    ]

    msg.reply _.chain(dame).shuffle().first().value()

  robot.hear /パソコン(わからない|むずかしい|教えてほしい|おしえてほしい)/, (msg) ->
    msg.reply 'わたしのところにくれば、パソコン教えるうえに、甘いものつけるのに...'

  robot.hear /(乗|の)りたい/, (msg) ->
    msg.reply 'いつでもののせるのに...'

  robot.hear /w{3}/, (msg) ->
    msg.send 'wwwwwww'

  robot.hear /お(前|まえ)(は|が)(わら|笑)うな/, (msg) ->
    msg.reply 'やんの？'

  robot.hear /LGTM/i, (msg) ->
    lgtm = [
      'https://f.cloud.github.com/assets/1663465/2159720/6b100316-94ab-11e3-8823-29c71b7f56fb.jpg'
      'https://f.cloud.github.com/assets/1606673/2158251/dbc81c5e-948f-11e3-9fbe-182046a6fb71.png'
      'https://f.cloud.github.com/assets/1606673/2158631/af4f9e0c-9496-11e3-9cd7-ca3ce930cb1a.png'
      'https://idobata.s3.amazonaws.com/uploads/attachment/image/5741/0dae2e10-0192-495b-afde-013bc289944c/10540293_765448773497826_873736932_n.jpg'
    ]

    msg.send _.chain(lgtm).shuffle().first().value()

  robot.hear /(コテカ|こてか)/, (msg) ->
    koteka = [
      '',
      '説明してください',
      '<〇> <〇>',
      'おまえこそだいじょうぶか ?'
      'ｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯｲﾀｲｯ'
      'ウィンウィンウィン ウィンウィン ?'
    ]

    msg.reply _.chain(koteka).shuffle().first().value()
