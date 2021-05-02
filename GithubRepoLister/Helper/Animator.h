//
//  Animator.h
//  GithubRepoLister
//
//  Created by mohamed ahmed on 01/05/2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Animator : NSObject<UIViewControllerAnimatedTransitioning>
@property CGRect originFrame;
@property BOOL presenting;
@property NSTimeInterval duration;

@end

NS_ASSUME_NONNULL_END
