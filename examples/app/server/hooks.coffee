post.before.insert (userId, doc) ->
  doc.text = sanitizeHtml(doc.text)

post.before.update (userId, doc, fieldNames, modifier, options) ->
  modifier.$set = modifier.$set || {}
  modifier.$set.text = sanitizeHtml(modifier.$set.text)

