---
  layout: post
---

# PX.iBOARD.CC CHANGELOG

This change log is meant to be readed top to bottom. So, latest information
is on top.

There is a description of the file format at the end of it.

----

#### Epics

| Epic          | Name                       |
|---------------|----------------------------|
| _Account_     | Account and Authentication |
| _Account_     | Profile                    |
| _Basics_      | Images and Attachments     |
| _Account_     | Avatar                     |
| _Pages_       | Comments                   |
| _Pages_       | Versioning                 |
| _Pages_       | Tagging                    |
| _Pages_       | State/Workflow of pages    |
| _Patges/API_  | CRUD                       |
| _Nice2Have_   | Nice to have but no hurry  |

----

{% include next_steps.md %}

----

## 0.0.0 - 2016-05-15

### Refactor

_Basics_ | Review README, CHANGELOG

----

## 0.0.0 - 2016-05-10

#### Added

_Pages_ | Add sort-button for index-view. (Sort by updated\_at)

----

## 0.0.0 - 2016-04-03

#### Changed

_Basics_ | Pimp the layout. Add Page.preview

----

## 0.0.0 - 2016-02-24

#### Added

_Pages_ | Add Page Model - id, title, body

_Pages_ | CRUD Page HTML

----

## 0.0.0 - 2016-02-08

#### Test

_Pages_ | Add missing test (how I could miss them?)

#### Refactor

_Pages_ | Refactor controller (one function to render md-files)

----

## 0.0.0 - 2016-02-07

### Added

_Pages_ | Add node-based javascripts (marked), see commit 782ebc9

----

## 0.0.0 - 2016-02-07

### Added

_Basics_ | Generating a new Phoenix-MongoDb-Project.
Read `HOWTO.md` for more information.

_Basics_ | Add `LICENCE.md`

<center>••• ••• •••</center>

# Appendix

Change log format:

    ## VERSION -YYYY-MM-DD [tag]
    #### Added
    #### Fixed
    #### Changed
    #### Deprecated
    #### Refactor
    #### Test

Sections with empty body may ommitted.


## Version

If the following block describes a change already done, the version is the
version wehre the change occurs first.

Within the TODO section, the version is the version where this feature, fix,
whatever is planned to be released. VERSION\* marks a MUST BE released with
this version. 

•••

