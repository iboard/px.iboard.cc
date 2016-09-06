# iBoard - README

## Github

  - [Source][] `http://github.com/iboard/px.iboard.cc/`
  - [Homepage][] `http://iboard.github.io/px.iboard.cc/`

### .git/config

    # file .git/config

    [remote "origin"]
      url = git@github.com:iboard/px.iboard.cc.git
      fetch = +refs/heads/*:refs/remotes/origin/*
    [branch "master"]
      remote = origin

## About

*iBoard.cc* has a tradition in building small blogging- and/or content management
systems. In the past I did 

  * board - not online anymore. First version written in PHP.
  * XBA - not online anymore. Used XML as a datastor {bad idea by the way}
  * [Userbase][] - First RAILS implementation
  * [CBA][] - Mature RAILS content management 
  * [WAT][] - Used in production at WWEDU for a complete distance learning cluster.
  * [YARB][] - A ruby version using plain `PStore` instead of any database
  * [px.iboard.cc][] Finaly, this one is the Elixir/Phoenix lap.

## How to start

First install the requirements ...

### Requirements

  * Elixir
  * Phoenix
  * MongoDB
  * PhantomJS

### Start from scratch

Clone the project from http://github.com/iboard/px.iboard.cc, cd into it, get
the deps install node-modules and run the server.

    git clone git@github.com:iboard/px.iboard.cc.git iboard
    cd iboard
    mix deps.get
    mix ecto.create && mix ecto.migrate
    npm install
    mix phoenix.server

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


## Running the tests

### Run all tests including end-to-end with webdriver (slow)

  1. Start PhantomJS `phantomjs --wd`
  2. run the tests `mix test --trace`

## Run without end-to-end test (fast)

  1. No need to start PhantomJS
  2. run `mix test --trace --exclude webdriver`

## Contribution

Feel free to collaborate by sending [pull requests]. But be warned: I'll accept
only code which is done TDD and almost perfect ;-)

Don't hesitate to contact me [@Nickendell][], [Google][], or [email][].
At [iboard.cc][] you'll find more about me and you may post questions and
comments there.

# Further information

See `HOWTO.md` and `CHANGELOG.md` 

[Userbase]: http://github.com/iboard/userbase
[CBA]: http://github.com/iboard/cba
[WAT]: http://github.com/iboard/wat
[YARB]: http://github.com/iboard/yarb
[px.iboard.cc]: http://github.com/iboard/px.iboard.cc
[@Nickendell]: https://twitter.com/#Nickendell
[Google]: https://plus.google.com/+AndreasAltendorfer
[email]: mailto:andreas@altendorfer.at
[iboard.cc]: http://iboard.cc
[pull requests]: https://github.com/iboard/px.iboard.cc/pulls
[Github]: https://github.com/iboard/px.iboard.cc
[Source]: https://github.com/iboard/px.iboard.cc
[Homepage]: http://iboard.github.io/px.iboard.cc/


