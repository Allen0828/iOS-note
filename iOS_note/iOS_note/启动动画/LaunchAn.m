//
//  LaunchAn.m
//  iOS_note
//
//  Created by allen0828 on 2022/8/26.
//

#import "LaunchAn.h"

LaunchAnimation *la = nil;


@interface LaunchAnimation () <UISceneDelegate>

@end

@implementation LaunchAnimation

+ (void)config {
//    if (la) {
//        NSLog(@"已经初始化");
//        return;
//    }
//    UIApplication *app = [UIApplication sharedApplication];
//    if (@available(iOS 13.0, *)) {
//        __block UIScene * _Nonnull tmpScene;
//        [[app connectedScenes] enumerateObjectsUsingBlock:^(UIScene * _Nonnull obj, BOOL * _Nonnull stop) {
//            tmpScene = obj;
//            *stop = YES;
//        }];
//        UIWindowScene *winScene = (UIWindowScene *)tmpScene;
//        for (UIWindow *window in winScene.windows) {
//            if (window.isKeyWindow) {
//                NSLog(@" 配置失败");
//                return;
//            }
//        }
//        NSLog(@" 配置成功");
//        la = [LaunchAnimation new];
//    } else {
//        NSLog(@"iOS 12 配置失败");
//    }
}

- (instancetype)init {
    if ([super init]) {
//        if (@available(iOS 13.0, *)) {
//            UIApplication *app = [UIApplication sharedApplication];
//            __block UIScene * _Nonnull tmpScene;
//            [[app connectedScenes] enumerateObjectsUsingBlock:^(UIScene * _Nonnull obj, BOOL * _Nonnull stop) {
//                tmpScene = obj;
//                *stop = YES;
//            }];
//            
//            dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//            dispatch_async(globalQueue, ^{
//                UIWindowScene *winScene = (UIWindowScene *)tmpScene;
//                __block BOOL isWhile = true;
//                while (isWhile) {
//                    dispatch_sync(dispatch_get_main_queue(), ^{
//                        for (UIWindow *window in winScene.windows) {
//                            if (window.isKeyWindow) {
//                                isWhile = false;
//                                LaunchAn *view = [[LaunchAn alloc] initWithFrame:[UIScreen mainScreen].bounds];
//                                [window addSubview:view];
//                                return;
//                            }
//                        }
//                    });
//                }
//            });
//
//            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sceneDidActivateNotification:) name:UISceneDidActivateNotification object:nil];
//            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sceneWillDeactivateNotification:) name:UISceneWillDeactivateNotification object:nil];
//            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sceneWillEnterForegroundNotification:) name:UISceneWillEnterForegroundNotification object:nil];
//            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sceneDidEnterBackgroundNotification:) name:UISceneDidEnterBackgroundNotification object:nil];
//        }
    }
    return self;
}

- (void)sceneDidActivateNotification:(NSNotification *)noti {
    NSLog(@"noti----%@", noti);
}
- (void)sceneWillDeactivateNotification:(NSNotification *)noti {
    NSLog(@"noti----%@", noti);
}
- (void)sceneWillEnterForegroundNotification:(NSNotification *)noti {
    NSLog(@"noti----%@", noti);
}
- (void)sceneDidEnterBackgroundNotification:(NSNotification *)noti {
    NSLog(@"noti----%@", noti);
}

@end


@interface LaunchAn()

@property (nonatomic,strong) UIImageView *img;
@property (nonatomic,strong) UILabel *originalLabel;
@property (nonatomic,strong) UILabel *finalLabel;
@property (nonatomic,strong) UIView *animationView;
@property (nonatomic,strong) UILabel *tipLabel;

@end


@implementation LaunchAn

- (instancetype)initWithFrame:(CGRect)frame {
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor = UIColor.blackColor;
        
        UIView *animation = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 270, 65)];
        animation.center = self.center;
        [self addSubview:animation];
        
        self.img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo"]];
        self.img.frame = CGRectMake(8, 8, 45, 45);
        [animation addSubview:self.img];
        
        self.originalLabel = [[UILabel alloc] initWithFrame:CGRectMake(88, 8, 150, 50)];
        self.originalLabel.text = @"GritWorld ™";
        self.originalLabel.font = [UIFont systemFontOfSize:26 weight:UIFontWeightBold];
        self.originalLabel.textColor = UIColor.blueColor;
        self.originalLabel.adjustsFontForContentSizeCategory = true;
        [animation addSubview:self.originalLabel];
        
        self.animationView = [[UIView alloc] initWithFrame:CGRectMake(88, 8, 150, 50)];
        self.animationView.alpha = 0;
        self.animationView.layer.masksToBounds = true;
        [animation addSubview:self.animationView];
        
        self.finalLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
        self.finalLabel.text = @"GritWorld ™";
        self.finalLabel.font = [UIFont systemFontOfSize:26 weight:UIFontWeightBold];
        self.finalLabel.textColor = UIColor.whiteColor;
        self.finalLabel.adjustsFontForContentSizeCategory = true;
        [self.animationView addSubview:self.finalLabel];
        
        self.tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height-50, frame.size.width, 50)];
        self.tipLabel.text = @"All Rights Reserved";
        self.tipLabel.alpha = 0.5;
        self.tipLabel.textAlignment = NSTextAlignmentCenter;
        self.tipLabel.textColor = UIColor.whiteColor;
        self.tipLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:self.tipLabel];
        
        [self animation];
    }
    return self;
}

- (void)animation {
    [UIView animateWithDuration:1 animations:^{
        self.tipLabel.alpha = 1;
        CGAffineTransform form = CGAffineTransformMakeScale(1.3, 1.3);
        self.originalLabel.transform = form;
        self.animationView.transform = form;
        self.img.transform = form;
        
    } completion:^(BOOL finished) {
        CGRect original = self.originalLabel.frame;
        self.animationView.frame = CGRectMake(original.origin.x, original.origin.y, 0, original.size.height);
        self.animationView.alpha = 1;
        
        __block CGFloat animationWidth = 0;
        [UIView animateWithDuration:2 animations:^{
            
            animationWidth = 250;
            self.animationView.frame = CGRectMake(original.origin.x, original.origin.y, animationWidth, self.animationView.frame.size.height);
        } completion:^(BOOL finished) {
            if (finished) {
                for (UIView *sub in self.subviews) {
                    [sub removeFromSuperview];
                }
                [self removeFromSuperview];
            }
        }];
    }];
}

- (void)dealloc {
    NSLog(@"view dealloc");
}

@end
