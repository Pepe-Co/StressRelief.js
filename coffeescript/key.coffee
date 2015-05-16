App.keyboard = (keyCode) ->
  key = {}
  key.code = keyCode
  key.isDown = false
  key.isUp = true
  key.press = undefined
  key.release = undefined

  #The `downHandler`
  key.downHandler = (event) ->
    if event.keyCode == key.code
      if key.isUp and key.press
        key.press()
      key.isDown = true
      key.isUp = false
    event.preventDefault()
    return

  #The `upHandler`
  key.upHandler = (event) ->
    if event.keyCode == key.code
      if key.isDown and key.release
        key.release()
      key.isDown = false
      key.isUp = true
    event.preventDefault()
    return

  #Attach event listeners
  window.addEventListener 'keydown', key.downHandler.bind(key), false
  window.addEventListener 'keyup', key.upHandler.bind(key), false
  key