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
@property (weak, nonatomic) IBOutlet UILabel *BinggoLabel;
@property (strong,nonatomic) YTScratchyCard *card;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YTScratchyCard *card  = [[YTScratchyCard alloc]initWithFrame:self.BinggoLabel.frame];
    card.maskImage = [UIImage imageNamed:@"12.jpg"];
    card.delegate = self;
    [card coverOnView:self.BinggoLabel];
    self.card = card;
}
- (IBAction)resetButtonClicked:(id)sender {
    [self.card resetView];
}

- (void)didScratchPercentChanged:(float)percent{
    if(percent>0.5) {
        [self.card completeScratch];
    }
}


@end
