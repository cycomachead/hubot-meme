# hubot-meme

Zero-configuration memes for your hubot via memecaptain.com

See [`src/meme.coffee`](src/meme.coffee) for full documentation.

Why `hubot-meme`?
Unlike many other meme scripts, memecaptain.com requires no API keys and has a painless setup. :smile:

## Installation

In hubot project repo, run:

`npm install hubot-meme --save`

Then add **hubot-meme** to your `external-scripts.json`:

```json
[
  "hubot-meme"
]
```

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