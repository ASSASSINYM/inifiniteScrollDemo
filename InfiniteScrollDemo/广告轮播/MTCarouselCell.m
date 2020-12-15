//
//  MTCarouselCell.m
//  InfiniteScrollDemo
//
//  Created by ASSASSIN on 2020/12/15.
//

#import "MTCarouselCell.h"

@interface MTCarouselCell ()

@property(nonatomic,weak)IBOutlet UIImageView *imgView;

@end

@implementation MTCarouselCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(MTCarouselBaseModel *)model {
    _model = model;
    self.imgView.image = [UIImage imageNamed:model.img];
}

@end
