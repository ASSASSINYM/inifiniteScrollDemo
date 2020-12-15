//
//  ViewController.m
//  InfiniteScrollDemo
//
//  Created by ASSASSIN on 2020/12/15.
//

#import "ViewController.h"
#import "MTCarouselView.h"

@interface ViewController ()<MTCarouselViewDelegate>

@property(nonatomic,strong)MTCarouselView *carouselView;
@property(nonatomic,strong)NSMutableArray *datasource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.datasource = [NSMutableArray array];
    [self initData];
    
    self.carouselView = [MTCarouselView carouselViewWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 200)];
    self.carouselView.delegate = self;
    [self.view addSubview:self.carouselView];
    
    [self.carouselView refreshCarouselView];

}

-(void)initData {
        
    for (int i = 0; i < 6; i++) {
        MTCarouselBaseModel *model = [MTCarouselBaseModel new];
        model.img = [NSString stringWithFormat:@"%d.jpg",i+1];
        [self.datasource addObject:model];
    }

}

#pragma mark - MTCarouselViewDelegate

-(NSInteger)numberOfItemsInCarouselView:(MTCarouselView *)carouselView {
    return 6;
}

-(MTCarouselBaseModel *)modelForCarouselItemAtIndexPath:(NSIndexPath *)indexPath {
    MTCarouselBaseModel *model = self.datasource[indexPath.row];
    return model;
}

-(void)carouselView:(MTCarouselView *)carouselView didSelectedRowAtIndexPath:(NSIndexPath *)indexPath {
    MTCarouselBaseModel *model = self.datasource[indexPath.row];
    NSLog(@"%@",model.description);
}


@end
