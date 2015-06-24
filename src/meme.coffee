# Description:
#   Get a meme from http://memecaptain.com/
#   API Docs at:
#   github.com/mmb/meme_captain_web/blob/master/doc/api/create_meme_image.md
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
    memeGenerator msg, 'NryNmg', 'Y U NO', msg.match[1]

  robot.respond /aliens guy (.+)/i, (msg) ->
    memeGenerator msg, 'sO-Hng', msg.match[1], ''

  robot.respond /brace yourself (.+)/i, (msg) ->
    memeGenerator msg, '_I74XA', 'Brace Yourself', msg.match[1]

  robot.respond /(.*) (ALL the .*)/i, (msg) ->
    memeGenerator msg, 'Dv99KQ', msg.match[1], msg.match[2]

  robot.respond /(I DON'?T ALWAYS .*) (BUT WHEN I DO,? .*)/i, (msg) ->
    memeGenerator msg, 'V8QnRQ', msg.match[1], msg.match[2]

  robot.respond /(.*)(SUCCESS|NAILED IT.*)/i, (msg) ->
    memeGenerator msg, 'AbNPRQ', msg.match[1], msg.match[2]

  robot.respond /(.*) (\w+\sTOO DAMN .*)/i, (msg) ->
    memeGenerator msg, 'RCkv6Q', msg.match[1], msg.match[2]

  robot.respond /(NOT SURE IF .*) (OR .*)/i, (msg) ->
    memeGenerator msg, 'CsNF8w', msg.match[1], msg.match[2]

  robot.respond /(YO DAWG .*) (SO .*)/i, (msg) ->
    memeGenerator msg, 'Yqk_kg', msg.match[1], msg.match[2]

  robot.respond /(All your .*) (are belong to .*)/i, (msg) ->
    memeGenerator msg, '76CAvA', msg.match[1], msg.match[2]

  robot.respond /(.*)\s*BITCH PLEASE\s*(.*)/i, (msg) ->
    memeGenerator msg, 'jo9J0Q', msg.match[1], msg.match[2]

  robot.respond /(.*)\s*COURAGE\s*(.*)/i, (msg) ->
    memeGenerator msg, 'IMQ72w', msg.match[1], msg.match[2]

  robot.respond /ONE DOES NOT SIMPLY (.*)/i, (msg) ->
    memeGenerator msg, 'da2i4A', 'ONE DOES NOT SIMPLY', msg.match[1]

  robot.respond /(IF YOU .*\s)(.* GONNA HAVE A BAD TIME)/i, (msg) ->
    memeGenerator msg, 'lfSVJw', msg.match[1], msg.match[2]

  robot.respond /(.*)TROLLFACE(.*)/i, (msg) ->
    memeGenerator msg, 'mEK-TA', msg.match[1], msg.match[2]

  robot.respond /(IF .*), ((ARE|CAN|DO|DOES|HOW|IS|MAY|MIGHT|SHOULD|THEN|WHAT|WHEN|WHERE|WHICH|WHO|WHY|WILL|WON\'T|WOULD)[ \'N].*)/i, (msg) ->
    memeGenerator msg, '-kFVmQ', msg.match[1], msg.match[2] + (if msg.match[2].search(/\?$/)==(-1) then '?' else '')

  robot.respond /(.*)(AND IT\'S GONE.*)/i, (msg) ->
    memeGenerator msg, 'uIZe3Q', msg.match[1], msg.match[2]

  robot.respond /WHAT IF I TOLD YOU (.*)/i, (msg) ->
    memeGenerator msg, 'fWle1w', 'WHAT IF I TOLD YOU', msg.match[1]


memeGenerator = (msg, id, upperText, lowerText) ->
  MEME_CAPTAIN = 'http://memecaptain.com/gend_images'
  resultImg = 'http://i.memecaptain.com/gend_images/'
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
      result = res.headers.location
    catch error
      msg.reply "#{baseError} #{reasonError} #{body}"
    if result?
      id = result.split('/')
      id = id[id.length - 1]
      msg.send "#{resultImg}#{id}.png"
    else
      msg.reply "#{baseError}"


  data = {
    src_image_id: id,
    captions_attributes: [
      {
        text: upperText.trim(),
        top_left_x_pct: 0.05,
        top_left_y_pct: 0,
        width_pct: 0.9,
        height_pct: 0.25
      },
      {
        text: lowerText.trim(),
        top_left_x_pct: 0.05,
        top_left_y_pct: 0.75,
        width_pct: 0.9,
        height_pct: 0.25
      }]
  }
  
  msg.robot.http(MEME_CAPTAIN)
      .header('accept', 'application/json')
      .header('Content-type', 'application/json')
      .post(JSON.stringify(data)) processResult