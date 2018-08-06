# geo [![Build Status](https://travis-ci.org/rhydiant/geo-flutter.svg)](https://travis-ci.org/rhydiant/geo-flutter) [![Coverage Status](https://coveralls.io/repos/github/rhydiant/geo-flutter/badge.svg?branch=master)](https://coveralls.io/github/rhydiant/geo-flutter?branch=master)

A time-boxed evaluation of flutter.io, building out an iOS/Android app.

<img src="https://thumbs.gfycat.com/ImpartialCapitalDuckbillplatypus-size_restricted.gif" height="300">

Based on [harmony-ui-kit-sketch-freebie](https://www.sketchappsources.com/free-source/2657-harmony-ui-kit-sketch-freebie-resource.html) as the design spec and a [sandboxed API](https://getsandbox.com/sandboxes/willyweather-stub).

See [Wiki](https://github.com/rhydiant/geo-flutterio/wiki) for more.


## Usage

Follow the [install instructions](https://flutter.io/setup-macos/) to setup flutter.io and run `flutter doctor` to verify your installation.

Install dependencies with:

    flutter package get
    
### API keys

In order to access Google Maps API `mv assets/keys.template.json assets/keys.json` and add your own API key, which you can setup at the [Google Maps API console](https://developers.google.com/maps/documentation/maps-static/intro)

### Running the app

Start a [simulator](https://github.com/rhydiant/geo-flutterio/wiki/Simulators) and do `flutter run`.

To run on a connected device (with release optimizations):

    flutter run --release

### Running tests

Unit and widgets tests run with:

    flutter test
    
(WIP) Integration tests run with:

    flutter drive --target=test_driver/launcher.dart 
