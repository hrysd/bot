CronJob = require('cron').CronJob

module.exports = (robot) ->
  SCHEDULE = {
    7: [
      {start_at: '8:00',  end_at: '9:00'}
      {start_at: '16:00', end_at: '17:00'}
      {start_at: '21:00', end_at: '22:00'}
    ]
    1: [
      {start_at: '13:00', end_at: '14:00'}
      {start_at: '18:00', end_at: '19:00'}
      {start_at: '22:00', end_at: '23:00'}
    ]
    2: [
      {start_at: '12:00', end_at: '13:00'}
      {start_at: '20:00', end_at: '21:00'}
      {start_at: '23:00', end_at: '24:00'}
    ]
    3: [
      {start_at: '13:00', end_at: '14:00'}
      {start_at: '18:00', end_at: '19:00'}
      {start_at: '22:00', end_at: '23:00'}
    ]
    4: [
      {start_at: '12:00', end_at: '13:00'}
      {start_at: '20:00', end_at: '21:00'}
      {start_at: '23:00', end_at: '24:00'}
    ]
    5: [
      {start_at: '13:00', end_at: '14:00'}
      {start_at: '18:00', end_at: '19:00'}
      {start_at: '22:00', end_at: '23:00'}
    ]
    6: [
      {start_at: '10:00', end_at: '11:00'}
      {start_at: '18:00', end_at: '19:00'}
      {start_at: '22:00', end_at: '23:00'}
    ]
  }

  for week, terms of SCHEDULE
    terms.forEach (term) =>
      start_at = term.start_at.match(/\d+/)[0]

      new CronJob cronTime: "00 #{start_at} * * #{week}", onTick: =>
        robot.send "#{term.start_at}から#{term.end_at}までフィーバー"
