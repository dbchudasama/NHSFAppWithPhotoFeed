//
//  NHSFChapterObject.h
//  NHSFApp
//
//  Created by Divyesh B Chudasama on 06/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NHSFChapterObject : NSObject

//Creating Designated Initialiser - This initialiser will take some NHSF Affiliated Chapter Data from the NHSF Affiliated Chapter Data class (NHSFAffiliatedChapterData.h file) and an image and set the chapter properties accordingly. The initialiser will take two arguments, an NSDictionary of Chapter Data and a UIImage holding chapter logo image.

//All the chapter property information as shown below will be obtained from the NHSFAffiliatedChapterData files
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *zone;
@property (strong, nonatomic) NSString *president;
@property (strong, nonatomic) NSString *vp;
@property (strong, nonatomic) NSString *secretary;
@property (strong, nonatomic) NSString *treasurer;
@property (strong, nonatomic) NSString *events;
@property (strong, nonatomic) NSString *sports;
@property (strong, nonatomic) NSString *web;
@property (strong, nonatomic) NSString *sewa;
@property (strong, nonatomic) NSString *learning;
@property (strong, nonatomic) NSString *meetingsOfficer;
@property (strong, nonatomic) NSString *universityOfficer;
@property (strong, nonatomic) NSString *sponsorship;
@property (strong, nonatomic) NSString *assistantTreasurer;
@property (strong, nonatomic) NSString *pr;
@property (strong, nonatomic) NSString *prCampusRep;
@property (strong, nonatomic) NSString *khCampusRep;
@property (strong, nonatomic) NSString *media;
@property (strong, nonatomic) NSString *photographer;
@property (strong, nonatomic) NSString *marketing;
@property (strong, nonatomic) NSString *education;
@property (strong, nonatomic) NSString *bhakti;
@property (strong, nonatomic) NSString *culture;
@property (strong, nonatomic) NSString *tech;
@property (strong, nonatomic) NSString *ujaaliChoreo;
@property (strong, nonatomic) NSString *waterlooRep;
@property (strong, nonatomic) NSString *strandRep;
@property (strong, nonatomic) NSString *diviaCoordinator;
@property (strong, nonatomic) NSString *roshini;
@property (strong, nonatomic) NSString *unionRep;
@property (strong, nonatomic) NSString *diversity;
@property (strong, nonatomic) NSString *aartiCoordinator;
@property (strong, nonatomic) NSString *advertisement;
@property (strong, nonatomic) NSString *jainRep;
@property (strong, nonatomic) NSString *social;
@property (strong, nonatomic) NSString *safetyOfficer;
@property (strong, nonatomic) NSString *outreach;
@property (strong, nonatomic) NSString *fundraising;
@property (strong, nonatomic) NSString *performingArts;
@property (strong, nonatomic) NSString *intersocietyRep;
@property (strong, nonatomic) NSString *leedsMetUniRep;
@property (strong, nonatomic) NSString *bollywoodDance;
@property (strong, nonatomic) NSString *alumni;
@property (strong, nonatomic) NSString *advisory;
@property (strong, nonatomic) NSString *promotions;
@property (strong, nonatomic) NSString *dharma;
@property (strong, nonatomic) NSString *graphics;

//The images shall be added manually
@property (strong, nonatomic) UIImage *chapterImage;


//Defining designated initialiser
-(id)initWithData: (NSDictionary *)data andImage:(UIImage *)image;

@end
