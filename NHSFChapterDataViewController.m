//
//  NHSFChapterDataViewController.m
//  NHSFApp
//
//  Created by Divyesh B Chudasama on 07/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import "NHSFChapterDataViewController.h"
#import "NHSFAffiliatedChapterData.h"

@interface NHSFChapterDataViewController ()

@end

@implementation NHSFChapterDataViewController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DataCell"; //Identifier for the cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    switch (indexPath.row)
    {
        case 0:
            cell.textLabel.text = @"President(s):";
            cell.detailTextLabel.text = self.chapterObject.president;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 1:
            cell.textLabel.text = @"Vice President(s):";
            cell.detailTextLabel.text = self.chapterObject.vp;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 2:
            cell.textLabel.text = @"Secretary(s):";
            cell.detailTextLabel.text = self.chapterObject.secretary;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 3:
            cell.textLabel.text = @"Treasurer(s):";
            cell.detailTextLabel.text = self.chapterObject.treasurer;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 4:
            cell.textLabel.text = @"Assistant Treasurer(s):";
            cell.detailTextLabel.text = self.chapterObject.assistantTreasurer;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 5:
            cell.textLabel.text = @"Events Coordinator(s):";
            cell.detailTextLabel.text = self.chapterObject.events;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 6:
            cell.textLabel.text = @"Sewa Coordinator(s):";
            cell.detailTextLabel.text = self.chapterObject.sewa;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 7:
            cell.textLabel.text = @"Learning Coordinator(s):";
            cell.detailTextLabel.text = self.chapterObject.learning;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 8:
            cell.textLabel.text = @"Sports Coordinator(s):";
            cell.detailTextLabel.text = self.chapterObject.sports;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 9:
            cell.textLabel.text = @"Head of Web:";
            cell.detailTextLabel.text = self.chapterObject.web;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 10:
            cell.textLabel.text = @"Meetings Officer(s):";
            cell.detailTextLabel.text = self.chapterObject.meetingsOfficer;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 11:
            cell.textLabel.text = @"University Officer(s):";
            cell.detailTextLabel.text = self.chapterObject.universityOfficer;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 12:
            cell.textLabel.text = @"Sponsorship:";
            cell.detailTextLabel.text = self.chapterObject.sponsorship;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 13:
            cell.textLabel.text = @"Public Relations Officer(s):";
            cell.detailTextLabel.text = self.chapterObject.pr;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 14:
            cell.textLabel.text = @"Public Relations Campus Rep(s):";
            cell.detailTextLabel.text = self.chapterObject.prCampusRep;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 15:
            cell.textLabel.text = @"KH Campus Rep(s):";
            cell.detailTextLabel.text = self.chapterObject.khCampusRep;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 16:
            cell.textLabel.text = @"Head of Media:";
            cell.detailTextLabel.text = self.chapterObject.media;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 17:
            cell.textLabel.text = @"Photographer(s):";
            cell.detailTextLabel.text = self.chapterObject.photographer;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 18:
            cell.textLabel.text = @"Head of Marketing:";
            cell.detailTextLabel.text = self.chapterObject.marketing;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 19:
            cell.textLabel.text = @"Head of Education:";
            cell.detailTextLabel.text = self.chapterObject.education;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 20:
            cell.textLabel.text = @"Bhakti Coordinator(s):";
            cell.detailTextLabel.text = self.chapterObject.bhakti;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 21:
            cell.textLabel.text = @"Culture Coordinator(s):";
            cell.detailTextLabel.text = self.chapterObject.culture;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 22:
            cell.textLabel.text = @"Head of Technology:";
            cell.detailTextLabel.text = self.chapterObject.tech;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 23:
            cell.textLabel.text = @"Ujaali Choreographer(s):";
            cell.detailTextLabel.text = self.chapterObject.ujaaliChoreo;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 24:
            cell.textLabel.text = @"Waterloo Rep:";
            cell.detailTextLabel.text = self.chapterObject.waterlooRep;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 25:
            cell.textLabel.text = @"Strand Rep:";
            cell.detailTextLabel.text = self.chapterObject.strandRep;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 26:
            cell.textLabel.text = @"Divia Coordinator(s):";
            cell.detailTextLabel.text = self.chapterObject.diviaCoordinator;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 27:
            cell.textLabel.text = @"Roshini Coordinator(s):";
            cell.detailTextLabel.text = self.chapterObject.roshini;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 28:
            cell.textLabel.text = @"Union Rep:";
            cell.detailTextLabel.text = self.chapterObject.unionRep;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 29:
            cell.textLabel.text = @"Diversity Officer(s):";
            cell.detailTextLabel.text = self.chapterObject.diversity;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 30:
            cell.textLabel.text = @"Aarti Coordinator(s):";
            cell.detailTextLabel.text = self.chapterObject.aartiCoordinator;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 31:
            cell.textLabel.text = @"Head of Advertisement:";
            cell.detailTextLabel.text = self.chapterObject.advertisement;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 32:
            cell.textLabel.text = @"Jain Rep:";
            cell.detailTextLabel.text = self.chapterObject.jainRep;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 33:
            cell.textLabel.text = @"Social Secretary(s):";
            cell.detailTextLabel.text = self.chapterObject.social;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 34:
            cell.textLabel.text = @"Safety Officer(s):";
            cell.detailTextLabel.text = self.chapterObject.safetyOfficer;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 35:
            cell.textLabel.text = @"Outreach Officer(s):";
            cell.detailTextLabel.text = self.chapterObject.outreach;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 36:
            cell.textLabel.text = @"Fundraising Officer(s):";
            cell.detailTextLabel.text = self.chapterObject.fundraising;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 37:
            cell.textLabel.text = @"Head of Performing Arts:";
            cell.detailTextLabel.text = self.chapterObject.performingArts;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 38:
            cell.textLabel.text = @"Intersociety Rep(s):";
            cell.detailTextLabel.text = self.chapterObject.intersocietyRep;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 39:
            cell.textLabel.text = @"Leeds Met Uni Rep(s):";
            cell.detailTextLabel.text = self.chapterObject.leedsMetUniRep;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 40:
            cell.textLabel.text = @"Bollywood Dance Coordinator(s):";
            cell.detailTextLabel.text = self.chapterObject.bollywoodDance;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 41:
            cell.textLabel.text = @"Alumni(s):";
            cell.detailTextLabel.text = self.chapterObject.alumni;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 42:
            cell.textLabel.text = @"Advisory:";
            cell.detailTextLabel.text = self.chapterObject.advisory;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 43:
            cell.textLabel.text = @"Head of Promotion(s):";
            cell.detailTextLabel.text = self.chapterObject.promotions;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
            break;
        case 44:
            cell.textLabel.text = @"Dharma Coordinator(s)";
            cell.detailTextLabel.text = self.chapterObject.dharma;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
        case 45:
            cell.textLabel.text = @"Head of Graphics:";
            cell.detailTextLabel.text = self.chapterObject.graphics;
            cell.detailTextLabel.textColor = [UIColor orangeColor];
        default:
            break;

    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 45;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
