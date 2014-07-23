//
//  NHSFAffiliatedChapterData.m
//  NHSFApp
//
//  Created by Divyesh B Chudasama on 06/07/2014.
//  Copyright (c) 2014 DivyeshBC. All rights reserved.
//

#import "NHSFAffiliatedChapterData.h"

@implementation NHSFAffiliatedChapterData

+ (NSArray *)allAffiliatedChapters
{
    NSMutableArray *chapterInformation = [@[] mutableCopy];
    
    NSDictionary *astonDictionary = @{CHAPTER_NAME : @"NHSF Aston", CHAPTER_ZONE : @"Central Zone"};
    [chapterInformation addObject:astonDictionary];

    NSDictionary *bcuDictionary = @{CHAPTER_NAME : @"NHSF BCU", CHAPTER_ZONE : @"Central Zone"};
    [chapterInformation addObject:bcuDictionary];
    
    NSDictionary *birminghamDictionary = @{CHAPTER_NAME : @"NHSF Birmingham", CHAPTER_ZONE : @"Central Zone"};
    [chapterInformation addObject:birminghamDictionary];
    
    NSDictionary *bppDictionary = @{CHAPTER_NAME : @"NHSF BPP", CHAPTER_ZONE : @"London Zone", PRESIDENT : @"Monica Mohan & Ritesh Thakar", VP : @"Akash Aggarwal", TREASURER : @"Monica Mohan", LEARNING : @"Ritesh Thakar", SEWA : @"Grishan Siva", SPORTS : @"Ashwin Rajakumar", MARKETING : @"Jayraj Parmer"};
    [chapterInformation addObject:bppDictionary];
    
    NSDictionary *bradfordDictionary = @{CHAPTER_NAME : @"NHSF Bradford", CHAPTER_ZONE : @"North Zone", PRESIDENT : @"Lakmiga Murugathas", TREASURER : @"Sidharth Sharma", SECRETARY : @"Kiran Kaur Sandhu", SEWA : @"Kiran Kaur Sandhu", LEARNING : @"Radhika Dave", SPORTS : @"Milan Shukla", EVENTS : @"Niji Daryanani", PROMOTIONS : @"Aehsha Shah"};
    [chapterInformation addObject:bradfordDictionary];
    
    NSDictionary *brightonDictionary = @{CHAPTER_NAME : @"NHSF Brighton", CHAPTER_ZONE : @"South Zone", PRESIDENT : @"Ravi Patel", TREASURER : @"Arpan Shah", SECRETARY : @"Nity Kapour", EVENTS : @"Roshni Patel", WEB : @"Niwatha Mathy", SAFETY_OFFICER : @"Shreena Patel", MEDIA : @"Jesal Shah", OUTREACH : @"Suhani Ghiya", FUNDRAISING : @"Amisha Patel"};
    [chapterInformation addObject:brightonDictionary];
    
    NSDictionary *bristolDictionary = @{CHAPTER_NAME : @"NHSF Bristol", CHAPTER_ZONE : @"South Zone", PRESIDENT : @"Rushang Mita", VP : @"Jagrati Chopra", TREASURER : @"Nihir Shah", SECRETARY : @"Kasun Weerasinghe", EVENTS : @"Aekta (Anna) Sharma", SEWA : @"Krishna Ravichandar", SPORTS : @"Gokhul Ramakrishnan", JAIN_REP : @"Bhawick Jain"};
    [chapterInformation addObject:bristolDictionary];
    
    NSDictionary *brunelDictionary = @{CHAPTER_NAME : @"NHSF Brunel", CHAPTER_ZONE : @"London Zone", PRESIDENT : @"Raj Valgi", VP : @"Smitesh Mistry", SECRETARY : @"Sasha Chand", TREASURER : @"Payal Depala", SEWA : @"Vikas Makwana", WEB : @"Param Gohil", EVENTS : @"Kirti Kumar", MEETINGS_OFFICER : @"Ria Dhillon", SPORTS : @"Sathithar Sakthivel", UNIVERSITY_OFFICER : @"Nancy Pabbi", SPONSORSHIP : @"Ravi Shah"};
    [chapterInformation addObject:brunelDictionary];
    
    NSDictionary *cityDictionary = @{CHAPTER_NAME : @"NHSF City", CHAPTER_ZONE : @"London Zone", PRESIDENT : @"Arth Sash", VP : @"Ruhani Mann", TREASURER : @"Palak Duggal", SPORTS : @"Druvesh Desa", SECRETARY : @"Aayush Bathwal", EVENTS : @"Bhavika Tanna", SEWA : @"Abhishek Joshi", MARKETING : @"Sachin Raghvani"};
    [chapterInformation addObject:cityDictionary];
    
    NSDictionary *coventryDictionary = @{CHAPTER_NAME : @"NHSF Coventry", CHAPTER_ZONE : @"Central Zone"};
    [chapterInformation addObject:coventryDictionary];
    
    NSDictionary *dmuDictionary = @{CHAPTER_NAME : @"NHSF DMU", CHAPTER_ZONE : @"Central Zone"};
    [chapterInformation addObject:dmuDictionary];
    
    NSDictionary *exeterDictionary = @{CHAPTER_NAME : @"NHSF Exeter", CHAPTER_ZONE : @"South Zone"};
    [chapterInformation addObject:exeterDictionary];
    
    NSDictionary *greenwichDictionary = @{CHAPTER_NAME : @"NHSF Greenwich", CHAPTER_ZONE : @"London Zone", PRESIDENT : @"Deepa Dabasia & Rico Navsaria"};
    [chapterInformation addObject:greenwichDictionary];
    
    NSDictionary *hertfordshireDictionary = @{CHAPTER_NAME : @"NHSF Hertfordshire", CHAPTER_ZONE : @"London Zone", PRESIDENT : @"Ketan Ladva & Urvi Parekh", VP : @"Shivani Patel & Rushika Patel"};
    [chapterInformation addObject:hertfordshireDictionary];
    
    NSDictionary *huddersfieldDictionary = @{CHAPTER_NAME : @"NHSF Huddersfield", CHAPTER_ZONE : @"North Zone", PRESIDENT : @"Natasha Patel", TREASURER : @"Parishma Chauhan", EVENTS : @"Roshni Mistry & Seetal Mistry", SEWA : @"Anand Lad", LEARNING : @"Nilam Patel", SPORTS : @"Priyesh Patel & Seetal Mistry", GRAPHICS : @"Nikesh Tailor", ADVISORY : @"Jayshree Khatri"};
    [chapterInformation addObject:huddersfieldDictionary];
    
    NSDictionary *hullDictionary = @{CHAPTER_NAME : @"NHSF Hull", CHAPTER_ZONE : @"North Zone", PRESIDENT : @"Geena Sharma", VP : @"Neil Patel", TREASURER : @"Aishwarya Murthy", SOCIAL : @"Anish Chopra", EVENTS : @"Shalini Manjunath", SPORTS : @"Yogesh Namballa & Shivani Soni", PR : @"Hazel Fletcher", ADVISORY : @"Phininder Balaghan"};
    [chapterInformation addObject:hullDictionary];
    
    NSDictionary *imperialDictionary = @{CHAPTER_NAME : @"NHSF Imperial", CHAPTER_ZONE : @"London Zone", PRESIDENT : @"Aman Sethi & Paavan Sharma", VP : @"Priyaben Patel", TREASURER : @"Bhagyata Kinger & Pooja Shah", SECRETARY : @"Nirali Desai", EDUCATION : @"Pranhnav Sharma & Harshan Lal", BHAKTI : @"Sampriti Gupta", SEWA : @"Ashish Jalan & Bhavna Buxani", CULTURE : @"Shaneil Tanna", MARKETING : @"Vinay Sonagara & Nikhil Math", TECH : @"Dharmesh Tailor", SPORTS : @"Sharlyn Doshi & Varun Kothari", UJAALI_CHOREO : @"Bhavna Buxani, Sampriti Gupta & Sonika Seth", SPONSORSHIP: @"Anisha Malde & Pooja Sharma"};
    [chapterInformation addObject:imperialDictionary];
    
    NSDictionary *kclDictionary = @{CHAPTER_NAME : @"NHSF KCL", CHAPTER_ZONE : @"London Zone", PRESIDENT : @"Abhinav Kishore", VP : @"Trisha Patel & Arthi Kumar", TREASURER : @"Ankush Nambiar", SECRETARY : @"Shruti Patel", LEARNING : @"Hitem Mistry & Darshana Nari", MARKETING : @"Asha Parmer, Prince Naruka & Seema Vaswani", WATERLOO_REP : @"Nikita Gandhi", STRAND_REP : @"Mayur Patel", SEWA : @"Kavita Sharma", SPORTS : @"Anisha Patel, Ajay Mehta, Sajel Mulji & Reneira Seamber"};
    [chapterInformation addObject:kclDictionary];
    
    NSDictionary *keeleDictionary = @{CHAPTER_NAME : @"NHSF Keele", CHAPTER_ZONE : @"Central Zone"};
    [chapterInformation addObject:keeleDictionary];
    
    NSDictionary *kentDictionary = @{CHAPTER_NAME : @"NHSF Kent", CHAPTER_ZONE : @"South Zone", PRESIDENT : @"Kunal Patel", TREASURER : @"Meera Daya", SECRETARY : @"Dhrti Patel", SEWA : @"Georgina Patel", LEARNING : @"Ayushi Dodhia", SOCIAL : @"Akash Puri & Vinay Lad", MARKETING : @"Viknesh Prabhakar"};
    [chapterInformation addObject:kentDictionary];
    
    NSDictionary *kingstonDictionary = @{CHAPTER_NAME : @"NHSF Kingston", CHAPTER_ZONE : @"London Zone", PRESIDENT : @"Bhavik Vara", VP : @"Janak Dattani", SECRETARY : @"Kajal Kara", TREASURER : @"Vichruti Haris", LEARNING : @"Dipak Pindoria", EVENTS : @"Dipesh Mistry & Arjun Popat", ROSHINI : @"Disha Patel & Piya Patel", SOCIAL : @"Monisha Ramkurrum", SPORTS : @"Nitin Rahlan & Unnati Chabildas", PR_CAMPUS_REP: @"Dipak Pindoria & Disha Patel", KH_CAMPUS_REP: @"Vichruti Haris & Nitin Rahlan"};
    [chapterInformation addObject:kingstonDictionary];
    
    NSDictionary *leedsDictionary = @{CHAPTER_NAME : @"NHSF Leeds", CHAPTER_ZONE : @"North Zone", PRESIDENT : @"Akash Bhalla", VP :@"Simran Nanwani", TREASURER : @"Shivy Mehrotra", SECRETARY : @"Sarah Shaikh", EVENTS : @"Priya Madhas, Rishi Karia & Kiran Mistry", SEWA : @"Keshvi Modi & Janika Savani", LEARNING : @"Abhishek Rampal", SPORTS : @"Dhiren Mardania & Mayur Chudasama", INTERSOCIETY_REP : @"Tharika Mohanadasan", SPONSORSHIP : @"Rikesh Patel & Yogita Yarlagadda", LEEDS_MET_UNI_REP : @"Sohini Patel", MARKETING : @"Devanshi Kadia"};
    [chapterInformation addObject:leedsDictionary];
    
    NSDictionary *leicesterDictionary = @{CHAPTER_NAME : @"NHSF Leicester", CHAPTER_ZONE : @"Central Zone"};
    [chapterInformation addObject:leicesterDictionary];
    
    NSDictionary *liverpoolDictionary = @{CHAPTER_NAME : @"NHSF Liverpool", CHAPTER_ZONE : @"North Zone", PRESIDENT : @"Sai Ram", VP : @"Yashika Senior", TREASURER : @"Saumitro Debb", SECRETARY : @"Jyoti Gupta", LEARNING : @"Ananda Mohan & Sandip Patel", SEWA : @"Mihika Joshi & Shanika Bajaj", PR : @"Kokul Sriskandarajah & Tejal Trivedi", EVENTS  : @"Priyank Shah, Vaishnavi Menon & Sharvari Khapre", SPORTS : @"Mitesh Mistry", BOLLYWOOD_DANCE : @"Deepika Ramchandani & Pooja Jethwa", ALUMNI : @"Henal Desai, Madhav Dave, Sadikcha Malla, Radha Measuria & Amar Jethi"};
    [chapterInformation addObject:liverpoolDictionary];
    
    NSDictionary *loughboroughDictionary = @{CHAPTER_NAME : @"NHSF Loughborough", CHAPTER_ZONE : @"Central Zone"};
    [chapterInformation addObject:loughboroughDictionary];
    
    NSDictionary *lseDictionary = @{CHAPTER_NAME : @"NHSF LSE", CHAPTER_ZONE : @"London Zone", PRESIDENT : @"Yaajan Govindia", VP : @"Kapish Dave", TREASURER : @"Taneika Kargwal", ASSISTANT_TREASURER : @"Dilan Halai", SECRETARY : @"Krupa Thakker", SEWA : @"Himanshu Odedra", EVENTS : @"Hinal Tanna, Varun Chumum & Bhavik Rajani", SPORTS : @"Ashil Shah & Viranchi Phakkey", LEARNING : @"Khushboo Miyani", SPONSORSHIP : @"Shivang Sood"};
    [chapterInformation addObject:lseDictionary];
    
    NSDictionary *manchesterDictionary = @{CHAPTER_NAME : @"NHSF Manchester", CHAPTER_ZONE : @"North Zone", PRESIDENT : @"Amar Thaker", VP : @"Shyam Pattni & Dilan Rabadia", TREASURER : @"Jinal Patel", SECRETARY : @"Joyanto Chanda & Dhruvesh Ranpura", EVENTS : @"Kasturi Sanathanan, Ritika Kothari, Anuraag Paul, Varina Popat, Juhi Patel & Aaina Aggarwal", SEWA : @"Nitesh Rathod & Reema Patel", SPORTS : @"Shivam Bhagat", SPONSORSHIP : @"Priyesh Pattni", PR : @"Chetan Sharma", PERFORMING_ARTS : @"Arjun Mistry & Namishka Doshi"};
    [chapterInformation addObject:manchesterDictionary];
    
    NSDictionary *medwayDictionary = @{CHAPTER_NAME : @"NHSF Medway", CHAPTER_ZONE : @"South Zone", PRESIDENT : @"Mithila Poshakwale", VP : @"Sejal Vara & Karan Pankhania", TREASURER : @"Nidhi Verma", SECRETARY : @"Pooja Gunmal", SEWA : @"Krishma Tailor", PR : @"Sujetha Surandran"};
    [chapterInformation addObject:medwayDictionary];
    
    NSDictionary *northamptonDictionary = @{CHAPTER_NAME : @"NHSF Northampton", CHAPTER_ZONE : @"Central Zone"};
    [chapterInformation addObject:northamptonDictionary];
    
    NSDictionary *northumbriaDictionary = @{CHAPTER_NAME : @"NHSF Northumbria", CHAPTER_ZONE : @"North Zone", PRESIDENT : @"Radha Sharma", TREASURER : @"Shalin Mistry", LEARNING : @"Manu Thampi", MARKETING : @"Karan Pugal"};
    [chapterInformation addObject:northumbriaDictionary];
    
    NSDictionary *nottinghamDictionary = @{CHAPTER_NAME : @"NHSF Nottingham", CHAPTER_ZONE : @"Central Zone"};
    [chapterInformation addObject:nottinghamDictionary];
    
    NSDictionary *ntuDictionary = @{CHAPTER_NAME : @"NHSF NTU", CHAPTER_ZONE : @"Central Zone"};
    [chapterInformation addObject:ntuDictionary];
    
    NSDictionary *plymouthDictionary = @{CHAPTER_NAME : @"NHSF Plymouth", CHAPTER_ZONE : @"South Zone", PRESIDENT : @"Christin George", VP : @"Kirushthiga Naguleswaran", SECRETARY : @"Bhavna Balla", TREASURER : @"Payal Choksi", EVENTS : @"Abhsishek Dhangi", SEWA : @"Ashna Ramdin", LEARNING : @"Shreeya Gohel"};
    [chapterInformation addObject:plymouthDictionary];
    
    NSDictionary *portsmouthDictionary = @{CHAPTER_NAME : @"NHSF Portsmouth", CHAPTER_ZONE : @"South Zone", PRESIDENT : @"Monil Patel", VP : @"Jay Amin & Ashan Sejpal", TREASURER : @"Sagar Mistry", SECRETARY : @"Priya Patel", EVENTS : @"Moxa Kachhia, Priyanka Patel & Jenisha Patel", SEWA : @"Pooja Verma & Devan Seedher", SPORTS : @"Amish Patel & Pooja Patel", PR : @"Divya Popat", ADVERTISEMENT : @"Yogi Patel", DHARMA : @"Devi Thakar & Jaimini Modi", SPONSORSHIP : @"Amish Patel"};
    [chapterInformation addObject:portsmouthDictionary];
    
    NSDictionary *qmulDictionary = @{CHAPTER_NAME : @"NHSF QMUL", CHAPTER_ZONE : @"London Zone", PRESIDENT : @"Rushil Masrani", VP : @"Pooja Nathadwarawala", TREASURER : @"Bina Vyas", ASSISTANT_TREASURER : @"Sindiya Sivagnanam", SECRETARY : @"Niva Shah", EVENTS : @"Chandan Varsani, Ravina Bhanot & Janki Kotecha", SPORTS : @"Dhiresh Raithatha, Bhavik Joshi & Pooja Seta", SEWA : @"Neil Shah, Vaishanjali Bhiman & Anjani Ghedia", PR : @"Pareen Chhaganlal & Serena Patel", MEDIA : @"Jayant Parbat", MARKETING : @"Pareen Chhaganlal & Serena Patel", PHOTOGRAPHER : @"Karishma Bhadesia"};
    [chapterInformation addObject:qmulDictionary];
    
    NSDictionary *readingDictionary = @{CHAPTER_NAME : @"NHSF Reading", CHAPTER_ZONE : @"South Zone", PRESIDENT : @"Reva Shah", VP : @"Daksh Jain & Tamish Khullar", TREASURER : @"Tamish Khullar", SECRETARY : @"Daksh Jain", EVENTS : @"Shivani Rukhana", LEARNING : @"", SOCIAL : @"Kanika Arora", MARKETING : @"Harshita Mullick"};
    [chapterInformation addObject:readingDictionary];
    
    NSDictionary *roehamptonDictionary = @{CHAPTER_NAME : @"NHSF Roehampton", CHAPTER_ZONE : @"London Zone", PRESIDENT : @"Charmi Shah", VP : @"Chandni Bakhai"};
    [chapterInformation addObject:roehamptonDictionary];
    
    NSDictionary *sgulDictionary = @{CHAPTER_NAME : @"NHSF SGUL", CHAPTER_ZONE : @"London Zone", PRESIDENT : @"Florika Radia & Avni Dhokia", VP : @"Hershil Lakhani", SECRETARY : @"Bijaya Chowdhury", TREASURER : @"Nikhil Sahdev", LEARNING : @"Niyati Sodani", EVENTS : @"Nikeel Patel & Neelkrishna Patel", DIVIA_COORDINATOR : @"Vaish Dandavate, Nikita & Punjabi", SEWA : @"Aayushi Shukla & Bejal Patel", SPORTS : @"Rudrik Thakkar, Priyanka Patel & Arun Raghuramam"};
    [chapterInformation addObject:sgulDictionary];
    
    NSDictionary *sheffieldDictionary = @{CHAPTER_NAME : @"NHSF Sheffield", CHAPTER_ZONE : @"North Zone", PRESIDENT : @"Hemant Mistry", VP : @"Prachi Savani", TREASURER : @"Ashish Parmar", SECRETARY : @"Hiral Sapa & Tulsi Patel", EVENTS : @"Akshay Patel & Akash Fagoonee", SPORTS : @"Minal Jain, Gobika Chandrakumar & Tejus Patel", PR : @"Pongchudar Pillay", EDUCATION : @"Sonali Patel", PERFORMING_ARTS : @"Sona Mistry & Shurovi Sharif"};
    [chapterInformation addObject:sheffieldDictionary];
    
    NSDictionary *soasDictionary = @{CHAPTER_NAME : @"NHSF SOAS", CHAPTER_ZONE : @"London Zone", PRESIDENT : @"Gayatri Muthukumar", VP : @"Vaishali (Vaish) Shah", SECRETARY : @"Poonam Gosai", TREASURER : @"Seema Gupta"};
    [chapterInformation addObject:soasDictionary];
    
    NSDictionary *southamptonDictionary = @{CHAPTER_NAME : @"NHSF Southampton", CHAPTER_ZONE : @"South Zone"};
    [chapterInformation addObject:southamptonDictionary];
    
    NSDictionary *ueaDictionary = @{CHAPTER_NAME : @"NHSF UEA", CHAPTER_ZONE : @"South Zone", PRESIDENT : @"Kishan Jethwa", VP : @"Aadesh Dave", SECRETARY : @"Saraswathi Menon", TREASURER : @"Bhakti Kavia", SPORTS : @"Jasmine Chauhan, Rhea Soni, Akash Kadiwar, Teajl Patel & Daivik Ganshi", SEWA : @"Demisha Vaghela & Punit Naran", UNION_REP : @"Aarti Patel", DIVERSITY : @"Nishchay Kakkar", AARTI_COORDINATOR : @"Vivek Tank", SOCIAL : @"Sejal Modhwadia", ADVERTISEMENT : @"Jaymini Chohan"};
    [chapterInformation addObject:ueaDictionary];
    
    NSDictionary *uweDictionary = @{CHAPTER_NAME : @"NHSF UWE", CHAPTER_ZONE : @"South Zone", PRESIDENT : @"Zubin Bhatia", SECRETARY : @"Tharane Ravi", EVENTS : @"Vikita Vaja", LEARNING : @"Anna & Roshnie Madhani", SEWA : @"Vikita Vaja"};
    [chapterInformation addObject:uweDictionary];
    
    NSDictionary *warwickDictionary = @{CHAPTER_NAME : @"NHSF Warwick", CHAPTER_ZONE : @"Central Zone"};
    [chapterInformation addObject:warwickDictionary];
    
    NSDictionary *westminsterDictionary = @{CHAPTER_NAME : @"NHSF Westminster", CHAPTER_ZONE : @"London Zone", PRESIDENT : @"Ekta Rayani", TREASURER : @"Jaimini Shah", SEWA : @"Charmi Patel", SPORTS : @"Brijesh Pujara"};
    [chapterInformation addObject:westminsterDictionary];
    
    NSDictionary *yorkDictionary = @{CHAPTER_NAME : @"NHSF York", CHAPTER_ZONE : @"North Zone", PRESIDENT : @"Andrelina Ramdhun", SECRETARY : @"Sonika Sharma", TREASURER : @"Alyssia Kaczmarczyk"};
    [chapterInformation addObject:yorkDictionary];
    
    
    return [chapterInformation copy];
    

}

@end
