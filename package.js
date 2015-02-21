Package.describe({
  name: 'miguelalarcos:text-editor',
  version: '0.1.0',
  summary: 'A simple text editor',
  git: '',
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.0.3.1');
  api.use('coffeescript', 'client');
  api.use('templating', 'client');
  api.use('jquery', 'client');
  api.addFiles('text-editor.html', 'client');
  api.addFiles('text-editor.coffee', 'client');
  api.addFiles('text-editor.css', 'client');

});