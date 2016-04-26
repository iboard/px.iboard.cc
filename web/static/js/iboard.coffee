
Iboard =
  iboard: ->
    markdownElements = document.getElementsByClassName("markdown")
    this.doMarkdown(markdownElements)

  doMarkdown: (elements) ->
    md = require('marked')
    options = { 
      gfm: true, tables: true, breaks: true, pedantic: false,
      sanitize: true, smartLists: true, smartypants: true 
    }

    for element in elements
      markdown = md( element.getAttribute("text"), options )
      element.innerHTML = markdown

module.exports =
  Iboard: Iboard
