# geo

A time-boxed evaluation of flutter.io, building out an iOS/Android app.

<img src="https://thumbs.gfycat.com/SecondaryGratefulAmphiuma-size_restricted.gif" width="200">

Using [harmony-ui-kit-sketch-freebie](https://www.sketchappsources.com/free-source/2657-harmony-ui-kit-sketch-freebie-resource.html) as the design spec and a [sandboxed API](https://getsandbox.com/sandboxes/willyweather-stub).

See [Wiki](https://github.com/rhydiant/geo-flutterio/wiki) for more.


## Usage

Follow the [install instructions](https://flutter.io/setup-macos/) to setup flutter.io and run `flutter doctor` to verify your installation.

Install dependencies with:

    flutter package get

Start a [simulator](https://github.com/rhydiant/geo-flutterio/wiki/Simulators) and do `flutter run`.

To run on a device (with release optimizations):

    flutter run --release

### Running tests

Unit and widgets tests run with:

    flutter test
    
(WIP) Integration tests run with:

    flutter drive --target=test_driver/launcher.dart 
