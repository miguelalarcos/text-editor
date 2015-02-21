text-editor
============
A simple text editor for Meteor.

Explanation
-----------
The use is as simple as:

```html
{{> textEditor id='myEditor'}}
```

You can extract the html with:

```coffee
$('#myEditor').val()
```

And set with:

```coffee
$('#myEditor').val('<b>hello</b>')
```

There's a demo online, [here](http://texteditor.meteor.com).

You must sanitize in the server side the html obtained, and can use for example the package ```sanitize-html```.

This package is inspired in the package [Editable Text for Meteor](https://atmospherejs.com/babrahams/editable-text).

Help to improve the package is welcome :)