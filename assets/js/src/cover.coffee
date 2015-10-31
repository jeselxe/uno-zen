'use strict'

$ ->
  el = document.body
  isOpen = location.hash is '#open'

  _animate = ->
    setTimeout(->
      $('.cover').addClass 'animated'
    , 1000)

  _expand = (options = {})->
    $('.main, .cover, .links > li, html').toggleClass 'expanded'
    Uno.search.form options.form

  hasClass = (element, cls) ->
    (' ' + element.className + ' ').indexOf(' ' + cls + ' ') > -1

  animateCover = ->
    elements = ['logo', 'title', 'description', 'navigation', 'social']
    if hasClass(document.getElementById('aside-cover'), 'expanded')
      for name in elements
        $('#aside-cover-' + name).addClass 'wow'
    
  $('.nav-blog > a, #avatar-link').click (event) ->
    console.log("click blog")
    if Uno.is 'page', 'home'
      event.preventDefault()
      location.hash = if location.hash is '' then '#open' else ''
      return $('#menu-button').trigger 'click' unless Uno.is 'device', 'desktop'
      _expand form: 'toggle'

  $("#menu-button").click ->
    $('.cover, .main, #menu-button, html').toggleClass 'expanded'

  if (Uno.is 'device', 'desktop') and (Uno.is 'page', 'home')
    _animate()
    _expand(aside: 'hide', form: 'hide') if !isOpen
    animateCover()