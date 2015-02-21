toolbarStatus = new ReactiveDict
actions = ['bold', 'underline', 'italic', 'strikethrough', 'insertunorderedlist',
           'insertorderedlist', 'superscript', 'subscript',
           #'outdent', 'indent',
           'justifyleft', 'justifycenter', 'justifyright', 'justifyfull']
for action in actions
  toolbarStatus.set action, null

Template.textEditor.helpers
  status: (action) ->
    toolbarStatus.get action

Template.textEditor.events
  'click .document': (e, t)->
    for action in actions
      status = document.queryCommandValue(action)
      el = $(".editor-tools div>a[data-edit='" + action + "']")
      el = el.parent()
      console.log action, status
      if status == 'true'
        toolbarStatus.set action, 'active'
      else
        toolbarStatus.set action, null

  'click div.action': (e,t)->
    el = $(e.currentTarget)
    el_a = el.find('a')
    command_arg = $(el_a).attr('data-edit')
    command_arg = command_arg.split(' ')
    command = command_arg[0]
    arg = command_arg[1]
    if arg == ''
      arg = null
    document.execCommand(command, false, arg)

    status = document.queryCommandValue(action)
    if status == true # 'active'
      toolbarStatus.set(command, null)
    else
      toolbarStatus.set(command, 'active')

  'mousedown .ui.dropdown': (e,t)->
    e.preventDefault()
  'click div>i.linkify': (e,t)->
    x = $(t.find('input.url')).val()

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
