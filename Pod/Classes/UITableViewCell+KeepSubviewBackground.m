//
//  UITableViewCell+KeepSubviewBackground.m
//  KeepSubviewBackgroundCell
//
//  Created by Tim Bodeit on 02/11/15.
//
//

#import "UITableViewCell+KeepSubviewBackground.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@implementation UITableViewCell (KeepSubviewBackground)

#pragma mark - keepSubviewBackground attribute

@dynamic keepSubviewBackground;

-(BOOL)keepSubviewBackground {
  NSNumber* keepBackground = objc_getAssociatedObject(self, @selector(keepSubviewBackground));
  return [keepBackground boolValue];
}

-(void)setKeepSubviewBackground:(BOOL)keepSubviewBackground {
  objc_setAssociatedObject(self,
                           @selector(keepSubviewBackground),
                           @(keepSubviewBackground),
                           OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - setHighlighted / setSelected swizzling

+ (void)load {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    [self swizzleMethodForSelectors:@selector(setSelected:animated:)
              withMethodForSelector:@selector(ksb_setSelected:animated:)];
    [self swizzleMethodForSelectors:@selector(setHighlighted:animated:)
              withMethodForSelector:@selector(ksb_setHighlighted:animated:)];
  });
}

+ (void)swizzleMethodForSelectors:(SEL)originalSelector withMethodForSelector:(SEL)swizzledSelector {
    Class class = [self class];
  
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
      class_replaceMethod(class,
                          swizzledSelector,
                          method_getImplementation(originalMethod),
                          method_getTypeEncoding(originalMethod));
    } else {
      method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

-(void)ksb_setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
  if (self.keepSubviewBackground) {
    // Store backgroundColors in Dictionary
    NSMutableDictionary* backgroundColorsForSubviews = [[NSMutableDictionary alloc] init];
    [self iterateSubviews:self withBlock:^(UIView *subview) {
      if (subview.backgroundColor) {
        NSValue* pointerValue = [NSValue valueWithNonretainedObject: subview];
        [backgroundColorsForSubviews setObject:subview.backgroundColor forKey:pointerValue];
      }
    }];

    // Call original implementation
    [self ksb_setHighlighted:highlighted animated:animated];

    // Restore backgroundColors
    [self iterateSubviews:self withBlock:^(UIView *subview) {
      NSValue* pointerValue = [NSValue valueWithNonretainedObject: subview];
      UIColor* backgroundColor = [backgroundColorsForSubviews objectForKey:pointerValue];
      if (backgroundColor) {
        subview.backgroundColor = backgroundColor;
      }
    }];
  } else {
    [self ksb_setHighlighted:highlighted animated:animated];
  }
}

-(void)ksb_setSelected:(BOOL)selected animated:(BOOL)animated {
  if (self.keepSubviewBackground) {
    // Store backgroundColors in Dictionary
    NSMutableDictionary* backgroundColorsForSubviews = [[NSMutableDictionary alloc] init];
    [self iterateSubviews:self withBlock:^(UIView *subview) {
      if (subview.backgroundColor) {
        NSValue* pointerValue = [NSValue valueWithNonretainedObject: subview];
        [backgroundColorsForSubviews setObject:subview.backgroundColor forKey:pointerValue];
      }
    }];
    // Call original implementation
    [self ksb_setSelected:selected animated:animated];
    // Restore backgroundColors
    [self iterateSubviews:self withBlock:^(UIView *subview) {
      NSValue* pointerValue = [NSValue valueWithNonretainedObject: subview];
      UIColor* backgroundColor = [backgroundColorsForSubviews objectForKey:pointerValue];
      if (backgroundColor) {
        subview.backgroundColor = backgroundColor;
      }
    }];
  } else {
    [self ksb_setSelected:selected animated:animated];
  }
}

-(void)iterateSubviews:(UIView*)rootView withBlock:(void (^)(UIView* subview))block {
  for (UIView* subview in rootView.subviews) {
    block(subview);
    [self iterateSubviews:subview withBlock:block];
  }
}

@end
