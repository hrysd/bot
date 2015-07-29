# Description:
#  Nothing to say
#
#  Commands:
#    m me - Recive a takkanm
#    m me bomb N - get N takkanms

_ = require('lodash')

images = [
  'http://farm7.staticflickr.com/6240/6367330555_d7e90ded87.jpg',
  'https://f.cloud.github.com/assets/1663465/2159875/a633bbba-94ae-11e3-977e-e420ab44b235.jpg',
  'https://f.cloud.github.com/assets/1663465/2159874/a6007b6a-94ae-11e3-8925-ce4e0dfab01a.jpg'
  'https://f.cloud.github.com/assets/1663465/2159757/1898c450-94ac-11e3-9a30-58e3e45cbd58.jpg' # あつい
  'https://31.media.tumblr.com/67aa7aa0d9dd7e476815381a9ab7e9ce/tumblr_n0qbodOl0i1r1ll0oo1_400.png' # さむい
]

module.exports = (robot) ->
  robot.respond /m me/i, (msg) ->
    msg.send _.chain(images).shuffle().first().value()

  robot.respond /m me bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 3

    msg.send m for m in _.sample(images, count)
