//
//  GTSearchBar.m
//  YZCoderLearn
//
//  Created by jonzhang on 2019/8/14.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import "GTSearchBar.h"
#import "GTScreen.h"
@interface GTSearchBar ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *textField;
@end
@implementation GTSearchBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:({
            _textField = [[UITextField alloc] initWithFrame:CGRectMake(UI(10), UI(5), frame.size.width - UI(10) * 2 , frame.size.height - UI(5) * 2)];
            _textField.backgroundColor = [UIColor whiteColor];
            _textField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search"]];
            _textField.leftViewMode = UITextFieldViewModeUnlessEditing ;
            
            _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
            _textField.placeholder = @"热点推荐";
            _textField.delegate = self;
            _textField;
        })];
        
    }
    return self;
    
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"");
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"");
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    //字数判断
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_textField resignFirstResponder];
    return YES;
}

@end
