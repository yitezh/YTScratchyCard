//
//  ViewController.m
//  YTScratchyCard
//
//  Created by soma on 2019/5/6.
//  Copyright © 2019 yitezh. All rights reserved.
//

#import "ViewController.h"
#import "YTScratchyCard.h"
@interface ViewController ()<YTScratchyCardDelegate>
@property (strong,nonatomic) YTScratchyCard *card;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    YTScratchyCard *card  = [[YTScratchyCard alloc]initWithFrame:CGRectMake(100, 100, 200, 200) delegate:self];
    [self.view addSubview:card];
    self.card = card;
}
- (IBAction)resetButtonClicked:(id)sender {
    [self.card resetView];
}


#pragma mark delegate

- (void)didScratchPercentChanged:(float)percent{
    if(percent>0.5) {
        [self.card completeScratch];
    }
}

- (UIView *)coverViewWidthSuperSize:(CGSize)size{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,size.width , size.height)];
    label.backgroundColor =[ UIColor greenColor];
    label.text = @"刮出新天地";
    label.textColor = [UIColor redColor];
    label.textAlignment  =NSTextAlignmentCenter;
    return label;
}
- (UIView *)prizeViewWidthSuperSize:(CGSize)size {
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,size.width , size.height)];

    imageView.image = [UIImage imageNamed:@"12.jpg"];
    return imageView;
}


@end
