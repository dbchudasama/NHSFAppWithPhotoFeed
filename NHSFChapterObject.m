//
//  NHSFChapterObject.m
//  NHSFApp
//
//  Created by Divyesh B Chudasama on 06/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import "NHSFChapterObject.h"
#import "NHSFAffiliatedChapterData.h"

@implementation NHSFChapterObject

-(id)init
{
    //The current object self is being passed into the NEW designated initialiser creatd in .h file, meaning the existing initialiser method is being overridden. Then return back self
    self = [self initWithData:nil andImage:nil];
    return self;
}

//Implementing designated initialiser
-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image
{
    //Super refers to the superclass NSObject. Whats happening here is that we are telling the compiler to first do the initilaser with the code inside of the initialiser inside NSObject. This prepares our object correctly. Then we add additional code on top of this so we can have our own additional functionality, specifically when we initialise our NHSFChapterObjects, we are able to have our initial properties set up so we can immediately start using the objects
    self = [super init];
    
    //Setting up the initialser so that when I create my object, I will use the data variable name of type NSDictionary, and my object will already have the properties required set up for me
    self.name = data[CHAPTER_NAME];
    self.zone = data[CHAPTER_ZONE];
    self.president = data[PRESIDENT];
    self.vp = data[VP];
    self.secretary = data[SECRETARY];
    self.treasurer = data[TREASURER];
    self.events = data[EVENTS];
    self.sports = data[SPORTS];
    self.web = data[WEB];
    self.sewa = data[SEWA];
    self.learning = data[LEARNING];
    self.meetingsOfficer = data[MEETINGS_OFFICER];
    self.universityOfficer = data[UNIVERSITY_OFFICER];
    self.sponsorship = data[SPONSORSHIP];
    self.assistantTreasurer = data[ASSISTANT_TREASURER];
    self.pr = data[PR];
    self.prCampusRep = data[PR_CAMPUS_REP];
    self.khCampusRep = data[KH_CAMPUS_REP];
    self.media = data[MEDIA];
    self.photographer = data[PHOTOGRAPHER];
    self.marketing = data[MARKETING];
    self.education = data[EDUCATION];
    self.bhakti = data[BHAKTI];
    self.culture = data[CULTURE];
    self.tech = data[TECH];
    self.ujaaliChoreo = data[UJAALI_CHOREO];
    self.waterlooRep = data[WATERLOO_REP];
    self.strandRep = data[STRAND_REP];
    self.diviaCoordinator = data[DIVIA_COORDINATOR];
    self.roshini = data[ROSHINI];
    self.unionRep = data[UNION_REP];
    self.diversity = data[DIVERSITY];
    self.aartiCoordinator = data[AARTI_COORDINATOR];
    self.advertisement = data[ADVERTISEMENT];
    self.jainRep = data[JAIN_REP];
    self.social = data[SOCIAL];
    self.safetyOfficer = data[SAFETY_OFFICER];
    self.outreach = data[OUTREACH];
    self.fundraising = data[FUNDRAISING];
    self.performingArts = data[PERFORMING_ARTS];
    self.performingArts = data[PERFORMING_ARTS];
    self.intersocietyRep = data[INTERSOCIETY_REP];
    self.leedsMetUniRep = data[LEEDS_MET_UNI_REP];
    self.bollywoodDance = data[BOLLYWOOD_DANCE];
    self.alumni = data[ALUMNI];
    self.advisory = data[ADVISORY];
    self.promotions = data[PROMOTIONS];
    self.dharma = data[DHARMA];
    self.graphics = data[GRAPHICS];
    
    
    //Setting up initial image. Dictionary is not being used as the image being passed in is a seperate argument for the initialiser
    self.chapterImage = image;
    
    return self;
}


@end
