# hubot-meme

Zero-configuration memes for your hubot via memecaptain.com

See [`src/meme.coffee`](src/meme.coffee) for full documentation.

Why `hubot-meme`?
Unlike many other meme scripts, memecaptain.com requires no API key and has a painless setup. :smile:

## Installation

In hubot project repo, run:

`npm install hubot-meme --save`

Then add **hubot-meme** to your `external-scripts.json`:

```json
[
  "hubot-meme"
]
```
## Extra  Extra Memes!
Can't get enough?

In your environment variables set:

```
HUBOT_EXTRA_MEMES=True
```
This switches the `robot.respond` function to `robot.hear` so that your Hubot will match all text in the chatroom.

## Sample Interaction

```
user1>> hubot help meme
hubot>> [Displays all possible memes]
user1>> @hubot Generate all the memes
hubot>> http://i.memecaptain.com/gend_images/PESlaQ.jpg
```

## Currently Enabled Memes
See [meme.coffee](src/meme.coffee#L9)

Feel free to submit a pull-request if you want a meme added!

## Extending Memes
By default, I'm keeping this set of memes and commands fairly clean and appropriate for a workplace. You can extend the memes in your own bot's code by `require`ing the `memecaptain.coffee` file, which handles all the API interactions.

Sample:

```
memeGenerator = require "hubot-meme/src/lib/memecaptain.coffee"

module.exports = (robot) ->
  robot.respond /(.+) (ALL the .+)/i, id: 'meme.all-the-things', (msg) ->
    memeGenerator msg, 'Dv99KQ', msg.match[1], msg.match[2]
```

New meme images can be added at http://memecaptain.com by pasting the URL into the `Load URL` then hitting enter. The `src` param of the URL is your image ID.
