# README
[![BuildStatus](https://travis-ci.org/team-datong/Datong.svg?branch=master)](https://travis-ci.org/team-datong/Datong)
[![CodeClimate](https://codeclimate.com/github/team-datong/Datong/badges/gpa.svg)](https://codeclimate.com/github/team-datong/Datong)
[![Test Coverage](https://codeclimate.com/github/team-datong/Datong/badges/coverage.svg)](https://codeclimate.com/github/team-datong/Datong/coverage)


Links:

* [Heroku App](https://datong.herokuapp.com)

* [Pivotal Tracker Project](https://www.pivotaltracker.com/n/projects/1879399)


PROJECT DESCRIPTION:
The Da-tong Society of China Studies is a cultural and academic organization. They want to add functionalities to their current website to make it more useful to their members.
They are looking for us to build a website for Datong that include functionalities like a member login system, course rating system, resource uploading and downloading, and integration of Google Calendar.

* [Current Client Website](https://datong.berkeley.edu/)

* [Mockups](http://imgur.com/a/d3HBG)

RULES OF ENGAGEMENT:
1. Create a must-have list to prioritize stories for the iteration
...Start w/ creating list of clarifying questions for the client
2. Track all progress in pivotal tracker
3. Master branch is final work/release:
...Never commit straight to master
...Always create a PR, merge once you get 2 approvals (and then delete branch on GitHub & locally)
...Need thumbs up from Travis CI (before receiving code review)
4. Unit of a commit = a lot of tiny changes, doesn’t really matter
5. Create a branch for each feature
6. Make a PR when completed
...Get thumbs up from Travis CI, 2 approvals, merge
...Otherwise, address CR comments, and iterate ^
...Generally, close if need to iterate and branch includes sensitive info (API keys, etc.)
7. Create a branch from Iter#Staging, name it depending on:
...Bug → Fix<bug name>
...Feature → Add<feature name>
...Test → Create<feature/bug name>Test
