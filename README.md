# docpad-plugin-addthis

[![Build Status](https://travis-ci.org/electblake/docpad-plugin-addthis.svg?branch=master)](http://travis-ci.org/lectblake/docpad-plugin-addthis "Check this project's build status on TravisCI")


All seven available addthis.com widget types. See: https://www.addthis.com/get/sharing#.UT-UARy9JG0

`<%- @getFloatingAddThisBlock('std','styles;',UrlCopyTrackingBoolean) %>`

`UrlCopyTrackingBoolean` is set to true or false to determine if addthis should track when someone copies the web page's url(in the asumption that they are copying it to share it). 


A real world example:

`<%- @getAddThisBlock('std','right:13px;top:115px;', false) %>`

will output 

![Alt text](http://4.bp.blogspot.com/--hQ6WcijYXw/UCVtsA98RyI/AAAAAAAAAfc/lc05n8JoEcs/s320/VS1.png "AddThis Vertical Floating Bar")
