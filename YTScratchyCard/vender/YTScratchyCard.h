//
//  YTScratchyCard.h
//  YTScratchyCard
//
//  Created by soma on 2019/5/6.
//  Copyright © 2019 yitezh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YTScratchyCardDelegate <NSObject>
@optional
- (void)didScratchPercentChanged:(float)percent;
@end


@interface YTScratchyCard : UIView
//遮挡的图片
@property (strong,nonatomic)UIImage *maskImage;

//刮痕尺寸
@property (assign,nonatomic)CGFloat ScratchSize ;

//重置
- (void)resetView;

// prizeView：奖品视图
- (void)coverOnView:(UIView *)prizeView;

//刮完了！
- (void)completeScratch;

@property (weak,nonatomic)id<YTScratchyCardDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
