chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'hubot-meme', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/hubot-meme')(@robot)

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/Test All the Tings/)

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/KHANIFY Do Tests/)

