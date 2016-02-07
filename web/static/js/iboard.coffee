
Iboard =
  iboard: ->
    md = require('marked')
    options = {
      gfm: true,
      tables: true,
      breaks: false,
      pedantic: false,
      sanitize: false,
      smartLists: true,
      smartypants: true
    }

    markdownElements = document.getElementsByClassName("markdown")
    for element in markdownElements
      markdown = md( element.getAttribute("text"), options )
      element.innerHTML = markdown


module.exports =
  Iboard: Iboard
