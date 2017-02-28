![Screenshot](https://samme.github.io/phaser-teletype/screenshot.png)

[Demo](https://samme.github.io/phaser-teletype/)

Use
---

```javascript
var teletype = game.add.teletype({
  autoStart:  true,
  cursorChar: "_",
  rate:       20,
  text:       "Amazingly few discotheques provide jukeboxes",
  textTarget: textOrBitmapTextObject
});

// Without `autostart`:

teletype.start();

// Events:

teletype.onComplete.add(function (){
  // …
});
```

Options
-------

Options must include `text`, `textTarget`, and either `rate` or `duration`.

- `autoStart`: start immediately (default: `false`)
- `rate`: typing speed (characters/second); 10–30 is typical
- `duration`: length of the entire animation (ms)
- `cursorChar`: character placed at the end of `text` (default: empty string)
- `text`
- `textTarget`: a [BitmapText](http://phaser.io/docs/2.6.2/Phaser.BitmapText.html) or [Text](http://phaser.io/docs/2.6.2/Phaser.Text.html) object

