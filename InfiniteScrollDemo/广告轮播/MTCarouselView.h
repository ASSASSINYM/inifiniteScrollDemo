//
//  MTCarouselView.h
//  InfiniteScrollDemo
//
//  Created by ASSASSIN on 2020/12/15.
//

#import <UIKit/UIKit.h>
#import "MTCarouselBaseModel.h"
@class MTCarouselView;

NS_ASSUME_NONNULL_BEGIN

@protocol MTCarouselViewDelegate <NSObject>

/// 数据源方法
/// @param carouselView 视图
-(NSInteger)numberOfItemsInCarouselView:(MTCarouselView *)carouselView;
/// 数据源方法
/// @param indexPath 位置
-(MTCarouselBaseModel *)modelForCarouselItemAtIndexPath:(NSIndexPath *)indexPath;
/// 点击方法
/// @param carouselView 视图
/// @param indexPath 位置
-(void)carouselView:(MTCarouselView *)carouselView didSelectedRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface MTCarouselView : UIView

/// 代理对象
@property(nonatomic,weak)id<MTCarouselViewDelegate> delegate;

/// 类方法
/// @param frame 视图frame
+(instancetype)carouselViewWithFrame:(CGRect)frame;
///刷新数据
-(void)refreshCarouselView;

@end

NS_ASSUME_NONNULL_END
