#= require jquery
#= require jquery_ujs
#= require underscore
#= require gmaps/google
#= require ckeditor/init
#= require bootstrap-sprockets
#= require unify

#= require ./public/google_analytics
#= require ./public/listvytsia
#= require_tree ./public/listvytsia

# Pictures Engine
#= require angular
#= require angular-resource
#= require angular-rails-templates
#= require ng-file-upload-all
#= require ui-bootstrap-tpls-1.3.1
#= require angular-confirm
#= require pictures

# Hotels Engine
#= require hotels

# This will cause app to compile when Turbolinks loads a new page
# and removes the need for ng-app in the DOM
$(document).on 'ready page:load', ->
  angular.bootstrap(document, ['pictures', 'hotels'], { strictDi: true })
