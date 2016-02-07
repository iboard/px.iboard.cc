
Iboard =
  iboard: ->
    md = require('marked')
    options = {
      gfm: true,
      tables: true,
      breaks: true,
      pedantic: false,
      sanitize: true,
      smartLists: true,
      smartypants: true
    }

    markdownElements = document.getElementsByClassName("markdown")
    for element in markdownElements
      markdown = md( element.getAttribute("text"), options )
      element.innerHTML = markdown


module.exports =
  Iboard: Iboard
