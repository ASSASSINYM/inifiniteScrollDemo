//
//  UIView+CellIdentifier.m
//  InfiniteScrollDemo
//
//  Created by ASSASSIN on 2020/12/15.
//

#import "UIView+CellIdentifier.h"
#import <objc/runtime.h>

@interface UIView ()

@end

@implementation UIView (CellIdentifier)

-(NSString *)cellIdentifier {
    return objc_getAssociatedObject(self, @selector(cellIdentifier));
}

-(void)setCellIdentifier:(NSString *)cellIdentifier {
    objc_setAssociatedObject(self, @selector(cellIdentifier), cellIdentifier, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
