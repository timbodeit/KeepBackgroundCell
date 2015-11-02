//
//  UITableViewCell+KeepSubviewBackground.h
//  KeepBackgroundCell
//
//  Created by Tim Bodeit on 02/11/15.
//
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (KeepSubviewBackground)

/**
 *  Whether or not the cell should keep the backgroundColor of it's subviews when being selected.
 *
 *  @p true  When seleted, keep the backgroundColor of the subviews.
 *
 *  @p false When selected, set the backgroundColor of all subviews to transparent.
 *
 *  See also:
 *  http://stackoverflow.com/questions/6745919/uitableviewcell-subview-disappears-when-cell-is-selected
 */
@property (nonatomic) BOOL keepSubviewBackground;

@end
