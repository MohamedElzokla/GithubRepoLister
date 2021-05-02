//
//  RepoTVC.h
//  GithubRepoLister
//
//  Created by mohamed ahmed on 30/04/2021.
//

#import <UIKit/UIKit.h>
#import "Repo.h"
#import "RepoCommit.h"
NS_ASSUME_NONNULL_BEGIN

@protocol RepoTVCDelegate <NSObject>
@optional
- (void)didTapOnRepo:(Repo *)item;
- (void)didTapOnCommit:(RepoCommit *)item;
- (void)didSelectCell: (UIView * ) cell;
@end


@interface RepoTVC : UITableViewCell

@property (nonatomic, weak) id <RepoTVCDelegate> delegate;
- (void)configure:(nullable Repo*)repo;
- (void)configureCommit:(nullable RepoCommit*)commit;

@end

NS_ASSUME_NONNULL_END
