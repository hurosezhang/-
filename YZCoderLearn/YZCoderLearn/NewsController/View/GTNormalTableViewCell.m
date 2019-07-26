//
//  GTNormalTableViewCell.m
//  YZCoderLearn
//
//  Created by jonzhang on 2019/6/12.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import "GTNormalTableViewCell.h"
#import "GTListItem.h"
#import "SDWebImage.h"
#import "GTScreen.h"
@interface GTNormalTableViewCell  ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *sourceLabel;
@property (nonatomic, strong) UILabel *comentLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIImageView *rightimageView;
@property (nonatomic, strong) UIButton *deleButton;

@end

@implementation GTNormalTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:UIRect(20, 15, 270, 50) ];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.numberOfLines = 2;
            self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel;
        })];

        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:UIRect(20, 70, 50, 20)];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel.textColor = [UIColor grayColor];

            self.sourceLabel;
        })];
        [self.contentView addSubview:({
            self.comentLabel = [[UILabel alloc] initWithFrame:UIRect(100, 70, 50, 20)];
            self.comentLabel.font = [UIFont systemFontOfSize:12];
            self.comentLabel.textColor = [UIColor grayColor];

            self.comentLabel;
        })];
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:UIRect(150, 70, 50, 20)];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel.textColor = [UIColor grayColor];

            self.timeLabel;
        })];

        [self.contentView addSubview:({
            self.rightimageView = [[UIImageView alloc] initWithFrame:UIRect(300, 15, 100, 70)];
            self.rightimageView.contentMode = UIViewContentModeScaleAspectFit;
            self.rightimageView;
        })];
//        [self.contentView addSubview:({
//            self.deleButton = [[UIButton alloc] initWithFrame:CGRectMake(290, 80, 30, 20)];
//            [self.deleButton setTitle:@"X" forState:UIControlStateNormal];
//            [self.deleButton setTitle:@"V" forState:UIControlStateHighlighted];
//            [self.deleButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
//            self.deleButton.layer.cornerRadius = 10;
//            self.deleButton.layer.masksToBounds = YES;
//            self.deleButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
//            self.deleButton.layer.borderWidth = 2;
//            self.deleButton;
//        })];
    }
    return self;
}

- (void)layoutTableViewCellWithItem:(GTListItem *)item
{
    BOOL haRead = [[NSUserDefaults standardUserDefaults] objectForKey:item.uniqueKey];

    if (haRead) {
        self.titleLabel.textColor = [UIColor grayColor];
    } else {
        self.titleLabel.textColor = [UIColor blackColor];
    }

    self.titleLabel.text = item.title;
    self.sourceLabel.text = item.authorName;
    [self.sourceLabel sizeToFit];

    self.comentLabel.text = item.category;
    [self.comentLabel sizeToFit];
    self.comentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + UI(15), self.comentLabel.frame.origin.y, self.comentLabel.frame.size.width, self.comentLabel.frame.size.height);

    self.timeLabel.text = item.date;
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.comentLabel.frame.origin.x + self.comentLabel.frame.size.width + UI(15), self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);

    [self.rightimageView sd_setImageWithURL:[NSURL URLWithString:item.picUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];
    
//    NSThread *downLoadImageThread = [[NSThread alloc] initWithBlock:^{
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
//        self.rightimageView.image = image;
//    }];
//
//    downLoadImageThread.name = @"downLoadImageThread";
//
//    [downLoadImageThread start];
    
//    dispatch_queue_global_t downLoadqueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_queue_main_t mainQueue = dispatch_get_main_queue();
//    dispatch_async(downLoadqueue, ^{
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
//        dispatch_async(mainQueue, ^{
//            self.rightimageView.image = image;
//        });
//    });
    
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)deleteButtonClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]) {
        [self.delegate tableViewCell:self clickDeleteButton:self.deleButton];
    }
}

@end
