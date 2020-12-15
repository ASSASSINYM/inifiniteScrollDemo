//
//  MTPageControl.h
//  InfiniteScrollDemo
//
//  Created by ASSASSIN on 2020/12/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MTPageControl : UIView

@property(nonatomic,assign)NSInteger numberOfPages;
@property(nonatomic,assign)NSInteger currentPage;

@property(nonatomic,strong)UIImage *currentImg;
@property(nonatomic,strong)UIImage *normalImg;

@end

NS_ASSUME_NONNULL_END
