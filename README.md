# KeepBackgroundCell

[![CI Status](https://travis-ci.org/timbodeit/KeepBackgroundCell.svg)](https://travis-ci.org/timbodeit/KeepBackgroundCell)
[![Version](https://img.shields.io/cocoapods/v/KeepBackgroundCell.svg?style=flat)](http://cocoapods.org/pods/KeepBackgroundCell)
[![License](https://img.shields.io/cocoapods/l/KeepBackgroundCell.svg?style=flat)](http://cocoapods.org/pods/KeepBackgroundCell)
[![Platform](https://img.shields.io/cocoapods/p/KeepBackgroundCell.svg?style=flat)](http://cocoapods.org/pods/KeepBackgroundCell)

Whenever a UITableViewCell is selected or highlighted, it automatically sets the `backgroundColor`s of all its subviews to transparent.
This makes sense for many views, such as UILabels to allow the `selectedBackgroundView` to show through inbetween the individual letters.

However with custom views, there are many cases where the backgroundColor should be maintained on selection of highlighting of the cell.

KeepBackgroundCell provides a way to turn of this transparency "feature" on individual UITableViewCells.

## Usage

##### Swift

```swift
import KeepBackgroundCell

let cell = < Initialize UITableViewCell >
cell.keepSubviewBackground = true
```

##### Objective-C

```objective-c
#import <KeepBackgroundCell/KeepBackgroundCell.h>

UITableViewCell* cell = < Initialize UITableViewCell >
cell.keepSubviewBackground = YES;
```

## Installation

KeepBackgroundCell is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "KeepBackgroundCell"
```

## Author

Tim Bodeit, tim@bodeit.com

KeepBackgroundCell was inspired by
[this answer](http://stackoverflow.com/a/27717607/1984384)
by
[Yatheesha B L](http://stackoverflow.com/users/2024072/yatheesha-b-l)
on stackoverflow.

## License

KeepBackgroundCell is available under the MIT license. See the LICENSE file for more info.
