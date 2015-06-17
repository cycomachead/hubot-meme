# Description:
#   Get a meme from http://memecaptain.com/
#
# Dependencies:
#   None
#
# Commands:
#   hubot Y U NO <text> - Meme: Y U NO GUY w/ bottom caption
#   hubot I don't always <something> but when i do <text> - Meme: The Most Interesting man in the World
#   hubot <text> (SUCCESS|NAILED IT) - Meme: Success kid w/ top caption
#   hubot <text> ALL the <things> - Meme: ALL THE THINGS
#   hubot <text> TOO DAMN <high> - Meme: THE RENT IS TOO DAMN HIGH guy
#   hubot Yo dawg <text> so <text> - Meme: Yo Dawg
#   hubot All your <text> are belong to <text> - Meme: All your <text> are belong to <text>
#   hubot If <text>, <question> <text>? - Meme: Philosoraptor
#   hubot <text>, BITCH PLEASE <text> - Meme: Yao Ming
#   hubot <text>, COURAGE <text> - Meme: Courage Wolf
#   hubot ONE DOES NOT SIMPLY <text> - Meme: Boromir
#   hubot IF YOU <text> GONNA HAVE A BAD TIME - Meme: Ski Instructor
#   hubot IF YOU <text> TROLLFACE <text> - Meme: Troll Face
#   hubot Aliens guy <text> - Meme: Aliens guy
#   hubot Brace yourself <text> - Meme: Ned Stark braces for <text>
#   hubot Iron Price <text> - Meme: To get <text>? Pay the iron price!
#   hubot Not sure if <something> or <something else> - Meme: Futurama Fry
#   hubot <text>, AND IT'S GONE - Meme: Bank Teller
#   hubot WHAT IF I TOLD YOU <text> - Meme: Morpheus "What if I told you"
#
# Author:
#   bobanj
#   Michael Ball <cycomachead@gmail.com>

module.exports = (robot) ->
  robot.respond /Y U NO (.+)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/y_u_no.jpg', 'Y U NO', msg.match[1], (url) ->
      msg.send url

  robot.respond /iron price (.+)/i, (msg) ->
    memeGenerator msg, 'http://imgur.com/nqVZQel.jpg', msg.match[1], 'Pay the iron price', (url) ->
      msg.send url

  robot.respond /aliens guy (.+)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/aliens.jpg', msg.match[1], '', (url) ->
      msg.send url

  robot.respond /brace yourself (.+)/i, (msg) ->
    memeGenerator msg, 'http://i.imgur.com/cOnPlV7.jpg', 'Brace Yourself', msg.match[1], (url) ->
      msg.send url

  robot.respond /(.*) (ALL the .*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/all_the_things.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(I DON'?T ALWAYS .*) (BUT WHEN I DO,? .*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/most_interesting.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(.*)(SUCCESS|NAILED IT.*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/success_kid.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(.*) (\w+\sTOO DAMN .*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/too_damn_high.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(NOT SURE IF .*) (OR .*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/fry.png', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(YO DAWG .*) (SO .*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/xzibit.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(All your .*) (are belong to .*)/i, (msg) ->
    memeGenerator msg, 'http://i.imgur.com/gzPiQ8R.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(.*)\s*BITCH PLEASE\s*(.*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/yao_ming.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(.*)\s*COURAGE\s*(.*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/courage_wolf.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /ONE DOES NOT SIMPLY (.*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/boromir.jpg', 'ONE DOES NOT SIMPLY', msg.match[1], (url) ->
      msg.send url

  robot.respond /(IF YOU .*\s)(.* GONNA HAVE A BAD TIME)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/bad_time.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(.*)TROLLFACE(.*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/troll_face.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(IF .*), ((ARE|CAN|DO|DOES|HOW|IS|MAY|MIGHT|SHOULD|THEN|WHAT|WHEN|WHERE|WHICH|WHO|WHY|WILL|WON\'T|WOULD)[ \'N].*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/philosoraptor.jpg', msg.match[1], msg.match[2] + (if msg.match[2].search(/\?$/)==(-1) then '?' else ''), (url) ->
      msg.send url

  robot.respond /(.*)(AND IT\'S GONE.*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/src_images/uIZe3Q.jpg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /WHAT IF I TOLD YOU (.*)/i, (msg) ->
    memeGenerator msg, 'http://memecaptain.com/src_images/fWle1w.png', 'WHAT IF I TOLD YOU', msg.match[1], (url) ->
      msg.send url

memeGenerator = (msg, imageName, text1, text2, callback) ->
  imageUrl = imageName
  baseError = 'Sorry, I couldn\'t generate that meme.'
  reasonError = 'Unexpected status from memecaptian.com:'
  processResult = (err, res, body) ->
    return msg.send err if err
    if res.statusCode == 301
      msg.http(res.headers.location).get() processResult
      return
    if res.statusCode > 300
      msg.reply "#{baseError} #{reasonError} #{res.statusCode}"
      return
    try
      result = JSON.parse(body)
    catch error
      msg.reply "#{baseError} #{reasonError} #{body}"
    if result? and result['imageUrl']?
      callback result['imageUrl']
    else
      msg.reply "#{baseError}"

  msg.http("http://memecaptain.com/g")
  .query(
    u: imageUrl,
    t1: text1,
    t2: text2
  ).get() processResult