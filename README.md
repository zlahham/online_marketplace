#Online Marketplace in Ruby


[![Build Status](https://travis-ci.org/zlahham/online_marketplace.svg?branch=master)](https://travis-ci.org/zlahham/online_marketplace)

[![Coverage Status](https://coveralls.io/repos/github/zlahham/online_marketplace/badge.svg?branch=master)](https://coveralls.io/github/zlahham/online_marketplace?branch=master)

Summary
-------
This is a command-line app that allows a client to checkout items with promotional rules, built in the Ruby language.

Challenges & Learning Outcomes
------------------------------
I particularly enjoyed building something from the ground up in Ruby again, while test driving the whole project.

I made sure that I used `guard` to help me TDD as efficiently as possible. As a result, I found that by using `guard`, I saved a lot of time when cleaning up and refactoring.

I constructed the program in a way to make it as easy as possible for a 'non-technical' team member to add/remove/ammend products, by introducing a Yaml file (`product_list.yml`) with all the the relevant data. In theory, this will not affect anything inside the logic, other than the promotional rules.

Future Plans
------------
- Implement a more complex version with more rules
- Build this with Rails
- Pull in external data from an API to populate the products

Installation
------------
```
git clone git@github.com:zlahham/online_marketplace.git
or
git clone https://github.com/zlahham/online_marketplace.git

cd online_marketplace

bundle
```
**Enjoy!**

Testing
-------
```
git clone git@github.com:zlahham/online_marketplace.git
or
git clone https://github.com/zlahham/online_marketplace.git

cd online_marketplace

bundle

rspec
```
