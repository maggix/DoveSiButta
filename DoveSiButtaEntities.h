/**
*
*Copyright 2010 OuterCurve Foundation
*
*Licensed under the Apache License, Version 2.0 (the "License");
*you may not use this file except in compliance with the License.
*You may obtain a copy of the License at
*
*http://www.apache.org/licenses/LICENSE-2.0
*
*Unless required by applicable law or agreed to in writing, software
*distributed under the License is distributed on an "AS IS" BASIS,
*WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
*See the License for the specific language governing permissions and
*limitations under the License.
*/
/**
* This code was generated by the tool 'odatagen'.
* Runtime Version:1.0
*
* Changes to this file may cause incorrect behavior and will be lost if
* the code is regenerated.
*/
/**
* Defines default Data Service URL for this proxy class
*/
#define DEFAULT_SERVICE_URL @""


#define DataServiceVersion @"1.0"

#import "ODataObject.h"
#import "ObjectContext.h"
#import "DataServiceQuery.h"
#import "ODataGUID.h"
#import "ODataBool.h"
#import  "mProperties.h"


/**
 * @interface:Box
 * @Type:EntityType
 
 * @key:BoxID* 
 */
@interface DoveSiButtaModel_Box : ODataObject
{
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.Int32
	*/
	NSNumber *m_BoxID;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.String
	* @MaxLength:50
	* @FixedLength:false
	*/
	NSString *m_Title;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.DateTime
	*/
	NSDate *m_EventDate;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.String
	* @MaxLength:256
	* @FixedLength:false
	*/
	NSString *m_Description;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:256
	* @FixedLength:false
	*/
	NSString *m_HostedById;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.String
	* @MaxLength:256
	* @FixedLength:false
	*/
	NSString *m_HostedBy;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.String
	* @MaxLength:20
	* @FixedLength:false
	*/
	NSString *m_ContactPhone;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.String
	* @MaxLength:50
	* @FixedLength:false
	*/
	NSString *m_Address;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.String
	* @MaxLength:30
	* @FixedLength:false
	*/
	NSString *m_Country;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.Double
	*/
	NSDecimalNumber *m_Latitude;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.Double
	*/
	NSDecimalNumber *m_Longitude;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.String
	* @MaxLength:50
	* @FixedLength:false
	*/
	NSString *m_BoxType;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:50
	* @FixedLength:false
	*/
	NSString *m_Picture_Filename;
	
	/**
	* @Type:NavigationProperty
	* @Relationship:FK_Ratings_Boxes
	* @FromRole:Boxes
	* @ToRole:Ratings
	*/
	NSMutableArray *m_Ratings;
	
	/**
	* @Type:NavigationProperty
	* @Relationship:FK_Pictures_Boxes
	* @FromRole:Box
	* @ToRole:Picture
	*/
	NSMutableArray *m_Pictures;
	
}

@property ( nonatomic , retain , getter=getBoxID , setter=setBoxID )NSNumber *m_BoxID;
@property ( nonatomic , retain , getter=getTitle , setter=setTitle ) NSString *m_Title;
@property ( nonatomic , retain , getter=getEventDate , setter=setEventDate )NSDate *m_EventDate;
@property ( nonatomic , retain , getter=getDescription , setter=setDescription ) NSString *m_Description;
@property ( nonatomic , retain , getter=getHostedById , setter=setHostedById ) NSString *m_HostedById;
@property ( nonatomic , retain , getter=getHostedBy , setter=setHostedBy ) NSString *m_HostedBy;
@property ( nonatomic , retain , getter=getContactPhone , setter=setContactPhone ) NSString *m_ContactPhone;
@property ( nonatomic , retain , getter=getAddress , setter=setAddress ) NSString *m_Address;
@property ( nonatomic , retain , getter=getCountry , setter=setCountry ) NSString *m_Country;
@property ( nonatomic , retain , getter=getLatitude , setter=setLatitude )NSDecimalNumber *m_Latitude;
@property ( nonatomic , retain , getter=getLongitude , setter=setLongitude )NSDecimalNumber *m_Longitude;
@property ( nonatomic , retain , getter=getBoxType , setter=setBoxType ) NSString *m_BoxType;
@property ( nonatomic , retain , getter=getPicture_Filename , setter=setPicture_Filename ) NSString *m_Picture_Filename;
@property ( nonatomic , retain , getter=getRatings , setter=setRatings )NSMutableArray *m_Ratings;
@property ( nonatomic , retain , getter=getPictures , setter=setPictures )NSMutableArray *m_Pictures;

+ (id) CreateBoxWithboxid:(NSNumber *)aBoxID title:(NSString *)aTitle eventdate:(NSDate *)aEventDate description:(NSString *)aDescription hostedby:(NSString *)aHostedBy contactphone:(NSString *)aContactPhone address:(NSString *)aAddress country:(NSString *)aCountry latitude:(NSDecimalNumber *)aLatitude longitude:(NSDecimalNumber *)aLongitude boxtype:(NSString *)aBoxType;
- (id) init;
- (id) initWithUri:(NSString*)anUri;
@end

/**
 * @interface:Rating
 * @Type:EntityType
 
 * @key:RatingID* 
 */
@interface DoveSiButtaModel_Rating : ODataObject
{
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.Int32
	*/
	NSNumber *m_RatingID;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.Int32
	*/
	NSNumber *m_BoxID;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.String
	* @MaxLength:256
	* @FixedLength:false
	*/
	NSString *m_AttendeeName;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.String
	* @MaxLength:256
	* @FixedLength:false
	*/
	NSString *m_AttendeeNameId;
	
	/**
	* @Type:EntityProperty
	* @EdmType:Edm.Int32
	*/
	NSNumber *m_RatingValue;
	
	/**
	* @Type:NavigationProperty
	* @Relationship:FK_Ratings_Boxes
	* @FromRole:Ratings
	* @ToRole:Boxes
	*/
	NSMutableArray *m_Box;
	
}

@property ( nonatomic , retain , getter=getRatingID , setter=setRatingID )NSNumber *m_RatingID;
@property ( nonatomic , retain , getter=getBoxID , setter=setBoxID )NSNumber *m_BoxID;
@property ( nonatomic , retain , getter=getAttendeeName , setter=setAttendeeName ) NSString *m_AttendeeName;
@property ( nonatomic , retain , getter=getAttendeeNameId , setter=setAttendeeNameId ) NSString *m_AttendeeNameId;
@property ( nonatomic , retain , getter=getRatingValue , setter=setRatingValue )NSNumber *m_RatingValue;
@property ( nonatomic , retain , getter=getBox , setter=setBox )NSMutableArray *m_Box;

+ (id) CreateRatingWithratingid:(NSNumber *)aRatingID boxid:(NSNumber *)aBoxID attendeename:(NSString *)aAttendeeName;
- (id) init;
- (id) initWithUri:(NSString*)anUri;
@end

/**
 * @interface:Picture
 * @Type:EntityType
 
 * @key:ID* 
 */
@interface DoveSiButtaModel_Picture : ODataObject
{
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.Int32
	*/
	NSNumber *m_ID;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.Int32
	*/
	NSNumber *m_LinkedBoxID;
	
	/**
	* @Type:EntityProperty
	* NotNullable
	* @EdmType:Edm.String
	* @MaxLength:50
	* @FixedLength:false
	*/
	NSString *m_Picture_Filename;
	
	/**
	* @Type:NavigationProperty
	* @Relationship:FK_Pictures_Boxes
	* @FromRole:Picture
	* @ToRole:Box
	*/
	NSMutableArray *m_Box;
	
}

@property ( nonatomic , retain , getter=getID , setter=setID )NSNumber *m_ID;
@property ( nonatomic , retain , getter=getLinkedBoxID , setter=setLinkedBoxID )NSNumber *m_LinkedBoxID;
@property ( nonatomic , retain , getter=getPicture_Filename , setter=setPicture_Filename ) NSString *m_Picture_Filename;
@property ( nonatomic , retain , getter=getBox , setter=setBox )NSMutableArray *m_Box;

+ (id) CreatePictureWithid:(NSNumber *)aID linkedboxid:(NSNumber *)aLinkedBoxID picture_filename:(NSString *)aPicture_Filename;
- (id) init;
- (id) initWithUri:(NSString*)anUri;
@end

/**
 * Container interface DoveSiButtaEntities, Namespace: DoveSiButtaModel
 */
@interface DoveSiButtaEntities : ObjectContext
{
	 NSString *m_OData_etag;
	 DataServiceQuery *m_Boxes;
	 DataServiceQuery *m_Ratings;
	 DataServiceQuery *m_Pictures;
	
}

@property ( nonatomic , retain , getter=getEtag , setter=setEtag )NSString *m_OData_etag;
@property ( nonatomic , retain , getter=getBoxes , setter=setBoxes ) DataServiceQuery *m_Boxes;
@property ( nonatomic , retain , getter=getRatings , setter=setRatings ) DataServiceQuery *m_Ratings;
@property ( nonatomic , retain , getter=getPictures , setter=setPictures ) DataServiceQuery *m_Pictures;

- (id) init;
- (id) initWithUri:(NSString*)anUri credential:(id)acredential;
- (NSArray *) FindUpcomingItems;
- (NSArray *) FindAllItems;
- (NSArray *) ItemsNearMeWithplaceorzip:(NSString *)placeOrZip;
- (NSArray *) ItemsNearMeByCoordinatesWithlatitude:(NSDecimalNumber *)latitude longitude:(NSDecimalNumber *)longitude;
- (id) boxes;
- (id) ratings;
- (id) pictures;
- (void) addToBoxes:(id)anObject;
- (void) addToRatings:(id)anObject;
- (void) addToPictures:(id)anObject;

@end
