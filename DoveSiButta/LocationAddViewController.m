//
//  LocationAddViewController.m
//  DoveSiButta
//
//  Created by Giovanni Maggini on 15/01/12.
//  Copyright (c) 2012 Giovanni Maggini. All rights reserved.
//

#import "LocationAddViewController.h"
//Pageviewcontroller
#import "TextFieldCell.h"
#import "NibLoadedCell.h"
#import "PictureFileViewController.h"
#import "LabelCell.h"
#import "CheckmarkCell.h"

//OData
#import "WindowsCredential.h"
#import "ACSCredential.h"
#import "ACSUtil.h"
#import "AzureTableCredential.h"
#import "Tables.h"
#import "ODataServiceException.h"
#import "ODataXMlParser.h"

//UIImage extensions
#import "UIImage+Extensions.h"

//Xpath
#import "XPathQuery.h"

//NSdata
#import "NSData+Base64.h"

#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"

#define radians( degrees ) ( degrees * M_PI / 180 ) 

@implementation LocationAddViewController
@synthesize newItem;
@synthesize pictureFile;
@synthesize selectedTypes;
@synthesize setTypes;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)saveItem:(id)sender
{
    
    if([self.setTypes count] < 1)
    {
        //avviso che non può creare un cestino senza almeno un tipo!
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Attenzione", @"") message:NSLocalizedString(@"Devi selezionare almeno una tipologia dei cassonetti in foto!", @"") delegate:self cancelButtonTitle:NSLocalizedString(@"Ok, grazie", @"") otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    if( ([newItem getLatitude] != [NSDecimalNumber zero] || [newItem getLongitude]  !=  [NSDecimalNumber zero] ) && [self.pictureFile length] > 0)
    {
        
        HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
        HUD.delegate = self;
        HUD.labelText = @"Caricamento";
        [self.view addSubview:HUD];
        [HUD show:YES];
        
        NSString *boxType = [[NSString alloc] init];
        for(NSString *s in self.setTypes)
        {
            boxType = [boxType stringByAppendingFormat:@"%@;",s];
        }
        
        [boxType retain];
//        NSLog(@"boxtype: %@", boxType);
        
        //1- Get item with ID
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *serviceURI= [defaults objectForKey:@"serviceURI"];

        
        NSString *udid = [[UIDevice currentDevice] uniqueIdentifier];
        [newItem setContactPhone:[udid substringToIndex:20]];
        [newItem setBoxType:boxType];
        [newItem setDescription:@"Inviata con la App per iPhone DoveSiButta"];
        [newItem setPicture_Filename:@""];
//        [newItem setPicture_Filename:[self.pictureFile lastPathComponent]];
//        NSLog(@"Il nome del file sarà %@", [newItem getPicture_Filename]);

        
        DoveSiButtaEntities *proxy=[[DoveSiButtaEntities alloc]initWithUri:serviceURI credential:nil];
        [proxy retain];
    //    NSString *odataResult = [[proxy GetFileWithdinnerid:self.selectedItem] retain];
    //    odataResult = [[odataResult stringByReplacingOccurrencesOfString:@"xmlns=\"http://schemas.microsoft.com/ado/2007/08/dataservices\"" withString:@"" ] stringByReplacingOccurrencesOfString:@"standalone=\"true\"" withString:@""];
        NSData *pictureData = [NSData dataWithContentsOfFile:self.pictureFile];
        DoveSiButtaModel_Picture *newPicture = [[DoveSiButtaModel_Picture alloc] initWithUri:nil];
        
//        [newItem setPicture_File:pictureData];
        
        @try {
            [proxy addToBoxes:newItem];
//            NSLog(@"newitem boxid %@",[newItem getBoxID]);
//            [proxy setSaveChangesOptions:Batch];
//            NSString *aStr=@"This is a iPhone test Document";
//            NSData* aData=[aStr dataUsingEncoding: NSASCIIStringEncoding];
//            [proxy setSaveStream:newItem stream:pictureData closeStream:NO contentType:@"image/jpeg" slug:[self.pictureFile lastPathComponent]];
            [proxy saveChanges];  //se faccio saveChanges qui e poi la query e l'update, genera errore. Ma scrive comunque 1 valore nuovo 
//            [proxy saveChanges];
//            [proxy updateObject:newItem];
//            [proxy saveChanges];
//            [proxy setSaveStream:newItem stream:pictureData closeStream:NO contentType:@"image/jpeg" slug:@"nuovofile.jpg"];
//            [proxy addObject:@"Boxes" object:newItem];

//            [proxy saveChanges];
            
            
            
//            [proxy updateObject:newItem];
//            [proxy setSaveStream:newItem stream:pictureData closeStream:YES contentType:@"image/jpeg" slug:@"nuovofile.jpg"];
//            [proxy saveChanges];
//            DoveSiButtaModel_Box *aNewBox = [[DoveSiButtaModel_Box alloc] initWithUri:nil];
//            [aNewBox setBoxID:[NSNumber numberWithInt:40]];
//            [proxy addToBoxes:aNewBox];
//
//            [proxy setSaveStream:aNewBox stream:pictureData closeStream:YES contentType:@"image/jpeg" slug:@"nuovofile.jpg"];
//            [proxy saveChanges];
//            //          
//            DataServiceQuery *query = [[proxy boxes] orderBy:@"BoxID desc"];[query top:1];
//            QueryOperationResponse *queryOperationResponse = [query execute];
//            DoveSiButtaModel_Box *aNewBox =[[queryOperationResponse getResult] objectAtIndex:0];
//            [aNewBox retain];
//            NSLog(@"anewbox ID: %@", [aNewBox getBoxID]); 
//            [newItem setBoxID:[aNewBox getBoxID]];
//            [proxy updateObject:newItem];
////            [proxy setSaveStream:aNewBox stream:aData closeStream:NO contentType:@"plain/text" slug:@"nuovofile.txt"];
//            [proxy saveChanges];

            [proxy addToPictures:newPicture];
            DataServiceQuery *query = [[proxy boxes] orderBy:@"BoxID desc"];[query top:1];
            QueryOperationResponse *queryOperationResponse = [query execute];
            DoveSiButtaModel_Box *aNewBox =[[queryOperationResponse getResult] objectAtIndex:0];
            [aNewBox retain];
            NSLog(@"anewbox ID: %@", [aNewBox getBoxID]); 
            //            [newPicture setLinkedBoxID:[aNewBox getBoxID]];
            //            [proxy updateObject:newItem];
            //            [proxy addLink:newPicture sourceProperty:@"LinkedBoxID" targetObject:aNewBox];
            [proxy setSaveStream:newPicture stream:pictureData closeStream:YES contentType:@"image/jpeg" slug:[NSString stringWithFormat:@"%@",[aNewBox getBoxID]]];
            //            [proxy setSaveChangesOptions:Batch];
            
            
            [proxy saveChanges];

        }
        @catch (NSException *exception) {
            NSLog(@"Errore: %@:%@",exception.name, exception.reason);
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Attenzione", @"") message:[NSString stringWithFormat:NSLocalizedString(@"Errore nel caricamento della foto.(%@)", @""),[exception description]] delegate:self cancelButtonTitle:NSLocalizedString(@"Ok", @"") otherButtonTitles: nil];
            [alert show];
        }
        @finally {
            [HUD hide:YES afterDelay:1];
            [self dismissModalViewControllerAnimated:YES];
        }
            
        /*
        @try {
            [proxy addToPictures:newPicture];
            DataServiceQuery *query = [[proxy boxes] orderBy:@"BoxID desc"];[query top:1];
            QueryOperationResponse *queryOperationResponse = [query execute];
            DoveSiButtaModel_Box *aNewBox =[[queryOperationResponse getResult] objectAtIndex:0];
            [aNewBox retain];
                        NSLog(@"anewbox ID: %@", [aNewBox getBoxID]); 
//            [newPicture setLinkedBoxID:[aNewBox getBoxID]];
//            [proxy updateObject:newItem];
//            [proxy addLink:newPicture sourceProperty:@"LinkedBoxID" targetObject:aNewBox];
            [proxy setSaveStream:newPicture stream:pictureData closeStream:YES contentType:@"image/jpeg" slug:[NSString stringWithFormat:@"%@",[aNewBox getBoxID]]];
//            [proxy setSaveChangesOptions:Batch];
            

            [proxy saveChanges];


        }
        @catch (NSException *exception) {
            NSLog(@"Errore: %@:%@",exception.name, exception.reason);
        }
        @finally {
            [HUD hide:YES afterDelay:1];
        }
        */
        
        /*
        NSString *retString = [proxy CreateNewItemWithtitle:[newItem getTitle] description:[newItem getDescription] hostedby:@"" latitude:[newItem getLatitude] longitude:[newItem getLongitude] address:[newItem getAddress] country:[newItem getCountry] boxtype:[newItem getBoxType] contactphone:[newItem getContactPhone] picture_filename:@""]; // [proxy CreateNewItemWithtitle:[newItem getTitle] latitude:[newItem getLatitude] longitude:[newItem getLongitude] address:[newItem getAddress] boxtype:[newItem getBoxType] picture_filename:[newItem getPicture_Filename]];
        NSLog(@"Returned: %@", retString);
        
        retString = [[retString stringByReplacingOccurrencesOfString:@"xmlns=\"http://schemas.microsoft.com/ado/2007/08/dataservices\"" withString:@"" ] stringByReplacingOccurrencesOfString:@"standalone=\"true\"" withString:@""];
        NSArray *result = PerformXMLXPathQuery([retString dataUsingEncoding:NSUTF8StringEncoding], @"/CreateNewItem");

        //Dovrebbe contenere solo il numero dell'ID della box
        int newBoxID = 0;//NSNumber *newBoxID = [[NSNumber alloc] init];
        @try {
            newBoxID = [[[result objectAtIndex:0] objectForKey:@"nodeContent"] integerValue];
        }
        @catch (NSException *exception) {
            newBoxID = -1;
        }
        if (newBoxID > 0) {
            //Vuole dire che ha funzionato
            NSData *pictureData = [NSData dataWithContentsOfFile:self.pictureFile];

            NSString *base64PictureData = [pictureData base64EncodedString];
            [pictureData retain];
            @try{
            NSString *setFileReturn = [proxy SetFileWithitemid:[NSNumber numberWithInt:newBoxID] file:pictureData];
            setFileReturn = [[setFileReturn stringByReplacingOccurrencesOfString:@"xmlns=\"http://schemas.microsoft.com/ado/2007/08/dataservices\"" withString:@"" ] stringByReplacingOccurrencesOfString:@"standalone=\"true\"" withString:@""]; //Con il metodo POST è not found
            result = PerformXMLXPathQuery([setFileReturn dataUsingEncoding:NSUTF8StringEncoding], @"/SetFile");
            }
            @catch (NSException *exception) {
                NSLog(@"exception %@", [exception description]);
            }
            [newItem setBoxID:[NSNumber numberWithInt:newBoxID]];
//            [proxy setSaveStream:newItem stream:pictureData closeStream:YES contentType:@"" slug:@""];
            //The context is not currently tracking the entity
            
            
            //prova con asi..
//            ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"192.168.138.2/Services/OData.svc/SetFile/"]];
//            [request addPostValue:[NSString stringWithFormat:@"%d",newBoxID] forKey:@"itemID"];
//            [request addData:pictureData forKey:@"picture_file"];
//            [request start];
//            @try {
//                NSString* setFileReturn = [proxy SetFileBase64Withitemid:[NSNumber numberWithInt:newBoxID] filebase64:base64PictureData];
//                setFileReturn = [[setFileReturn stringByReplacingOccurrencesOfString:@"xmlns=\"http://schemas.microsoft.com/ado/2007/08/dataservices\"" withString:@"" ] stringByReplacingOccurrencesOfString:@"standalone=\"true\"" withString:@""];
//                result = PerformXMLXPathQuery([setFileReturn dataUsingEncoding:NSUTF8StringEncoding], @"/SetFileBase64");
//                [result retain];
//                NSLog(@"result: %@",result);
                

//            }
//            @catch (NSException *exception) {
//                
//            }


            NSString *setFileResult = [[result objectAtIndex:0] objectForKey:@"nodeContent"];
            [setFileResult retain];
            NSLog(@"setfileresult %@", setFileResult);
            int resultNumber = 0;//NSNumber *resultNumber = [[NSNumber alloc] init];
            @try {
                resultNumber = [setFileResult integerValue];
            }
            @catch (NSException *exception) {
                resultNumber = -1;
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Attenzione", @"") message:NSLocalizedString(@"Si è verificato un problema. Errore nel caricamento della foto.", @"") delegate:self cancelButtonTitle:NSLocalizedString(@"Ok", @"") otherButtonTitles: nil];
                [alert show];
            }
            @finally {
                [HUD hide:YES afterDelay:1];
            }
            
        }
        else
        {
            [HUD hide:YES afterDelay:1];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Attenzione", @"") message:NSLocalizedString(@"Si è verificato un problema. La segnalazione non è andata a buon fine!", @"") delegate:self cancelButtonTitle:NSLocalizedString(@"Ok", @"") otherButtonTitles: nil];
            [alert show];

        }
        
//            http://192.168.138.2/Services/OData.svc/CreateNewItem?longitude=10.32752f&title='Nuovo'&latitude=45.51141f  
         
         */


    }
    else
    {
        //avviso che non può creare un cestino senza foto!
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Attenzione", @"") message:NSLocalizedString(@"È necessario scattare una fotografia!", @"") delegate:self cancelButtonTitle:NSLocalizedString(@"Ok", @"") otherButtonTitles: nil];
        [alert show];
        
    }
}


- (void)cancelNewItem:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //tipi delle checkmark
    self.setTypes = [[NSMutableSet alloc] init];
    self.selectedTypes = [[NSMutableArray alloc] init];
    
    //Tasto Cancel
    UIBarButtonItem *cancelButton =
    [[[UIBarButtonItem alloc]
      initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
      target:self
      action:@selector(cancelNewItem:)]
     autorelease];
    self.navigationItem.leftBarButtonItem = cancelButton;
    
    //Tasto Salva
    UIBarButtonItem *saveButton =
    [[[UIBarButtonItem alloc]
      initWithBarButtonSystemItem:UIBarButtonSystemItemSave
      target:self
      action:@selector(saveItem:)]
     autorelease];
    self.navigationItem.rightBarButtonItem = saveButton;
    
    //TODO: fare in modo che le celle assomiglino a quelle di CoreDataBooks
         
    //Icons
    
    // read property list into memory as an NSData object
    NSString *path = [[NSBundle mainBundle] pathForResource:@"IconForType" ofType:@"plist"];
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:path];
    NSError *error = [[NSError alloc] init];
    NSPropertyListFormat format;
    
    // convert static property list into dictionary object
    NSDictionary *plistDictionary = (NSDictionary*)[NSPropertyListSerialization propertyListWithData:plistXML options:NSPropertyListMutableContainersAndLeaves format:&format error:&error];
    
    if (!plistDictionary) 
    {
        NSLog(@"Error reading plist: %@, format: %d", error, format);
    }
    NSDictionary *iconsDictionary = [plistDictionary copy ];
    [iconsDictionary retain];
    
    //Types
    path = [[NSBundle mainBundle] pathForResource:@"RifiutiTypes" ofType:@"plist"];
    plistXML = [[NSFileManager defaultManager] contentsAtPath:path];
    
    // convert static property list into dictionary object
    plistDictionary =(NSDictionary*)[NSPropertyListSerialization propertyListWithData:plistXML options:NSPropertyListMutableContainersAndLeaves format:&format error:&error]; 
    if (!plistDictionary) 
    {
        NSLog(@"Error reading plist: %@, format: %d", error, format);
    }
    NSMutableArray* rifiutiTypes = [[NSMutableArray alloc] init];
    for(NSString *dic in plistDictionary)
    {
        NSDictionary *i = [plistDictionary objectForKey:dic];
        [rifiutiTypes addObject:i];
    }
    [rifiutiTypes retain];
   
    
    //Creazione TableView
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    
   	[self addSectionAtIndex:0 withAnimation:UITableViewRowAnimationNone];
    
    [self appendRowToSection:0 cellClass:[NibLoadedCell class] 
                    cellData:[NSDictionary dictionaryWithObjectsAndKeys:
                              [newItem getTitle],@"labelText",
                              [NSString stringWithString:@"indifferenziata_300px"],@"imageName",                               NSLocalizedString(@"Nuovo Cestino", @"Title Label"),@"titleLabelText", 
                              nil] 
               withAnimation:UITableViewRowAnimationNone];
    
    [self addSectionAtIndex:1 withAnimation:UITableViewRowAnimationNone];
    [self appendRowToSection:1 cellClass:[TextFieldCell class] 
                    cellData:[NSMutableDictionary dictionaryWithObjectsAndKeys:
                              NSLocalizedString(@"Dove", @""),
                              @"label",
                              [NSString stringWithFormat:@"%@",[newItem getAddress] ], @"value",
                              NSLocalizedString(@"Value goes here", @""),
                              @"placeholder", 
                              [NSNumber numberWithBool:NO], 
                              @"editable",
                              nil]
               withAnimation:UITableViewRowAnimationNone];
    [self appendRowToSection:1 cellClass:[TextFieldCell class] 
                    cellData:[NSMutableDictionary dictionaryWithObjectsAndKeys:
                              NSLocalizedString(@"When", @""),
                              @"label",
                              [NSString stringWithFormat:@"%@",[newItem getEventDate] ], @"value",
                              NSLocalizedString(@"Value goes here", @""),
                              @"placeholder", 
                              [NSNumber numberWithBool:NO], 
                              @"editable",
                              nil]
               withAnimation:UITableViewRowAnimationNone];
    [self appendRowToSection:1 cellClass:[TextFieldCell class] 
                    cellData:[NSMutableDictionary dictionaryWithObjectsAndKeys:
                              NSLocalizedString(@"Latitude", @""),
                              @"label",
                              [NSString stringWithFormat:@"%@",[newItem getLatitude] ], @"value",
                              NSLocalizedString(@"Value goes here", @""),
                              @"placeholder", 
                              [NSNumber numberWithBool:NO], 
                              @"editable",
                              nil]
               withAnimation:UITableViewRowAnimationNone];
    [self appendRowToSection:1 cellClass:[TextFieldCell class] 
                    cellData:[NSMutableDictionary dictionaryWithObjectsAndKeys:
                              NSLocalizedString(@"Longitude", @""),
                              @"label",
                              [NSString stringWithFormat:@"%@",[newItem getLongitude] ], @"value",
                              NSLocalizedString(@"Value goes here", @""),
                              @"placeholder", 
                              [NSNumber numberWithBool:NO], 
                              @"editable",
                              nil]
               withAnimation:UITableViewRowAnimationNone];
  
    [self appendRowToSection:1 cellClass:[TextFieldCell class] 
                    cellData:[NSMutableDictionary dictionaryWithObjectsAndKeys:
                              NSLocalizedString(@"Address", @""),
                              @"label",
                              [NSString stringWithFormat:@"%@",[newItem getAddress] ], @"value",
                              NSLocalizedString(@"Value goes here", @""),
                              @"placeholder", 
                              [NSNumber numberWithBool:NO], 
                              @"editable",
                              nil]
               withAnimation:UITableViewRowAnimationNone];
    [self appendRowToSection:1 cellClass:[TextFieldCell class] 
                    cellData:[NSMutableDictionary dictionaryWithObjectsAndKeys:
                              NSLocalizedString(@"Country", @""),
                              @"label",
                              [NSString stringWithFormat:@"%@",[newItem getCountry] ], @"value",
                              NSLocalizedString(@"Value goes here", @""),
                              @"placeholder", 
                              [NSNumber numberWithBool:NO], 
                              @"editable",
                              nil]
               withAnimation:UITableViewRowAnimationNone];
 
    [self appendRowToSection:1 cellClass:[LabelCell class] 
                    cellData: [NSMutableDictionary dictionaryWithObjectsAndKeys: 
                               NSLocalizedString(@"Scatta una foto!",@""),
                               @"label",
                               @"addPicture", 
                               @"action", 
                               nil] 
               withAnimation:UITableViewRowAnimationNone]; 
    
    //TODO: qui ci vanno le celle (che sono poi delle normali LabelCell ma con accanto il checkbox
    
    [dateFormat release];

    
    [self addSectionAtIndex:2 withAnimation:UITableViewRowAnimationNone];
    for (NSDictionary *dict in rifiutiTypes)
    {
        [self appendRowToSection:2 cellClass:[CheckmarkCell class] 
                        cellData: [NSMutableDictionary dictionaryWithObjectsAndKeys: 
                                   NSLocalizedString([dict objectForKey:@"type"],@""),
                                   @"label",
                                   [dict objectForKey:@"id"], 
                                   @"value",
                                   [NSNumber numberWithBool:NO],
                                   @"checked",
                                   nil] 
                   withAnimation:UITableViewRowAnimationNone];
    }
    
}


#pragma mark - Table view delegates

//
// tableView:didSelectRowAtIndexPath:
//
// Handle row selection
//
- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)anIndexPath
{
    //	PageCell *cell = (PageCell *)[aTableView cellForRowAtIndexPath:anIndexPath];
	if (![[aTableView cellForRowAtIndexPath:anIndexPath] isKindOfClass:[PageCell class]])
	{
		//return;
	}
	
    if ([[aTableView cellForRowAtIndexPath:anIndexPath] isKindOfClass:[LabelCell class]]) 
    {
        LabelCell *cell = (LabelCell *)[aTableView cellForRowAtIndexPath:anIndexPath];
        if([cell.action isEqualToString:@"addPicture"])
        {
            UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
            [imgPicker setAllowsEditing:YES];
            imgPicker.delegate = self;
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            }
            else 
            {
                imgPicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            }
            [self.navigationController presentModalViewController:imgPicker animated:YES];
//            [self presentModalViewController:self.imgPicker animated:YES];
                
        }
        //return;
        
    }
    else if ([[aTableView cellForRowAtIndexPath:anIndexPath] isKindOfClass:[CheckmarkCell class]])
    {
        CheckmarkCell *cell = (CheckmarkCell*)[aTableView cellForRowAtIndexPath:anIndexPath];
        if(!cell.checked)
        {
            cell.checked = YES;
            [self.setTypes addObject:cell.value];
            
        }
        else if (cell.checked)
        {
            cell.checked = NO;
            [self.setTypes removeObject:cell.value];
        }
        
        if (cell.accessoryType == UITableViewCellAccessoryCheckmark) 
        {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        else if (cell.accessoryType == UITableViewCellAccessoryNone)
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        
        //return;
    }
    
    PageCell *cell = (PageCell *)[aTableView cellForRowAtIndexPath:anIndexPath];
    [cell handleSelectionInTableView:aTableView];
    
	
}


#pragma mark - ImagePicker Delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)img editingInfo:(NSDictionary *)editInfo {
    //Qui devo salvare l'immagine nella cache e resizarla
    UIImage *scaledImage = [img imageByScalingProportionallyToMinimumSize:CGSizeMake(640.0f, 480.0f)]; // [self imageWithImage:img scaledToSizeWithSameAspectRatio:CGSizeMake(640.0f, 480.0f)];
    NSData* imageData = UIImageJPEGRepresentation(scaledImage, 0.9f);
    
    // Give a name to the file
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyyMMdd_hhmmss"];
    NSString* imageName = [[dateFormat stringFromDate:[NSDate date]] stringByAppendingString:@".jpg"];
    
    // Now, we have to find the documents directory so we can save it
    // Note that you might want to save it elsewhere, like the cache directory,
    // or something similar.
//    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString* documentsDirectory = [paths objectAtIndex:0];
    NSString *cachesDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    // Now we get the full path to the file
    NSString* fullPathToFile = [cachesDirectory stringByAppendingPathComponent:imageName];
    
    // and then we write it out
    [imageData writeToFile:fullPathToFile atomically:NO];
    self.pictureFile = fullPathToFile;
    NSLog(@"Picture path: %@", fullPathToFile);
//    [[picker parentViewController] dismissModalViewControllerAnimated:YES];
//    [picker dismissModalViewControllerAnimated:YES];
    [self dismissModalViewControllerAnimated:YES];
}

/*
- (UIImage*)imageWithImage:(UIImage*)sourceImage scaledToSizeWithSameAspectRatio:(CGSize)targetSize
{  
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    
    if (CGSizeEqualToSize(imageSize, targetSize) == NO) {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor) {
            scaleFactor = widthFactor; // scale to fit height
        }
        else {
            scaleFactor = heightFactor; // scale to fit width
        }
        
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor) {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5; 
        }
        else if (widthFactor < heightFactor) {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }     
    
    CGImageRef imageRef = [sourceImage CGImage];
    CGBitmapInfo bitmapInfo = CGImageGetBitmapInfo(imageRef);
    CGColorSpaceRef colorSpaceInfo = CGImageGetColorSpace(imageRef);
    
    if (bitmapInfo == kCGImageAlphaNone) {
        bitmapInfo = kCGImageAlphaNoneSkipLast;
    }
    
    CGContextRef bitmap;
    
    if (sourceImage.imageOrientation == UIImageOrientationUp || sourceImage.imageOrientation == UIImageOrientationDown) {
        bitmap = CGBitmapContextCreate(NULL, targetWidth, targetHeight, CGImageGetBitsPerComponent(imageRef), CGImageGetBytesPerRow(imageRef), colorSpaceInfo, bitmapInfo);
        
    } else {
        bitmap = CGBitmapContextCreate(NULL, targetHeight, targetWidth, CGImageGetBitsPerComponent(imageRef), CGImageGetBytesPerRow(imageRef), colorSpaceInfo, bitmapInfo);
        
    }   
    
    // In the right or left cases, we need to switch scaledWidth and scaledHeight,
    // and also the thumbnail point
    if (sourceImage.imageOrientation == UIImageOrientationLeft) {
        thumbnailPoint = CGPointMake(thumbnailPoint.y, thumbnailPoint.x);
        CGFloat oldScaledWidth = scaledWidth;
        scaledWidth = scaledHeight;
        scaledHeight = oldScaledWidth;
        
        CGContextRotateCTM (bitmap, radians(90));
        CGContextTranslateCTM (bitmap, 0, -targetHeight);
        
    } else if (sourceImage.imageOrientation == UIImageOrientationRight) {
        thumbnailPoint = CGPointMake(thumbnailPoint.y, thumbnailPoint.x);
        CGFloat oldScaledWidth = scaledWidth;
        scaledWidth = scaledHeight;
        scaledHeight = oldScaledWidth;
        
        CGContextRotateCTM (bitmap, radians(-90));
        CGContextTranslateCTM (bitmap, -targetWidth, 0);
        
    } else if (sourceImage.imageOrientation == UIImageOrientationUp) {
        // NOTHING
    } else if (sourceImage.imageOrientation == UIImageOrientationDown) {
        CGContextTranslateCTM (bitmap, targetWidth, targetHeight);
        CGContextRotateCTM (bitmap, radians(-180.));
    }
    
    CGContextDrawImage(bitmap, CGRectMake(thumbnailPoint.x, thumbnailPoint.y, scaledWidth, scaledHeight), imageRef);
    CGImageRef ref = CGBitmapContextCreateImage(bitmap);
    UIImage* newImage = [UIImage imageWithCGImage:ref];
    
    CGContextRelease(bitmap);
    CGImageRelease(ref);
    
    return newImage; 
}
*/


@end
