# brandie

This is the demo project for brandie.

You can run it by following the instructions to run a flutter application.

I have only tested it on android device for now, but it should be running on IOs as well.

There are some open issues on github regarding flutter_svg and impeller. In case the project doesn't run you may need to disable impeller for your flutter installation.

My System:
```
Flutter: 3.29.2
Dart: 3.7.2
Android Sdk: 35.0.1
OS: MacOS 15.3.2
```

# Assumptions and improvements

* Assuming: page transition as follows:
    * First the image scrolls
    * The text and other state updates

* Assuming: the tabs on top bar all contain separate pages, which aren't made
* Assuming: the bottom buttons are actions, and first one is the quick sales link button, rest of the buttons do no action.
* Assuming: the caption is in a specific format:
    * First part is just a hook with a body
    * Second is the hashtags
    * Third contains various links and redirections.
* Assuming: I can use any matching font, Oriflame Sans 2.0 isn't available anywhere. I have used poppins.

* Improvements: Proper state handling
* Improvements: Animations
* Improvements: Caption parsing and editing