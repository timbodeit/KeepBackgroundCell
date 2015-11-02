//
//  KeepBackgroundCellTests.m
//  KeepBackgroundCellTests
//
//  Created by Tim Bodeit on 11/02/2015.
//  Copyright (c) 2015 Tim Bodeit. All rights reserved.
//

// https://github.com/Specta/Specta

#import <UIKit/UIKit.h>
#import <KeepBackgroundCell/KeepBackgroundCell.h>

SpecBegin(InitialSpecs)

describe(@"UITableViewCell+KeepSubviewBackground", ^{
  
  __block UITableViewCell* cell;
  __block UIView* redSubview;
  
  beforeEach(^{
    cell = [[UITableViewCell alloc] init];
    redSubview = [[UIView alloc] init];
    redSubview.backgroundColor = [UIColor redColor];
    [cell addSubview: redSubview];
  });

  // keepSubviewBackground default value
  
  it(@"has false as default value for keepSubviewBackground", ^{
    expect(cell.keepSubviewBackground).to.equal(NO);
  });
  
  // keepSubviewBackground = false
  
  it(@"sets subview background to clear on animated selection with keepSubviewBackground=false", ^{
    [cell setSelected: YES animated:NO];
    expect(redSubview.backgroundColor).to.equal([UIColor clearColor]);
  });
  
  it(@"sets subview background to clear on animated highlight with keepSubviewBackground=false", ^{
    [cell setHighlighted: YES animated:NO];
    expect(redSubview.backgroundColor).to.equal([UIColor clearColor]);
  });
  
  it(@"sets subview background to clear on selection with keepSubviewBackground=false", ^{
    [cell setSelected: YES];
    expect(redSubview.backgroundColor).to.equal([UIColor clearColor]);
  });
  
  it(@"sets subview background to clear on highlight with keepSubviewBackground=false", ^{
    [cell setHighlighted: YES];
    expect(redSubview.backgroundColor).to.equal([UIColor clearColor]);
  });
  
  // keepSubviewBackground = false
  
  it(@"keeps subview background on selection with keepSubviewBackground=true", ^{
    cell.keepSubviewBackground = YES;
    [cell setSelected: YES];
    expect(redSubview.backgroundColor).to.equal([UIColor redColor]);
  });
  
  it(@"keeps subview background on hightlighting with keepSubviewBackground=true", ^{
    cell.keepSubviewBackground = YES;
    [cell setHighlighted: YES];
    expect(redSubview.backgroundColor).to.equal([UIColor redColor]);
  });
  
  it(@"keeps subview background on animated selection with keepSubviewBackground=true", ^{
    cell.keepSubviewBackground = YES;
    [cell setSelected: YES animated: NO];
    expect(redSubview.backgroundColor).to.equal([UIColor redColor]);
  });
  
  it(@"keeps subview background on animated hightlighting with keepSubviewBackground=true", ^{
    cell.keepSubviewBackground = YES;
    [cell setHighlighted: YES animated: NO];
    expect(redSubview.backgroundColor).to.equal([UIColor redColor]);
  });
  
});

SpecEnd
