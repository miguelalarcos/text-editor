Template.home.events
  'click #extract': (e,t)->
    console.log $('#myEditor').val()
  'click button.new': (e,t)->
    post.insert({text:'un nuevo post'})
  'click button.save': (e,t)->
    _id = $(e.target).attr('_id')
    prev = $(e.target).prev()
    post.update _id, {$set: {text: prev.val()}}
  'click button.remove': (e,t)->
    _id = $(e.target).attr('_id')
    post.remove _id

Template.home.helpers
  posts : -> post.find({})
  content: -> this.text

