//
//  DQProgressBar.m
//  Pods
//
//  Created by Jeffrey on 15/11/13.
//
//

#import "DQGradientProgressBar.h"

@interface DQGradientProgressBar ()

@property (nonatomic, strong) CAGradientLayer *progressLayer;
@property (nonatomic, strong) CALayer *backgroundLayer;
@property (nonatomic, strong) CAShapeLayer *indicatorLayer;

@end

IB_DESIGNABLE
@implementation DQGradientProgressBar



- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if ([super initWithCoder:aDecoder]) {
        [self initSelf];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        [self initSelf];
    }
    return self;
}

- (void)initSelf {
    
}


- (void)layoutSubviews {
    
    if (self.backgroundLayer.superlayer == nil) {
        [self.layer addSublayer:self.backgroundLayer];
        self.backgroundLayer.frame = self.bounds;
        self.backgroundLayer.cornerRadius = CGRectGetHeight(self.frame)/2;
    }
    
    if (self.progressLayer.superlayer == nil) {
        [self.layer addSublayer:self.progressLayer];
        self.progressLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame)*self.progress, CGRectGetHeight(self.frame));
        self.progressLayer.cornerRadius = CGRectGetHeight(self.frame)/2;
        self.layer.cornerRadius = self.progressLayer.cornerRadius;
        
    }
    
    if (self.indicatorLayer.superlayer == nil) {
        [self.layer addSublayer:self.indicatorLayer];
        [self updateIndicatorFrame];
    }

    
}


- (void)drawRect:(CGRect)rect {
    
}

#pragma mark - Private Methods
- (void)updateIndicatorFrame {
    CGFloat offset = 2;
    CGFloat totalHeight = CGRectGetHeight(self.frame);
    CGFloat indicatorWidth = totalHeight-offset*2;
    CGFloat progressWidth = CGRectGetWidth(self.frame)*self.progress;
    
    self.indicatorLayer.frame = CGRectMake(progressWidth-offset-indicatorWidth, (totalHeight-indicatorWidth)/2.0, indicatorWidth, indicatorWidth);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, indicatorWidth, indicatorWidth)];
    
    self.indicatorLayer.path = path.CGPath;
}

#pragma mark -  Getters and Setters
- (void)setProgress:(CGFloat)progress {
    _progress = progress;

    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanFalse forKey:kCATransactionDisableActions];
    [CATransaction setValue:[NSNumber numberWithFloat:0.5] forKey:kCATransactionAnimationDuration];
    
    self.progressLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame)*progress, CGRectGetHeight(self.frame));

    [self updateIndicatorFrame];
    
    [CATransaction commit];
}

- (void)setBarColors:(NSArray *)barColors {
    _barColors = barColors;
    self.progressLayer.colors = barColors;
}

- (void)setBackColor:(UIColor *)backColor {
    _backColor = backColor;
    self.backgroundLayer.backgroundColor = backColor.CGColor;
}

- (CAGradientLayer *)progressLayer {
    if (_progressLayer == nil) {
        _progressLayer = [CAGradientLayer new];
        _progressLayer.startPoint = CGPointMake(0, 0);
        _progressLayer.endPoint = CGPointMake(1, 0);
    }
    return _progressLayer;
}

- (CALayer *)backgroundLayer {
    if (_backgroundLayer == nil) {
        _backgroundLayer = [CALayer new];
    }
    return _backgroundLayer;
}

- (CAShapeLayer *)indicatorLayer {
    if (_indicatorLayer == nil) {
        _indicatorLayer = [CAShapeLayer new];
        _indicatorLayer.fillColor = [UIColor whiteColor].CGColor;
    }
    return _indicatorLayer;
}

@end
