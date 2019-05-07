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

- (UIView *)coverViewWidthSuperSize:(CGSize)size;
- (UIView *)prizeViewWidthSuperSize:(CGSize)size;

@optional
- (void)didScratchPercentChanged:(float)percent;
@end


@interface YTScratchyCard : UIView

//构造方法
- (instancetype)initWithFrame:(CGRect)frame delegate:(id)delegate;
//刮痕尺寸
@property (assign,nonatomic)CGFloat ScratchSize ;

//重置
- (void)resetView;

//刮完了！
- (void)completeScratch;

@property (weak,nonatomic)id<YTScratchyCardDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
