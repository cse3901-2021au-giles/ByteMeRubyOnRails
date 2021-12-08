# ByteMeRubyOnRails

ByteMeRubyOnRails is Team Byte Me (of Charlie Giles' 5:30 section of CSE 3901)'s version of a Peer Evaluation Tool.

## Introduction

The Byte Me Peer Evaluation Tool project is a web app that allows students to evaluate each other on their performance. Some key features that we have included are a "Remember Me" feature so you don't have to re-login, combining of the professor and student users into one table of the database with a string variable called "user_type" that allows for future expansions in functionality, a time window/deadline to complete evaluations, and unique profile pictures for each user. The goal of this tool is for professors to be able to add students to their class, put them in groups, and have the members of each group evaluate each other.

## Requirements

* Ruby (Version 2.6 or greater)
* Rails (Version 6 or greater)
* RubyGems (Version 3.0 or greater)

## Installation & Run Instructions
1. Download the project file to your machine that contains all of the requirements.
2. Change the directory to where you downloaded the project file.
3. Ensure that your yarn packages are up to date. If you don't, run the following command in the command line:
```
$ yarn install --check-files
```
4. Use Bundler to install and include gems needed by the tool using the following command:
```
$ bundle install
```
5. Seed the database using the following command:
```
$ rails db:seed
```
6. Use the following command to run the server and utilize the tool:
```
$ rails server
```
7. Right click on one of the links after the text "Listening on" and click open link.
8. Make sure to read the instructions before using the tool so you know how to use it properly.
9. Sign up and use the Peer Evaluation Tool!

## Test Run Instructions
1. Change the directory to where you downloaded the project file.
2. Change the directory to the test folder using the following command:
```
$ cd test
```
3. Ensure that you have yarn jest installed. If you don't, run the following command:
```
$ yarn add --dev jest
```
4. Run the following command to run all of the tests and see their pass/fail results:
```
$ yarn jest
```

## Contributing

Pull requests are NOT welcome, but comments are!

## Maintainers

- John Gossett
- Aastha Gupta
- Hannah Nguyen
- Jiaqi Xu

This README would normally document whatever steps are necessary to get the application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* Images
 The image in the jumbotron background (on the home page) was found at https://global-uploads.webflow.com/5d64efaf6ed3eef3fca10861/5dbfe26c5102da1b585c3461_annie-spratt-QckxruozjRg-unsplash.jpg
