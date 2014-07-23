//
//  NHSFAffiliatedChapterData.h
//  NHSFApp
//
//  Created by Divyesh B Chudasama on 06/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CHAPTER_NAME @"Chapter Name"
#define CHAPTER_ZONE @"Zone"
#define PRESIDENT @"President"
#define VP @"VP"
#define SECRETARY @"Secretary"
#define TREASURER @"Treasurer"
#define EVENTS @"Events"
#define SPORTS @"Sports"
#define WEB @"Web"
#define SEWA @"Sewa"
#define LEARNING @"Learning"
#define MEETINGS_OFFICER @"Meetings Officer"
#define UNIVERSITY_OFFICER @"University Officer"
#define SPONSORSHIP @"Sponsorship"
#define ASSISTANT_TREASURER @"Assistant Treasurer"
#define PR @"PR"
#define PR_CAMPUS_REP @"PR Campus Rep 1"
#define KH_CAMPUS_REP @"KH Campus Rep 1"
#define MEDIA @"Media"
#define PHOTOGRAPHER @"Photographer"
#define MARKETING @"Marketing"
#define EDUCATION @"Education"
#define BHAKTI @"Bhakti"
#define CULTURE @"Culture"
#define TECH @"Tech"
#define UJAALI_CHOREO @"Ujaali Choreographer"
#define WATERLOO_REP @"Waterloo Rep"
#define STRAND_REP @"Strand Rep"
#define DIVIA_COORDINATOR @"Divia Coordinator"
#define ROSHINI @"Roshini Coordinator"
#define UNION_REP @"Union Rep"
#define DIVERSITY @"Diversity Officer"
#define AARTI_COORDINATOR @"Aarti Coordinator"
#define ADVERTISEMENT @"Advertisement"
#define JAIN_REP @"Jain Rep"
#define SOCIAL @"Social"
#define SAFETY_OFFICER @"Safety Officer"
#define OUTREACH @"Outreach"
#define FUNDRAISING @"Fundraising"
#define PERFORMING_ARTS @"Performing Arts"
#define INTERSOCIETY_REP @"Intersociety Rep"
#define LEEDS_MET_UNI_REP @"Leeds Met Uni Rep"
#define BOLLYWOOD_DANCE @"Bollywood Dance"
#define ALUMNI @"Alumni"
#define ADVISORY @"Advisory"
#define PROMOTIONS @"Promotions"
#define DHARMA @"Dharma Coordinator"
#define GRAPHICS @"Graphics"




@interface NHSFAffiliatedChapterData : NSObject

+ (NSArray *)allAffiliatedChapters; // Returns an array of NSDictionaries

@end
