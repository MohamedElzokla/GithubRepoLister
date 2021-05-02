//
//  Animator.m
//  GithubRepoLister
//
//  Created by mohamed ahmed on 01/05/2021.
//

#import "Animator.h"

@interface Animator()



@end


@implementation Animator
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return _duration;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    UIView * containerView = transitionContext.containerView;
    UIView * toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView * cellView = _presenting ? toView : [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    CGRect initialFrame = _presenting ? self.originFrame : cellView.frame;
    CGRect finalFrame = _presenting ? cellView.frame : self.originFrame;
    CGFloat xScaleFactor = _presenting ? (initialFrame.size.width / finalFrame.size.width) : (finalFrame.size.width / initialFrame.size.width);

    CGFloat yScaleFactor = _presenting ? (initialFrame.size.height / finalFrame.size.height) : (finalFrame.size.height / initialFrame.size.height);

    CGAffineTransform scaleTransform = (CGAffineTransformMakeScale(xScaleFactor, yScaleFactor));

    
    if (_presenting) {
        cellView.transform = scaleTransform;
        cellView.center = CGPointMake(CGRectGetMidX(initialFrame), CGRectGetMidY(initialFrame));
        cellView.clipsToBounds = true;
    }
    
    cellView.layer.cornerRadius = _presenting ? 20.0 : 0.0;
    cellView.layer.masksToBounds = true;
    
    [containerView addSubview: toView];
    [containerView bringSubviewToFront:cellView];

    
    
    

    //    [toView setTransform:(CGAffineTransformMakeScale(0, 0))];

    [UIView animateWithDuration:self.duration animations:^{
        cellView.transform = self.presenting ? CGAffineTransformIdentity : scaleTransform;
        cellView.center = CGPointMake(CGRectGetMidX(finalFrame), CGRectGetMidY(finalFrame));


        } completion:^(BOOL finished) {
//
            [transitionContext completeTransition:YES];
        }];
     

}
@end
