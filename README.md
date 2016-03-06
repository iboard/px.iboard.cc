iBoard - README
===============

iBoard.cc has a tradition in building small blogging- and/or content management
systems. In the past I did 

  * XBA - not online anymore. Used XML as a datastor {bad idea by the way}
  * [Userbase][] - First RAILS implementation
  * [CBA][] - Mature RAILS content management 
  * [WAT][] - Used in production at WWEDU for a complete distance learning cluster.
  * [px.iboard.cc][] Finaly, this one is the Elixir/Phoenix lap.

## How to start

First install the requirements ...

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

[Userbase]: http://github.com/iboard/userbase
[CBA]: http://github.com/iboard/cba
[WAT]: http://github.com/iboard/wat
[px.iboard.cc]: http://github.com/iboard/px.iboard.cc

