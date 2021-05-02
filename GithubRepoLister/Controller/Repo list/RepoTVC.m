//
//  RepoTVC.m
//  GithubRepoLister
//
//  Created by mohamed ahmed on 30/04/2021.
//
#import <SDWebImage/SDWebImage.h>

#import "RepoTVC.h"
@interface RepoTVC ()
@property  Repo * repo;
@property RepoCommit * commit;

@property (nonatomic, weak) IBOutlet UILabel * repoNameLabel;
@property (nonatomic, weak) IBOutlet UIImageView * repoOwnerImageView;
@end

@implementation RepoTVC

- (void)awakeFromNib {
    [super awakeFromNib];
    self.repoOwnerImageView.layer.cornerRadius = 35;
    self.repoOwnerImageView.clipsToBounds = YES;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)configure:(nullable Repo *)repo {
    self.repo = repo;
    [self.repoNameLabel setText:repo.name];
    NSURL * url = [NSURL URLWithString:repo.owner.avatar_url];
    [self.repoOwnerImageView sd_setImageWithURL:url ];


}
- (void)configureCommit:(nullable RepoCommit*)commit{
    self.commit  = commit;
    [self.repoNameLabel setText:commit.message];
}
- (IBAction)repoCellPressed:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectCell:)]){
        [self.delegate didSelectCell:self];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(didTapOnRepo:)]){
        [self.delegate didTapOnRepo:self.repo];
    }
   
    
}



- (IBAction)commitCellPressed:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didTapOnCommit:)]){
        [self.delegate didTapOnCommit:self.commit];
    }
}

@end
