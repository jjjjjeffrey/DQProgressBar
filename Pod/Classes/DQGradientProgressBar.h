//
//  DQProgressBar.h
//  Pods
//
//  Created by Jeffrey on 15/11/13.
//
//

#import <UIKit/UIKit.h>

@interface DQGradientProgressBar : UIView

@property (nonatomic) CGFloat progress; //0~1
@property (nonatomic, strong) IBInspectable UIColor *backColor;
@property (nonatomic, strong) NSArray *barColors;

@end
