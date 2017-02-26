"use strict"

{Phaser} = this

# {extend} = Phaser.Utils

Phaser.Tween.Teletype = class Teletype extends Phaser.Tween

  rate: null

  cursorChar: ""

  constructor: (target, game, manager, options) ->
    @text = options.text
    target = length: @text.length
    super target, game, manager
    @cursorChar = options.cursorChar
    @textTarget = options.textTarget
    if options.rate
      options.duration = 1000 * @text.length / options.rate
    @from {length: 0}, options.duration, "Linear", options.autoStart, options.delay
      .onUpdateCallback @onUpdate, this
    # @onComplete.add @_onComplete, this

  # _onComplete: ->
  #   return

  onUpdate: (tween, val) ->
    @textTarget.text = @text.slice(0, ~~(0.5 + val * @text.length)) + @cursorChar
    return

Phaser.GameObjectFactory::teletype = (options) ->
  new Phaser.Tween.Teletype null, @game, @game.tweens, options
