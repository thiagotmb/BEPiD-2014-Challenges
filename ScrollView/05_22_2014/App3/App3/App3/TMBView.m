//
//  TMBView.m
//  App3
//
//  Created by Thiago Bernardes on 5/23/14.
//  Copyright (c) 2014 BEPiD. All rights reserved.
//

#import "TMBView.h"


@implementation TMBView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        

    }
    return self;
}


-(void)generateView
{
    
    [self generateDateLabel];
    
    CGRect morningFrame = CGRectMake(self.frame.size.width/25, self.frame.size.height/8, 300, 50);
    UILabel *morningLabel = [[UILabel alloc] initWithFrame:morningFrame];
    
    morningLabel.text = [NSString stringWithFormat:@"Periodo da manhã"];
    morningLabel.font = [UIFont boldSystemFontOfSize:25];
    morningLabel.textAlignment =  NSTextAlignmentLeft;
    [self addSubview:morningLabel];
    _textViewMorning =[self generateTextView:CGSizeMake(self.frame.size.width/1.2, self.frame.size.height/5) withSize:CGRectMake(self.frame.size.width/25,self.frame.size.height/5.3,self.frame.size.width/1.2,self.frame.size.height/5.55)];
    [self addSubview:_textViewMorning];
    

    
    CGRect afternoonFrame = CGRectMake(self.frame.size.width/25, self.frame.size.height/2.8, 300, 50);
    UILabel *afternoonLabel = [[UILabel alloc] initWithFrame:afternoonFrame];
    
    afternoonLabel.text = [NSString stringWithFormat:@"Periodo da Tarde"];
    afternoonLabel.font = [UIFont boldSystemFontOfSize:25];
    afternoonLabel.textAlignment =  NSTextAlignmentLeft;
    [self addSubview:afternoonLabel];
    _textViewAfternoon = [self generateTextView:CGSizeMake(self.frame.size.width/1.2, self.frame.size.height/4) withSize:CGRectMake(self.frame.size.width/25,self.frame.size.height/2.35,self.frame.size.width/1.2,self.frame.size.height/4.5)];
    [self addSubview:_textViewAfternoon];
    
    CGRect nightFrame = CGRectMake(self.frame.size.width/25, self.frame.size.height/1.6, 300, 50);
    UILabel *nightLabel = [[UILabel alloc] initWithFrame:nightFrame];
    
    nightLabel.text = [NSString stringWithFormat:@"Periodo da noite"];
    nightLabel.font = [UIFont boldSystemFontOfSize:25];
    nightLabel.textAlignment =  NSTextAlignmentLeft;
    [self addSubview:nightLabel];
    _textViewNight = [self generateTextView:CGSizeMake(self.frame.size.width/1.2, self.frame.size.height/4) withSize:CGRectMake(self.frame.size.width/25,self.frame.size.height/1.45,self.frame.size.width/1.2,self.frame.size.height/4)];
    [self addSubview:_textViewNight];
    
}

-(void)generateDateLabel
{
    CGRect dateFrame = CGRectMake(self.frame.size.width/7, self.frame.size.height/20, 230, 50);
    UILabel *date = [[UILabel alloc] initWithFrame:dateFrame];

    
    //Create a string with a date
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd/MM/yyyy"];
    NSDate *now = [NSDate date];
    NSDate *new = [now dateByAddingTimeInterval:60*60*24*_dateRange];
    NSString *dateString = [format stringFromDate:new];
    
    date.text = [NSString stringWithFormat:@"Data:%@",dateString];
    date.font = [UIFont systemFontOfSize:30];
    date.textAlignment =  NSTextAlignmentLeft;
    [self addSubview:date];
}



-(UITextView*)generateTextView:(CGSize)containerSize withSize:(CGRect)textViewSize
{
    
    
    NSAttributedString *textString =  [[NSAttributedString alloc] initWithString:@"Digite algo" attributes:@{
                                                                                                             NSFontAttributeName: [UIFont systemFontOfSize:16]
                                                                                                             }];
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithAttributedString:textString];
    NSLayoutManager *textLayout = [[NSLayoutManager alloc] init];
    // Add layout manager to text storage object
    [textStorage addLayoutManager:textLayout];
    // Create a text container
    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:containerSize];
    // Add text container to text layout manager
    [textLayout addTextContainer:textContainer];
    // Instantiate UITextView object using the text container
    UITextView *textView = [[UITextView alloc] initWithFrame:textViewSize textContainer:textContainer];
   
   
    textView.layer.borderColor = [UIColor grayColor].CGColor;
    textView.layer.borderWidth = 0.5f;

    //
    return textView;
}

//overwritten method for keyboard disappear when clicking outside the textview
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    if ([_textViewMorning isFirstResponder] && [touch view] != _textViewMorning){
        [_textViewMorning resignFirstResponder];
    }
    if ([_textViewAfternoon isFirstResponder] && [touch view] != _textViewAfternoon){
        [_textViewAfternoon resignFirstResponder];
    }
    if ([_textViewNight isFirstResponder] && [touch view] != _textViewNight){
        [_textViewNight resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
