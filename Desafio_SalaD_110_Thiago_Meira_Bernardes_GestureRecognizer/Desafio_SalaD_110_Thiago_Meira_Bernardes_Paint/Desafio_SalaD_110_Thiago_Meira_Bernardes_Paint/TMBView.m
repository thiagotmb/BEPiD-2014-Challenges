//
//  TMBView.m
//  Desafio_SalaD_110_Thiago_Meira_Bernardes_Paint
//
//  Created by Thiago Bernardes on 7/21/14.
//  Copyright (c) 2014 TMB. All rights reserved.
//

#import "TMBView.h"
#define PLISTNAME @"LinesData.plist"

@interface TMBView()

@property (nonatomic) UIPanGestureRecognizer *pan;
@property (nonatomic) CGPoint previousPanPoint;
@property (nonatomic) UISlider *slider;

@end

@implementation TMBView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.linesInRender = [[NSMutableDictionary alloc] init];
        self.backgroundColor = [UIColor lightGrayColor];
        self.multipleTouchEnabled = YES;
        
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
        doubleTap.numberOfTapsRequired = 2;
        doubleTap.delaysTouchesBegan = YES;
        [self addGestureRecognizer:doubleTap];

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        tap.delaysTouchesBegan = YES;
        [tap requireGestureRecognizerToFail:doubleTap];
        [self addGestureRecognizer:tap];
        
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        [self addGestureRecognizer:longPress];
        
        _pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [self addGestureRecognizer:_pan];
        
        UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeUp:)];
        swipeUp.numberOfTouchesRequired = 3;
        swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
        [self addGestureRecognizer:swipeUp];
        
        UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDown:)];
        swipeDown.numberOfTouchesRequired = 3;
        swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
        [self addGestureRecognizer:swipeDown];
        
        _slider = [[UISlider alloc] initWithFrame:CGRectMake(self.center.x,self.center.y,200,100)];
        _slider.backgroundColor = [UIColor whiteColor];
        _slider.minimumValue = 1;
        _slider.maximumValue = 50;
        _slider.continuous = NO;
        _slider.value = 25;
        [self.slider addTarget:self action:@selector(slider:) forControlEvents:UIControlEventValueChanged];
        
        
        [self setUpDatabase];
        
            }
    return self;
}

-(void)doubleTap:(UIGestureRecognizer*)gestureRecognizer{
    
    NSLog(@"Double Tap");
    [self.linesInRender removeAllObjects];
    [self.renderedLines removeAllObjects];
    [self setNeedsDisplay];
    
}

-(void)tap:(UIGestureRecognizer*)gestureRecognizer{
   
    NSLog(@"Tap");
    
    CGPoint point = [gestureRecognizer locationInView:self];
    [self setSelectedLine:[self lineatPoint:point]];
    
    if (self.selectedLine) {
        [self becomeFirstResponder];
        
        UIMenuController *menu = [ UIMenuController sharedMenuController];
        
        UIMenuItem *deleteItem = [[UIMenuItem alloc] initWithTitle:@"Delete" action:@selector(deleteLine:)];
        
        menu.menuItems = @[deleteItem];
        
        [menu setTargetRect:CGRectMake(point.x, point.y, 2, 2) inView:self];
        [menu setMenuVisible:YES animated:YES];
        
    }else{
        [[UIMenuController sharedMenuController] setMenuVisible:NO animated:YES];
        
        
    }
    
    [self setNeedsDisplay];
    
}

-(void)longPress:(UILongPressGestureRecognizer*)gestureRecognizer{
    
    NSLog(@"LongPress");
    
    _pan.enabled = YES;
    _previousPanPoint = [gestureRecognizer locationInView:self];
    [self setSelectedLine:[self lineatPoint:_previousPanPoint]];
    [self setNeedsDisplay];

}

-(void)pan:(UIPanGestureRecognizer*)gestureRecognizer{
    
   // NSLog(@"Pan");
    
    switch (gestureRecognizer.state) {

        case UIGestureRecognizerStateEnded:{
            _pan.enabled = NO;
            [self setSelectedLine:nil];
            break;
        }
        default:{
            CGPoint currentPanPoint = [gestureRecognizer locationInView:self];
            CGPoint delta = CGPointMake(currentPanPoint.x - _previousPanPoint.x,currentPanPoint.y - _previousPanPoint.y);
            self.selectedLine.begin = CGPointMake(self.selectedLine.begin.x + delta.x, self.selectedLine.begin.y + delta.y);
            self.selectedLine.end = CGPointMake(self.selectedLine.end.x + delta.x, self.selectedLine.end.y + delta.y);
            _previousPanPoint = currentPanPoint;
            break;
        }
    }
    
    [self setNeedsDisplay];

}

-(void)swipeUp:(UISwipeGestureRecognizer*)gestureRecognizer{
    
    NSLog(@"SwipeUp");
    [self addSubview:_slider];
    
    
}

-(void)swipeDown:(UISwipeGestureRecognizer*)gestureRecognizer{
    
    NSLog(@"SwipeDown");
    [_slider removeFromSuperview];
    
    
}

-(void)slider:(UISlider*)slider{
    
    NSLog(@"%f",roundf(slider.value));
}

-(void)deleteLine:(id)sender{
    
    [self.renderedLines removeObject:self.selectedLine];
    self.selectedLine = nil;
    
    [self setNeedsDisplay];
    
}

-(BOOL)canBecomeFirstResponder{
    
    return YES;
}

-(TMBLine*) lineatPoint:(CGPoint)p{
    
    for (TMBLine *l in self.renderedLines) {
        if([l havePoint:p]){
            return l;
        }
    }
    
    return nil;
}

/*
 Param:nil
 Function: This method search the App documents file directore,and initialize a array with a decoded data of an array
 Return:nil
 */
-(void)setUpDatabase{
    
//    _userDefaults = [NSUserDefaults standardUserDefaults];
//    if (_userDefaults)
//        self.renderedLines = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:[_userDefaults objectForKey:@"Key"]]];
//    else
//        self.renderedLines = [[NSMutableArray alloc] init];
//
//    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    _appFileFolder = [documentsDirectory stringByAppendingPathComponent:PLISTNAME];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath: _appFileFolder])
    {
        _appFileFolder = [documentsDirectory stringByAppendingPathComponent: [NSString stringWithFormat: PLISTNAME] ];
    }
    
    
    //If plist exists, load data from plist in a array
    if ([fileManager fileExistsAtPath: _appFileFolder])
    {
        NSData *dataToLoad = [NSData dataWithContentsOfFile:_appFileFolder];
        self.renderedLines = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:dataToLoad]];

    }
    // If the file doesn’t exist, create an empty array
    else
    {
        self.renderedLines     = [[NSMutableArray alloc] init];
    }
    

    
}



/*
 Param:nil
 Function: This method Encode the array , and store the encoded data of array in a plist
 Return:nil
 */
-(void)saveData{
    
    
    NSData *dataToSave = [NSKeyedArchiver archivedDataWithRootObject:self.renderedLines];
    [dataToSave writeToFile:_appFileFolder atomically:YES];
    
}

/*
 Param:(TMBLine*)line= line to be render
 Function: This set the color of the line to be drawed according by angle  between the line begin point and  line end point
 Return:UIColor(color of the line to be render)
 */
-(UIColor *)drawColor:(TMBLine *)line{
    
    UIColor *color = [UIColor blackColor];
    
    float angle =abs([line getAngleBetween:self.center and:line.end]);
    
    angle = angle/180;
    
    color = [UIColor colorWithHue:angle saturation:1 brightness:1 alpha:1];
    
    return color;
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    for (TMBLine *line in self.renderedLines) {
        [[self drawColor:line] set];
        if (line.type == StrokeTypeLine)
            [line stroke];
         else
            [line drawCircle];
    }

    for (NSValue *key in self.linesInRender) {
        TMBLine *line = self.linesInRender[key];
        [[self drawColor:line] set];
        if (line.type == StrokeTypeLine){
            [line stroke];
        }
        else{
            [line drawCircle];
        }

    }
    
    
    if(![self.selectedLine isEqual:nil]){
        [[UIColor greenColor] set];
        [self.selectedLine stroke];
    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    for(UITouch *touch in touches){
        
        CGPoint location = [touch locationInView:self];
        TMBLine *line = [[TMBLine alloc] init];
        line.lineWidth = roundf(_slider.value);

        
        NSValue *key = [NSValue valueWithNonretainedObject:touch];

        switch (touches.count) {
            case 1:
                line.type = StrokeTypeLine;
                line.begin = location;
                line.end = location;
                break;
                
            case 2:
                line.begin = location;
                line.type = StrokeTypeCircle;
                location = [[[touches allObjects] lastObject] locationInView:self];
                line.end = location;
                break;
                
            default:
                break;
        }
        [self.linesInRender setObject:line forKey:key];
        
    }
    

    [self setNeedsDisplay];

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    for(UITouch *touch in touches){
        
        CGPoint location = [touch locationInView:self];
        NSValue *key = [NSValue valueWithNonretainedObject:touch];
        
        TMBLine *line = self.linesInRender[key];
        
        switch (touches.count) {
                
            case 1:
                line.end = location;
                break;
                
            case 2:
                line.begin = location;
                location = [[[touches allObjects] lastObject] locationInView:self];
                line.end = location;
                break;
                
            default:
                break;
        }
        
    }
    
    [self setNeedsDisplay];
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    for(UITouch *touch in touches){
        
        NSValue *key = [NSValue valueWithNonretainedObject:touch];
        TMBLine *line = self.linesInRender[key];
        
        [self.renderedLines addObject:line];
        [self.linesInRender removeObjectForKey:key];
    }
    
    [self saveData];
    [self setNeedsDisplay];

}


-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    
    for(UITouch *touch in touches){
        NSValue *key = [NSValue valueWithNonretainedObject:touch];
        [self.linesInRender removeObjectForKey:key];
    }
    
}

@end
