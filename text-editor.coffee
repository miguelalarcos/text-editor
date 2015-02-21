Template.textEditor.events
  'click div.action>a': (e,t)->
    command_arg = $(e.currentTarget).attr('data-edit')
    command_arg = command_arg.split(' ')
    command = command_arg[0]
    arg = command_arg[1]
    if arg == ''
      arg = null
    document.execCommand(command, false, arg)

Template.textEditor.events
  'mousedown .ui.dropdown': (e,t)->
    e.preventDefault()
  'click div>i.linkify': (e,t)->
    x = $(t.find('input.url')).val()
    console.log x
    document.execCommand('createLink', false, x)

$.valHooks['textEditor'] =
  get : (el)->
    $(el).children('.document').html()
  set : (el, value)->
    $(el).children('.document').html(value)


$.fn.textEditor = ->
  this.each -> this.type = 'textEditor'
  this

Template.textEditor.rendered = ->
  $('.ui.dropdown').dropdown()
  $('div.color').colpick
    onChange: (x, y) ->
      document.execCommand('foreColor', false, y)
  $(this.findAll('.text-editor')).textEditor()
