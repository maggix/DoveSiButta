//
//  LocationDetailViewController.h
//  DoveSiButta
//
//  Created by Giovanni Maggini on 10/01/12.
//  Copyright (c) 2012 Giovanni Maggini. All rights reserved.
//

#import "PageViewController.h"
#import "DoveSiButtaEntities.h"

@interface LocationDetailViewController : PageViewController

@property (nonatomic, retain) DoveSiButtaModel_Box *selectedBox;

- (id)initWithItem:(DoveSiButtaModel_Box*)dinner;
//- (void)addRSVP:(id)sender;;

@end
