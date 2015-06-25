# hubot-meme

Zero-configuration memes for your hubot via memecaptain.com

See [`src/meme.coffee`](src/meme.coffee) for full documentation.

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
hubot>> ...
```

## Currently Enabled Memes
```
hubot Y U NO <text> - Meme: Y U NO GUY w/ bottom caption
hubot I don't always <something> but when i do <text> - Meme: The Most Interesting man in the World
hubot <text> (SUCCESS|NAILED IT) - Meme: Success kid w/ top caption
hubot <text> ALL the <things> - Meme: ALL THE THINGS
hubot <text> TOO DAMN <high> - Meme: THE RENT IS TOO DAMN HIGH guy
hubot Yo dawg <text> so <text> - Meme: Yo Dawg
hubot All your <text> are belong to <text> - Meme: All your <text> are belong to <text>
hubot If <text>, <question> <text>? - Meme: Philosoraptor
hubot <text>, BITCH PLEASE <text> - Meme: Yao Ming
hubot <text>, COURAGE <text> - Meme: Courage Wolf
hubot ONE DOES NOT SIMPLY <text> - Meme: Boromir
hubot IF YOU <text> GONNA HAVE A BAD TIME - Meme: Ski Instructor
hubot IF YOU <text> TROLLFACE <text> - Meme: Troll Face
hubot Aliens guy <text> - Meme: Aliens guy
hubot Brace yourself <text> - Meme: Ned Stark braces for <text>
hubot Not sure if <something> or <something else> - Meme: Futurama Fry
hubot <text>, AND IT'S GONE - Meme: Bank Teller
hubot WHAT IF I TOLD YOU <text> - Meme: Morpheus "What if I told you"
hubot WTF <text> - Picard WTF
hubot IF <text> THAT'D BE GREAT - Generates Lumberg
hubot MUCH <text> (SO|VERY) <text> - Generates Doge
hubot <text> EVERYWHERE - Generates Buzz Lightyear
```

Feel free to submit a pull-request if you want a meme added!