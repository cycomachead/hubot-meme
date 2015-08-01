# Description:
#   Get a meme from http://memecaptain.com/
#   API Docs at:
#   github.com/mmb/meme_captain_web/blob/master/doc/api/create_meme_image.md
#
# This is a library file which can be used to interact with the memecaptian api in third-party hubot modules.
# See the meme.coffee script for an example of how to build your own custom memes with this API. Include this
# file with `memeGenerator = require "hubot-meme/src/lib/memecaptain.coffee"`
#
# Dependencies:
#   None
#
# Author:
#   bobanj
#   cycomachead, Michael Ball <cycomachead@gmail.com>
#   peelman, Nick Peelman <nick@peelman.us>
#   ericjsilva, Eric Silva
#   lukewaite, Luke Waite

createPostData = (imageID, lowerText, upperText) ->
  data = {
    src_image_id: imageID,
    private: true,
    captions_attributes: [
      {
        text: lowerText.trim(),
        top_left_x_pct: 0.05,
        top_left_y_pct: 0.75,
        width_pct: 0.9,
        height_pct: 0.25
      },
      {
        text: upperText.trim(),
        top_left_x_pct: 0.05,
        top_left_y_pct: 0,
        width_pct: 0.9,
        height_pct: 0.25
      }
    ]
  }
  return JSON.stringify(data)

module.exports = (msg, imageID, upperText, lowerText) ->
  MEME_CAPTAIN = 'http://memecaptain.com/gend_images'
  baseError = 'Sorry, I couldn\'t generate that meme.'
  reasonError = 'Unexpected status from memecaptain.com:'

  processResult = (err, res, body) ->
    return msg.reply "#{baseError} #{err}" if err
    if res.statusCode == 301
      msg.http(res.headers.location).get() processResult
      return
    if res.statusCode == 202 # memecaptain API success
      timer = setInterval(->
        msg.http(res.headers.location).get() (err, res, body) ->
          return msg.reply "#{baseError} #{err}" if err
          return if res.statusCode == 200 # wait for the image
          if res.statusCode == 303
            msg.send res.headers.location
            clearInterval(timer)
          else
            msg.reply "#{baseError} #{reasonError} #{res.statusCode} while waiting for the image"
      , 2000)
    if res.statusCode > 300 # memecaptain error
      msg.reply "#{baseError} #{reasonError} #{res.statusCode} when requesting the image"


  data = createPostData(imageID, lowerText, upperText)
  msg.robot.http(MEME_CAPTAIN)
  .header('accept', 'application/json')
  .header('Content-type', 'application/json')
  .post(data) processResult
