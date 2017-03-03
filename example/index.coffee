"use strict"

{Phaser} = this

RATE = 20

SECOND = 1000

SIZE = 16

TEXT = "THE EVE OF THE WAR
\n\nNo one would have believed in the last years of the nineteenth
century that this world was being watched keenly and closely by
intelligences greater than man's and yet as mortal as his own; that as
men busied themselves about their various concerns they were
scrutinised and studied, perhaps almost as narrowly as a man with a
microscope might scrutinise the transient creatures that swarm and
multiply in a drop of water. With infinite complacency men went to
and fro over this globe about their little affairs, serene in their
assurance of their empire over matter. It is possible that the
infusoria under the microscope do the same. No one gave a thought to
the older worlds of space as sources of human danger, or thought of
them only to dismiss the idea of life upon them as impossible or
improbable. It is curious to recall some of the mental habits of
those departed days. At most terrestrial men fancied there might be
other men upon Mars, perhaps inferior to themselves and ready to
welcome a missionary enterprise. Yet across the gulf of space, minds
that are to our minds as ours are to those of the beasts that perish,
intellects vast and cool and unsympathetic, regarded this earth with
envious eyes, and slowly and surely drew their plans against us."

window.GAME = new (Phaser.Game)
  antialias: no
  # height: 600
  # renderer: Phaser.CANVAS
  # resolution: 1
  scaleMode: Phaser.ScaleManager.NO_SCALE
  # transparent: false
  # width: 800
  state:

    init: ->
      @game.plugins.add Phaser.Plugin.DebugTween
      return

    preload: ->
      @load.path = "example/assets/"
      @load.bitmapFont "font", "nokia16.png", "nokia16.xml"
      @load.image "atari", "atari130xe.png"
      @load.image "starfield", "starfield.png"
      return

    create: ->
      stars = @add.tileSprite 0, 0, 800, 600, "starfield"
      atari = @add.image 0, 0, "atari"
        .alignIn @world.bounds, Phaser.CENTER, 0, 200
      # Phaser.Text:
      # @text = @add.text 100, 50, "", {fill: "aqua", font: "bold 16px Consolas, Menlo, monospace", wordWrap: true, wordWrapWidth: 600}
      @text = @add.bitmapText 100, 50, "font", null, SIZE
      @text.blendMode = Phaser.blendModes.ADD
      @text.maxWidth = 600
      @text.tint = 0x0099ff
      # @text.text = TEXT
      @options =
        autoStart: yes
        rate: RATE
        cursorChar: "_"
        text: TEXT
        textTarget: @text
      @type = @add.teletype @options
      @type.onComplete.add @onTypeComplete, this
      @add.tween stars.tilePosition
        .to
          x: @world.width
          y: @world.height
        , @type.totalDuration
        .start()
      @add.tween atari
        .from
          alpha: 0
          y: @world.height
        , SECOND, "Quad"
        .start()
      @textTween = @add.tween @text
        .from
          alpha: 0
          y: 0
        , SECOND, "Quad"
        .start()
      return

    render: ->
      # @game.debug.object @options, 20, 20,
      #   color: "auto"
      #   label: "game.add.teletype"
      return

    onTypeComplete: ->
      @add.tween @text
        .to
          alpha: 0
          y: 0
        , 2 * SECOND, "Quad"
        .delay 2 * SECOND
        .start()
      return
