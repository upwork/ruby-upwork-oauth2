Ruby bindings for Upwork API (OAuth2)
============

[![License](https://img.shields.io/github/license/upwork/ruby-upwork-oauth2)](http://www.apache.org/licenses/LICENSE-2.0.html)
[![Gem Version](https://badge.fury.io/rb/ruby-upwork-oauth2.svg)](http://badge.fury.io/rb/ruby-upwork-oauth2)
[![GitHub release](https://img.shields.io/github/release/upwork/ruby-upwork-oauth2.svg)](https://github.com/upwork/ruby-upwork-oauth2/releases)
[![Build Status](https://github.com/upwork/ruby-upwork-oauth2/workflows/build/badge.svg)](https://github.com/upwork/ruby-upwork-oauth2/actions)

# Upwork::Api

This project provides a set of resources of Upwork API from http://developers.upwork.com
 based on OAuth 2.0.

# Features
The library supports all GraphQL calls, which are publicly shared at Upwork

# License

Copyright 2018 Upwork Corporation. All Rights Reserved.

ruby-upwork is licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## SLA
The usage of this API is ruled by the Terms of Use at:

    https://developers.upwork.com/api-tos.html

# Application Integration
To integrate this library you need to have:

* Ruby >= 1.9.3
* OAuth2 Extension installed (use `gem install oauth2`)

## Installation

Add this line to your application's Gemfile:

    gem 'ruby-upwork-oauth2'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-upwork-oauth2

## Usage

1.
Follow instructions from the `Installation` section.

2.
Open `example.rb` and type the `client_id` (a.k.a. consumer key), `client_secret` (a.k.a. consumer secret) and `redirect_uri` that you previously got from the API Center.
***That's all. Run your app as `ruby example.rb` and have fun.***'
