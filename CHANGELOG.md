## [2.3.0] - 19 September 2022

- **New**: Added an option to control the speed of the bubble going through the screen.
- **Fix**: Project dependencies updated to latest version.

## [2.2.0] - 01 April 2022

- **New**: Added functionality to support multiple random bubble colors.
- **Breaking Change**: `colorOfBubbles` is changed to `colorsOfBubbles`
- **Fix**: Project dependencies updated to latest version.

## [2.1.1] - 23 June 2021

- **Fix**: Project dependencies updated to latest version.

## [2.1.0] - 25 March 2021

- **New**: Added a new shape `BubbleShape.roundedRectanle`.
- **Fix**: Example App is completely null safe now.
- **Fix**: Fixed minor bugs.

## [2.0.0] - 13 March 2021

- **New**: Floating Bubbles Package is Sound Null Safe (Flutter 2.0).
- **Fix**: Removed Widgets that got depreciated in Flutter 2.0 in the example.
- **Fix**: Fixed minor null errors.

## [1.6.0] - 06 March 2021

- **Fix**: Web support is added and tested. Read the readme.md for more info.
- **Fix**: Windows support is added and tested.
- **Fix**: Optimized for Flutter 2.0

## [1.4.0] - 01 March 2021

- **Fix**: Code Refactored.

## [1.3.1] - 18 February 2021

- **New**: Bubbles shape can be changed to circle or square now.
- **New**: Fixed some critical bugs.

## [1.2.0] - 14 February 2021

- **Fix**: Bug Fixes.

## [1.1.3] - 09 February 2021

- **Fix**: Bug Fixes.

## [1.1.2] - 09 February 2021

- **New**: Stress test was done on the animation and results are in [readme](https://github.com/Poujhit/floating_bubbles#stress-test).
- **Update**: updated example main.dart, stress test code included.

## [1.0.0] - 04 February 2021

- **Api Reached a Stable version. There won't be any changes to the existing features. Only new Features will be added.**
- **New**: Added feature to add opacity to the bubbles.
- **New**: Added feature to add Painting Style to the bubbles.
- **New**: Stroke Width can be added to the bubbles.
- **Fix**: Certain assertions are fixed and modified.

## [0.0.9] - 29 January 2021

- Many Breaking Changes are made in v0.0.8 release. So read the docs!!.
- **Fix**: Code is Refactored.
- **Doc**: Readme is updated.

## [0.0.8] - 29 January 2021

- Many Breaking Changes are made in this update. So read the docs!!.
- **New**: Added a named constructor _FloatingBubbles.alwaysRepeating()_ which creates the floating bubbles which always floats and doesn't stop.
- **Fix and New**: FloatingBubbles() instance always needs _duration_ parameter. FloatingBubbles() now create floating bubbles that float for the _duration_ amount of time and stops afterwards.
- **Update**: Refactored the documentation.
- **Performance**: Your app can manage upto 200 bubbles at a given instance of time in the screen. More testing is done and performance will improve eventually.
- **Update**: Readme is updated to the lastest version of this api.
- **Update**: example/main.dart is updated to the latest version of this api.

## [0.0.7] - 27 January 2021

- **New**: Added Option to play the animation for a particular _duration_.
- **Update**: Refactored the documentation.
- **New**: Added Option to choose whether the animation should be _loop_ or _one_ time for a
  particular _duration_.
- **Update**: Dependencies used in the project are updated.

## [0.0.6] - 22 January 2021

- **Fix**: Fixed Code Refactoring

## [0.0.5] - 22 January 2021

- **Fix**: Fixed assertion conditions for all the apis.
- **Fix**: Removed unnecessary default assignments to the parameters.
- **Add**: some changes in the documentation for the api.

## [0.0.4] - 19 January 2021

- **Fix**: `colorOfBubbles` api documentation fixed.
- **Fix**: Fixed assertion conditions.
- **Add**: error statements if assertion fails.
- **Doc**: Readme updated (has a lot of information about the api now).
- **Note**: Api is subjected to change in the future with more new features. Will update the readme
  when such changes happen.

## [0.0.3] - 16 January 2021

- **Fix**: Readme example was using old api.
- **Fix**: Fixed Code Formatting in code files.

## [0.0.2] - 16 January 2021

- **Breaking Change**: Class **Bubbles** is changed to **FloatingBubbles**. Api is changed.
- **Doc**: Readme is updated to provide more info about the package.
- **Fix**: Documentation updated throughout due to change in Api.
- **Fix**: Changed background to foreground in the documentation.
- **Update**: Updated example in **example/main.dart**.
- **Fix**: Code Formatted.
- **Fix**: Added assertion checks while initializing **FloatingBubbles**.

## [0.0.1] - 14 January 2021

- Initial release of the package.
