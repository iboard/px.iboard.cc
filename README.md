iBoard - README
===============

iBoard.cc has a tradition in building small blogging- and/or content management
systems. This one is the Elixir/Phoenix lap.

## How to start

### Requirements

  * Elixir
  * Phoenix
  * MongoDB

### Start from scratch

First clone the project from http://github.com/iboard/px.iboard.cc

    git clone git@github.com:iboard/px.iboard.cc.git iboard
    cd iboard
    mix deps.get
    mix ecto.create && mix ecto.migrate
    npm install
    mix phoenix.server

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Further information

See `HOWTO.md` and `CHANGELOG.md` 

