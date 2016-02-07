HOWTO
=====

What I did before the first commit
----------------------------------

    mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
    mix phoenix.new iboard --database mongodb
    cd iboard
    mix ecto.create
    mix test

And I got

    ....

    Finished in 0.2 seconds (0.2s on load, 0.05s on tests)
    4 tests, 0 failures

Then I did `git init .` and added two lines to `.gitignore` which are

    tags                # I'm using ctags and this must not go to the repo
    **/*swp             # Using vim I won't see swap-files in the repo

Finally I added this file `HOWTO.md` to have a place where I can document
steps which are not obviously when browsing the repository's history.

February 07, 2016, I start with a clean, generated repository of `iboard`

Further steps can be found in CHANGELOG.md. Note: in `CHANGELOG.md` I will
document with short messages only. Find the date given in CHANGELOG and search
for this date here. Maybe you'll find more information on a specific change.

----

CHANGELOG Documentation
=======================

2016-02-07: Preparation - read `What I did before the first commit` on top
            of this file.


