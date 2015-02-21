Package.describe({
  name: 'miguelalarcos:text-editor',
  version: '0.1.1',
  summary: 'A simple text editor',
  git: 'https://github.com/miguelalarcos/text-editor.git',
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.0.3.1');
  api.use('coffeescript', 'client');
  api.use('templating', 'client');
  api.use('jquery', 'client');
  api.use('reactive-dict', 'client');
  api.use('nooitaf:semantic-ui@1.9.2', 'client');
  api.use('tommyjs:colpick@0.1.0', 'client');

  api.addFiles('text-editor.html', 'client');
  api.addFiles('text-editor.coffee', 'client');
  api.addFiles('text-editor.css', 'client');

});
