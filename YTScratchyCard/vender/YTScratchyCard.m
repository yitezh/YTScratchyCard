//
//  YTScratchyCard.m
//  YTScratchyCard
//
//  Created by soma on 2019/5/6.
//  Copyright © 2019 yitezh. All rights reserved.
//

#import "YTScratchyCard.h"
#import "UIImage(Extension).h"
@interface YTScratchyCard()
@property (strong,nonatomic)UIImageView  *maskImageView;
@property (strong,nonatomic)CAShapeLayer *maskLayer;
@property (strong,nonatomic)UIBezierPath *maskPath;
@end


@implementation YTScratchyCard

- (instancetype)initWithFrame:(CGRect)frame{
    if(self == [super initWithFrame:frame]) {
        [self initSubViews];
        [self configLayer];
    }
    return self;
}

- (void)initSubViews {
    self.maskImageView = [[UIImageView alloc]initWithFrame:self.bounds];
    [self addSubview:self.maskImageView];
}


- (void)configLayer{
    self.maskImageView.layer.mask = self.maskLayer;
}


- (void)setMaskImage:(UIImage *)maskImage {
    _maskImage = maskImage;
    self.maskImageView.image = maskImage;
}

- (void)resetView {
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    self.maskLayer.frame = CGRectZero;
    [self.maskPath removeAllPoints];
    self.maskLayer.path = self.maskPath.CGPath;
    self.maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    
    [CATransaction commit];
}

- (void)completeScratch {
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    self.maskLayer.frame = self.maskImageView.frame;

    
    [CATransaction commit];
    
    self.maskLayer.backgroundColor = [UIColor blueColor].CGColor;
}

- (void)coverOnView:(UIView *)view {
    if(view.superview) {
        [view.superview addSubview:self];
    }
}


- (UIImage *)scratchyImage {
    UIGraphicsBeginImageContextWithOptions(self.maskImageView.bounds.size, NO, 0);
    CGContextRef ref = UIGraphicsGetCurrentContext();
    [self.maskImageView.layer renderInContext:ref];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint prePoint = [touch previousLocationInView:self.maskImageView];
    CGPoint currentPoint = [touch locationInView:self.maskImageView];
    [self.maskPath moveToPoint:prePoint];
    [self.maskPath addLineToPoint:currentPoint];
    self.maskLayer.path = self.maskPath.CGPath;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIImage *image = [self scratchyImage];
    float cleaPercent =   [image caculateClearPercent];
    float scrachPercent = 1 - cleaPercent;
    
    if([self.delegate respondsToSelector:@selector(didScratchPercentChanged:)]) {
        [self.delegate didScratchPercentChanged:scrachPercent];
    }
}

- (UIBezierPath *)maskPath {
    if(!_maskPath) {
        _maskPath = [UIBezierPath bezierPath];
    }
    return _maskPath;
}

- (CAShapeLayer *)maskLayer{
    if(!_maskLayer) {
        _maskLayer = [CAShapeLayer layer];
        _maskLayer.lineCap = kCALineCapRound;
        _maskLayer.lineWidth = self.ScratchSize;
        _maskLayer.strokeColor = [UIColor blackColor].CGColor;
    }
    return _maskLayer;
}

- (CGFloat)ScratchSize{
    if(!_ScratchSize) {
        _ScratchSize = 30;
    }
    return _ScratchSize;
    
}


@end




