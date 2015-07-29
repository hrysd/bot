# Description:
#   @takkanm's tweets
#
# Commands:
#   takkanm - tweets

_ = require('lodash')

module.exports = (robot) ->
  chooseMessageAtRandom = (messages) ->
    message =
      _.chain(messages)
        .shuffle()
        .first()
        .value()

    formatMessage(message)

  formatMessage = (message) ->
    compiled = _.template("""
      <p><%= text %> (<a href='<%= source %>'>source</a>)</p>
    """)

    compiled(message)

  robot.hear /(みむら|三村|ミムラ)/, (msg) ->
    mimura = [
      {text: 'ドキッとした #本名が三村だった', source: 'https://twitter.com/takkanm/status/435672504808398848'}
      {text: 'わたしの本名は 益隆 です(違',    source: 'https://twitter.com/takkanm/status/423325285748973568'}
    ]

    msg.reply chooseMessageAtRandom(mimura)

  robot.hear /(ライン|LINE|line)/, (msg) ->
    line = [
      {text: 'どんなの？LINE ちょうだい',                                 source: 'https://twitter.com/takkanm/status/432853541120507904'}
      {text: 'ID とパスワード送るんで、LINE ID ください←',                source: 'https://twitter.com/takkanm/status/426614048960946176'}
      {text: 'だいじょうぶ？id 一緒だから LINE でくれてもいいんだよ？',   source: 'https://twitter.com/takkanm/status/347898237123969024'}
      {text: 'twitter がダメならわたしと LINE しよう!! ID を d でだしあ', source: 'https://twitter.com/takkanm/status/331389113611730944'}
      {text: 'LINE ID 教えてくれれば、すぐに返信するのに←',               source: 'https://twitter.com/takkanm/status/319029641287458816'}
      {text: 'Ust やるの LINE で教えてくださいよ(/_;) ←',                 source: 'https://twitter.com/takkanm/status/375494115019853824'}
    ]

    msg.reply chooseMessageAtRandom(line)

  robot.hear /(暑|熱|あつ|アツ)(い|イ)/, (msg) ->
    hot = [
      {text: 'わたしがタオルです',                                       source: 'https://twitter.com/takkanm/status/354085700049702912'}
      {text: '人って何で服着るんでしょうね？←',                          source: 'https://twitter.com/takkanm/status/357842341211537411'}
      {text: '暑いなら服脱ぐといいと思うの',                             source: 'https://twitter.com/takkanm/status/332703055818674176'}
      {text: '何で服を着ないといけないかというところから考えましょうよ', source: 'https://twitter.com/takkanm/status/323828704012808192'}
    ]

    msg.reply chooseMessageAtRandom(hot)

  robot.hear /(雨|あめ|アメ)(すごい|やばい)/, (msg) ->
    live = {
      text:   'TO のライブ終わり後に雨パラついてきましたが、なんとかもつかも。ライブ終わり降ってたら、傘持って行くから LINE ください←'
      source: 'https://twitter.com/takkanm/status/348324493413978114'
    }

    msg.reply [live.text, live.source].join(' ')

  robot.hear /(寒い|サムイ|さむい)夜ってどうしてるの(\？|\?)/, (msg) ->
    cold = [
      {text: '君をまちわびてます',                                                 source: 'https://twitter.com/takkanm/status/399785412715360256'}
      {text: 'かわいいと思ってやってるに決まってるだろ。言わせんな、恥ずかしい。', source: 'https://twitter.com/takkanm/status/429528519366811648'}
    ]

    msg.reply chooseMessageAtRandom(cold)

  robot.hear /(醤油|しょうゆ)顔.*(\?|\？)/i, (msg) ->
    soy_source = {text: '舐めないとわかんないやつですね', source: 'https://twitter.com/takkanm/status/465443188245688321'}

    msg.send formatMessage(soy_source)

  robot.hear /お風呂|オフロ|おふろ/, (msg) ->
    baths = [
      {text: 'お風呂での禊からやってもいいんですよ←',                 source: 'https://twitter.com/takkanm/status/324151601466068992'}
      {text: 'そろそろ、お風呂からのゆふ生お待ちしてます←',           source: 'https://twitter.com/takkanm/status/343342767994441728'}
      {text: '何故写真無いのですか(/ _ ; )',                          source: 'https://twitter.com/takkanm/status/358587553844166656'}
      {text: '力にはなれなそうなんですが、入ったら写真お願いします←', source: 'https://twitter.com/takkanm/status/412969470928244736'}
      {text: 'LINE で写真待ってます',                                 source: 'https://twitter.com/takkanm/status/366382680352374784'}
    ]

    msg.reply chooseMessageAtRandom(baths)

  robot.hear /ゆるいかもしれない/, (msg) ->
    head = {text: 'おなか ? あたま ?', source: 'https://twitter.com/takkanm/status/430935218455736320'}

    msg.reply formatMessage(head)

  robot.hear /鼻水|花粉|鼻炎|はなみず/, (msg) ->
    scottie = [
      {text: 'わたしがティッシュです',     source: 'https://twitter.com/takkanm/status/341402291414368256'}
      {text: 'わたしはテッシュになりたい', source: 'https://twitter.com/takkanm/status/398786621103165440'}
      {text: 'ティッシュ or DiE',          source: 'https://twitter.com/takkanm/status/437122075661058049'}
      {
        text:   'よいティッシュでもいたくなるよ。前気にしてた冷やしTEN◯Aと同じメントール入ってるローションティッシュ好きです',
        source: 'https://twitter.com/takkanm/status/314742571970736128'
      }
    ]

    msg.reply chooseMessageAtRandom(scottie)

  robot.hear /(忘れる|わすれる)/, (msg) ->
    forgetting = {text: '年を忘れても、わたしのことは忘れないでください (/_;)', source: 'https://twitter.com/takkanm/status/412878371614228480'}

    msg.reply formatMessage(forgetting)

  robot.hear /\.jpg|\.png|\.gif/, (msg) ->
    images = [
      {'即保存しましたΣ（ﾟдﾟlll）',                          source: 'https://twitter.com/takkanm/status/429943162249830400'}
      {'即保存しました！',                                   source: 'https://twitter.com/takkanm/status/426685871220203521'}
      {'即保存しました !!!!',                                source: 'https://twitter.com/takkanm/status/414424003982274560'}
      {'ありがとうございます。即保存しました。 #違う人の芸', source: 'https://twitter.com/takkanm/status/405904153731272704'}
    ]

    msg.reply chooseMessageAtRandom(images)

  robot.hear /女子会/, (msg) ->
    zyoshi = [
      {text: 'あたし、女子会に呼ばれない…(/_;)', source: 'https://twitter.com/takkanm/status/416586545315840002'}
      {text: 'あたし呼ばれてない !? #30歳男性',  source: 'https://twitter.com/takkanm/status/413310033892356096'}
      {text: 'あたし呼ばれてない!!',             source: 'https://twitter.com/takkanm/status/380235831329304576'}
    ]

    msg.reply chooseMessageAtRandom(zyoshi)
