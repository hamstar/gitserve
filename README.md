Actually... this is useless.  May as well use [gitolite](https://github.com/sitaramc/gitolite).
===========================================================

gitserve
========

Ruby gem for serving git repositories.

Based on the script by [Richard Taylor](https://moocode.com/posts/6-code-your-own-multi-user-private-git-server-in-5-minutes).

## Basic Features

Some basic features are:

* set access to repos by private/public keys
* specify access level (read or write)

## Usage

This is how I want this to work eventually.

    gitserve repo add /path/to/james.git                        # [1]
    gitserve user add james "ssh-rsa AAz34... james@jamesbox"   # [2]
    gitserve user add jim -i /path/to/id_rsa.pub                # [3]
    gitserve repo allow james.git @james+ @jim                  # [4]

This shows normal usage of gitserve:

1. james' repo is added
2. james is added with his public key specified at command line
3. jim is added with public key specified as a file
4. james is given write access and jim is given read access


    gitserve repo del /path/to/james.git
    gitserve user del jim

The command called when checking the permissions:

    gitserve check james
