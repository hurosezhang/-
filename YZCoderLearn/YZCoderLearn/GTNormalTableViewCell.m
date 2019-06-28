//
//  GTNormalTableViewCell.m
//  YZCoderLearn
//
//  Created by jonzhang on 2019/6/12.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import "GTNormalTableViewCell.h"
@interface GTNormalTableViewCell  ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *sourceLabel;
@property (nonatomic, strong) UILabel *comentLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIImageView *rightimageView;
@property (nonatomic, strong) UIButton *deleButton;

@end

@implementation GTNormalTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 300, 50)];
//            self.titleLabel.backgroundColor = [UIColor redColor];
            self.timeLabel.font = [UIFont systemFontOfSize:16];
            self.timeLabel.textColor = [UIColor blackColor];
            self.titleLabel;
        })];
        
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 50, 20)];
//            self.sourceLabel.backgroundColor = [UIColor redColor];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel.textColor = [UIColor grayColor];

            self.sourceLabel;
        })];
        [self.contentView addSubview:({
            self.comentLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 80, 50, 20)];
//            self.comentLabel.backgroundColor = [UIColor redColor];
            self.comentLabel.font = [UIFont systemFontOfSize:12];
            self.comentLabel.textColor = [UIColor grayColor];

            self.comentLabel;
        })];
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 80, 50, 20)];
//            self.timeLabel.backgroundColor = [UIColor redColor];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel.textColor = [UIColor grayColor];

            self.timeLabel;
        })];

        [self.contentView addSubview:({
            self.rightimageView = [[UIImageView alloc] initWithFrame:CGRectMake(330, 15, 70, 70)];
            self.rightimageView.backgroundColor = [UIColor redColor];
            self.rightimageView.contentMode = UIViewContentModeScaleAspectFit;
            self.rightimageView;
        })];
        [self.contentView addSubview:({
            self.deleButton = [[UIButton alloc] initWithFrame:CGRectMake(290, 80, 30, 20)];
            self.deleButton.backgroundColor = [UIColor blueColor];
            [self.deleButton setTitle:@"X" forState:UIControlStateNormal];
            [self.deleButton setTitle:@"V" forState:UIControlStateHighlighted];
            [self.deleButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
            self.deleButton;
        })];

        
        
    }
    return self;
}
- (void)layoutTableViewCell {
    self.titleLabel.text = @"极客时间iOS开发";
    self.sourceLabel.text = @"即刻时间";
    [self.sourceLabel sizeToFit];
    
    self.comentLabel.text = @"1888评论";
    [self.comentLabel sizeToFit];
    self.comentLabel.frame = CGRectMake( self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 15, self.comentLabel.frame.origin.y , self.comentLabel.frame.size.width, self.comentLabel.frame.size.height);
    
    self.timeLabel.text = @"三分钟前";
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.comentLabel.frame.origin.x + self.comentLabel.frame.size.width + 15, self.timeLabel.frame.origin.y,self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
    
    self.rightimageView.image = [UIImage imageNamed:@"icon.bundle/timg.jpeg"];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)deleteButtonClick {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]) {
        [self.delegate tableViewCell:self clickDeleteButton:self.deleButton];
    }
}

@end
