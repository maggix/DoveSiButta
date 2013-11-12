//
//  TextViewViewController.m
//  DoveSiButta
//
//  Created by Giovanni on 11/7/13.
//  Copyright (c) 2013 Giovanni Maggini. All rights reserved.
//

#import "TextViewViewController.h"

@interface TextViewViewController ()

@property (nonatomic, weak) IBOutlet UITextView *textView;

@end

@implementation TextViewViewController

- (void)fixUIForiOS7
{
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //Fix UI for iOS7
    [self fixUIForiOS7];
    
    _textView.text = _textViewText;
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(saveDescription)]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveDescription
{
    [self.navigationController popViewControllerAnimated:YES];
    [_delegate textViewVCDidFinishWithText:_textView.text];
    
    
}

     
@end
