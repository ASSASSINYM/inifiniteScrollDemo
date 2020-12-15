//
//  MTCarouselView.m
//  InfiniteScrollDemo
//
//  Created by ASSASSIN on 2020/12/15.
//

#import "MTCarouselView.h"
#import "UIView+CellIdentifier.h"
#import "MTCarouselCell.h"

@interface MTCarouselView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,weak)IBOutlet UICollectionView *collectionView;

@end

@implementation MTCarouselView

-(void)awakeFromNib {
    [super awakeFromNib];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.pagingEnabled = YES;
    
    UINib *nibCell = [UINib nibWithNibName:@"MTCarouselCell" bundle:nil];
    [self.collectionView registerNib:nibCell forCellWithReuseIdentifier:@"MTCarouselCell"];
}

+(instancetype)carouselViewWithFrame:(CGRect)frame {
    MTCarouselView *carousel = [[[NSBundle mainBundle] loadNibNamed:@"MTCarouselView" owner:nil options:nil] lastObject];
    carousel.frame = frame;
    return carousel;
}

-(void)refreshCarouselView {
    [self.collectionView reloadData];
}


#pragma mark - collectionview delegate & datasource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (self.delegate && [self.delegate respondsToSelector:@selector(numberOfItemsInCarouselView:)]) {
        return [self.delegate numberOfItemsInCarouselView:self];
    }else{
        return 0;
    }
}

-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MTCarouselCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MTCarouselCell" forIndexPath:indexPath];
    if (self.delegate && [self.delegate respondsToSelector:@selector(modelForCarouselItemAtIndexPath:)]) {
        MTCarouselBaseModel *model = [self.delegate modelForCarouselItemAtIndexPath:indexPath];
        //赋值操作
        cell.model = model;
    }
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.bounds.size.width, self.bounds.size.height);
}

@end
