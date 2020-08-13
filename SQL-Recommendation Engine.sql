CREATE TABLE Credit (
CreditID number(20) primary key,
CreditScore number(20));

CREATE TABLE CarvanaAccount(
CarvanaID number(20) primary key,
FirstName varchar(20),
LastName varchar(20),
PhoneNumber number(20),
ZipCode number(10),
Email varchar(255),
Address varchar(200),
DriverLicense number(20),
LoginType varchar(10),
CreditID number(20),
constraint fk_CarvanaAccount foreign key 
(CreditID) references Credit(CreditID));

CREATE TABLE FacebookLogin(
FCarvanaID number(20) primary key,
constraint fk_FacebookLogin foreign key 
(FCarvanaID) references CarvanaAccount(CarvanaID),
Birthday date,
FriendList clob,
Likes number);

CREATE TABLE VisitorLogin(
VCarvanaID number(20) primary key,
constraint fk_VisitorLogin foreign key 
(VCarvanaID) references CarvanaAccount(CarvanaID));


CREATE TABLE PersonalityorFinanceSurvey(
SurveyID number(20) primary key,
AnnualIncome number(20),
PersonalityTraits varchar(200),
AestheticPreferences varchar(200),
CarvanaID number(20),
constraint fK_PersonalityorFinanceSurvey foreign key (CarvanaID) references CarvanaAccount(CarvanaID));


CREATE TABLE Recommendation(
RecommendationID number(20) primary key,
SurveyID number(20),
constraint fk_Recommendation foreign key (SurveyID) references PersonalityorFinanceSurvey(SurveyID));


CREATE TABLE Cookies (
CookieID number(20) primary key,
IP varchar(20),
SiteViewingHistory clob,
CarvanaID number(20),
constraint fk_Cookies foreign key (CarvanaID) references CarvanaAccount(CarvanaID));


CREATE TABLE Recommendation_Cookies(
Rcd_Ck_ID number(20) primary key,
RecommendationID number(20),
CookieID number(20),
constraint fk_Recommendation_Cookies1 foreign key (RecommendationID) references Recommendation(RecommendationID),
constraint fk_Recommendation_Cookies2 foreign key (CookieID) references Cookies (CookieID));



CREATE TABLE Inventory (
StockNumber number(20) primary key,
VIN varchar(20),
Make varchar(20),
CarModel varchar(20),
CarCost number(20),
Price number(20),
CarYear date,
Mileage number(20),
BodyType varchar(20),
Features varchar(200),
Color varchar(20),
FuelEfficiency number(20),
Engine varchar(20),
DriverTrain varchar(20));


CREATE TABLE Recommendation_Inventory (
Rcd_SN_ID number(20) primary key,
RecommendationID number(20),
StockNumber number(20),
constraint fk_Recommendation_Inventory1 foreign key (RecommendationID) references Recommendation(RecommendationID),
constraint fk_Recommendation_Inventory2 foreign key (StockNumber) references Inventory (StockNumber));


---------------------------------------- **************** INSERT DATA ******************* -----------------------------
insert into Credit values (0323, 720);
insert into Credit values (0861, 840);
insert into Credit values (0923, 433);
insert into Credit values (5843, 682);
insert into Credit values (6211, 245);
insert into Credit values (9848, 556);
insert into Credit values (5272, 773);
insert into Credit values (6890, 632);
insert into Credit values (5323, 556);
insert into Credit values (6210, 601);


insert into CarvanaAccount values (1120345, 'Jared', 'Bergantino', 3419426780, 06207, 'jared@gmail.com', '36 Park St Hartford CT', 18249507, 'Visitor', 0323);
insert into CarvanaAccount values (3302506, 'Li', 'Guo', 4628095712, 06001, 'li@gmail.com', '4 Main St Avon CT', 19503628, 'Visitor', 0861);
insert into CarvanaAccount values (8606313, 'Ziyi', 'Zhao', 8365965295, 06032, 'ziyi@gmail.com', '63 Mulberry Ave New York NY', 10462759, 'Visitor', 0923);
insert into CarvanaAccount values (1947553, 'Wang', 'Fang', 9205718593, 06067, 'wang@gmail.com', '947 Fifth St Denver CO', 19567386, 'Visitor', 5843);
insert into CarvanaAccount values (8604934, 'Stephen', 'King', 7693046271, 06093, 'stephen@gmail.com', '3 South St Des Moines IA', 39576345, 'Facebook', 6211);
insert into CarvanaAccount values (6491739, 'Ai', 'Weiwei', 5463728609, 06081, 'ai@gmail.com', '573 Wild Blvd Helena MT', 97653946, 'Facebook', 9848);
insert into CarvanaAccount values (0418561, 'Fan', 'Bingbing', 8796045295, 06069, 'fan@gmail.com', '45 Bridge Rd Tallahassee FL', 28594638, 'Facebook', 5272);
insert into CarvanaAccount values (7664821, 'Melinda', 'Gates', 2849609874, 06011, 'melinda@gmail.com', '3 Q Ave Atlanta GA', 20564839, 'Facebook', 6890);
insert into CarvanaAccount values (3925967, 'Phillis', 'Wheatley', 1748597746, 06072, 'phillis@gmail.com', '1039 Red Rd Bismark ND', 37562857, 'Facebook', 5323);
insert into CarvanaAccount values (7557293, 'Bob', 'Dylan', 8327894624, 06019, 'bob@gmail.com', '643 Holly Dr Las Vegas NV', 30572967,'Facebook', 6210);


insert into facebooklogin values (8604934, TO_DATE('03-04-1998','MM-DD-YYYY'), 'friendlist', 123);
insert into facebooklogin values (6491739, TO_DATE('12/07/1995','MM-DD-YYYY'), 'friendlist', 3232);
insert into facebooklogin values (0418561, TO_DATE('07/01/1882','MM-DD-YYYY'), 'friendlist', 43434);
insert into facebooklogin values (7664821, TO_DATE('12/25/1932','MM-DD-YYYY'), 'friendlist', 33232);
insert into facebooklogin values (3925967, TO_DATE('10/24/1985','MM-DD-YYYY'), 'friendlist', 2232);
insert into facebooklogin values (7557293, TO_DATE('08/10/2000','MM-DD-YYYY'), 'friendlist', 442);


insert into visitorlogin values (1120345);
insert into visitorlogin values (3302506);
insert into visitorlogin values (8606313);
insert into visitorlogin values (1947553);



insert into Cookies values (10574, '172162541', 'SITEVIEWINGHISTORY', 1120345);
insert into Cookies values (29042, '194235436', 'SITEVIEWINGHISTORY', 3302506);
insert into Cookies values (96840, '952421235', 'SITEVIEWINGHISTORY', 8606313);
insert into Cookies values (50493, '192641542', 'SITEVIEWINGHISTORY', 1947553);
insert into Cookies values (69403, '653751874', 'SITEVIEWINGHISTORY', 8604934);
insert into Cookies values (50539, '960638456', 'SITEVIEWINGHISTORY', 6491739);
insert into Cookies values (50938, '039752358', 'SITEVIEWINGHISTORY', 0418561);
insert into Cookies values (30293, '058302345', 'SITEVIEWINGHISTORY', 7664821);
insert into Cookies values (19375, '058641347', 'SITEVIEWINGHISTORY', 3925967);
insert into Cookies values (10483, '846347490', 'SITEVIEWINGHISTORY', 7557293);


-- https://www.littlethings.com/car-color-personality/2 for personality traits
-- https://www.carmax.com/articles/car-color-popularity Carmax data about car color

insert into PersonalityorFinanceSurvey values (1523, 100500, 'Sophisticated', 'Black', 1120345);
insert into PersonalityorFinanceSurvey values (9302, 3000000, 'Cautious', 'Gray', 3302506);
insert into PersonalityorFinanceSurvey values (4920, 49583, 'purity', 'White', 8606313);
insert into PersonalityorFinanceSurvey values (1048, 123055, 'Outgoing', 'Red', 1947553);
insert into PersonalityorFinanceSurvey values (4830, 80400, 'Practical', 'Silver', 8604934);
insert into PersonalityorFinanceSurvey values (1928, 65000, 'humourous', 'Gold', 6491739);
insert into PersonalityorFinanceSurvey values (1958, 39503, 'honesty', 'White', 0418561);
insert into PersonalityorFinanceSurvey values (8572, 390000, 'optimistic', 'Blue', 7664821);
insert into PersonalityorFinanceSurvey values (9203, 7004304, 'mystery', 'Black', 3925967);
insert into PersonalityorFinanceSurvey values (5934, 4950302, 'thrifty', 'Brown', 7557293);


insert into recommendation values (1294050, 1523);
insert into recommendation values (1205038, 9302);
insert into recommendation values (2321445, 4920);
insert into recommendation values (4054059, 1048);
insert into recommendation values (5950398, 4830);
insert into recommendation values (4930285, 1928);
insert into recommendation values (9034930, 1958);
insert into recommendation values (4958309, 8572);
insert into recommendation values (2859302, 9203);
insert into recommendation values (5840204, 5934);


insert into Inventory values (14234, 'JM1BF2325G0V37585', 'Mazda', '323', 500, 1500, TO_DATE ('1986', 'YYYY'), 230000, 'Hatchback','Leather_seats', 'Blue', 26, '82 HP','FWD');
insert into Inventory values (95002, 'WDBGA51E4TA328716', 'Mercedes Benz', 'S Class', 2300, 5000, TO_DATE ('1996', 'YYYY'), 135000, 'Sedan', 'Remote_start', 'Silver',18, '228 HP', 'RWD');
insert into Inventory values (59403, 'WP0AA2A79BL017244', 'Porsche', 'Panamera', 10000, 35000, TO_DATE ('2011', 'YYYY'), 80000, 'Sport','Heated_seats', 'Red', 21, '300 HP','AWD');
insert into Inventory values (50402, 'JH4DB1670LS801802', 'Acura', 'Integra', 700, 1650, TO_DATE ('1990', 'YYYY'), 67000, 'Hatchback','Backup_camera', 'Blue', 23, '140 HP','FWD');
insert into Inventory values (10056, 'WAULFAFR3DA006959', 'Audi', 'A5', 3400, 10000, TO_DATE ('2013', 'YYYY'), 45000, 'Sedan','Navigation_system', 'Grey', 24, '211 HP','AWD');
insert into Inventory values (30494, '1G8ZF52801Z328015', 'Saturn', 'S Series', 400, 1200, TO_DATE ('2001', 'YYYY'), 156000, 'Sedan','Bluetooth', 'Blue', 29, '100 HP','RWD');
insert into Inventory values (10043, '3VWPG71K97M122542', 'Volkswagen', 'Jetta', 1200, 11000, TO_DATE ('2007', 'YYYY'), 26000, 'Sedan','Sunroof/moonroof', 'Grey', 22, '150 HP','FWD');
insert into Inventory values (19403, '3VWSD29M11M069435', 'Volkswagen', 'Jetta', 700, 2500, TO_DATE ('2001', 'YYYY'), 87000, 'Hatchback','Backup_camera', 'Blue', 22, '115 HP','FWD');
insert into Inventory values (14235, '2HKRM4H73CH623544', 'Honda', 'CR-V', 1300, 5400, TO_DATE ('2012', 'YYYY'), 122000, 'Crossover','Navigation_system', 'Red', 25, '185 HP','AWD');
insert into Inventory values (12634, 'WBANF73576CG65408', 'BMW', '5 Series', 4250, 15300, TO_DATE ('2006', 'YYYY'), 29000, 'Sedan',' Blind_spot_monitoring', 'Silver', 20, '215 HP','FWD');
insert into Inventory values (12434, '1FMYU92ZX5KD13670', 'Toyota', 'Highlander', 1899, 3250, TO_DATE ('2005', 'YYYY'), 49000, 'SUV','Third-row_seating', 'Blue', 18, '153 HP','4WD');


insert into Recommendation_Cookies values (129405010574,1294050,10574);
insert into Recommendation_Cookies values (120503829042,1205038,29042);
insert into Recommendation_Cookies values (232144596840,2321445,96840);
insert into Recommendation_Cookies values (405405950493,4054059,50493);
insert into Recommendation_Cookies values (595039869403,5950398,69403);
insert into Recommendation_Cookies values (493028550539,4930285,50539);
insert into Recommendation_Cookies values (903493050938,9034930,50938);
insert into Recommendation_Cookies values (495830930293,4958309,30293);
insert into Recommendation_Cookies values (285930219375,2859302,19375);
insert into Recommendation_Cookies values (584020410483,5840204,10483);


insert into Recommendation_Inventory values (129405014234,1294050,14234);
insert into Recommendation_Inventory values (120503895002,1205038,95002);
insert into Recommendation_Inventory values (232144559403,2321445,59403);
insert into Recommendation_Inventory values (405405950402,4054059,50402);
insert into Recommendation_Inventory values (595039830494,5950398,30494);
insert into Recommendation_Inventory values (493028510043,4930285,10043);
insert into Recommendation_Inventory values (903493019403,9034930,19403);
insert into Recommendation_Inventory values (495830914235,4958309,14235);
insert into Recommendation_Inventory values (285930212634,2859302,12634);
insert into Recommendation_Inventory values (584020412434,5840204,12434);

/*
drop table visitorlogin;
drop table personalityorfinancesurvey;
drop table inventory;
drop table recommendation;
drop table facebooklogin;
drop table Cookies;
drop table CarvanaAccount;
drop table Credit;
drop table Recommendation_Inventory;
drop table Recommendation_Cookies;
drop table survey;
drop table recommendation_cookies;
drop table recommendation_inventory;
*/

select * from Credit;
select * from CarvanaAccount;
select * from visitorlogin;
select * from facebooklogin;
select * from personalityorfinancesurvey;
select * from recommendation;
select * from Cookies;
select * from Recommendation_Inventory;
select * from Recommendation_Cookies;
select * from inventory;


----------------********** queries ***********------------------------


-- we want to see customers that have income >100000, and we may recommend high-end cars.

select a.FirstName || ' ' || a.LastName as "Full Name",
a.CarvanaID, s.AnnualIncome
from personalityorfinancesurvey s join CarvanaAccount a
on a.CarvanaID = s.CarvanaID
where s.AnnualIncome>100000;


-- we want to see what colors of car would customers with different PersonalityTraits like.

select AestheticPreferences as "Preferred Color",
listagg (PersonalityTraits,',') within group (order by PersonalityTraits) as "Traits",
listagg (CarvanaID,',') within group (order by CarvanaID) AS "CarvanaID"
from personalityorfinancesurvey
group by AestheticPreferences;


-- Choose the cars in stock to match the personal traits of customers based on the results from the survey.

select s.PersonalityTraits as "Traits", i.StockNumber, i.CarModel, i.bodytype
from personalityorfinancesurvey s join recommendation r 
on s.SurveyID = r.SurveyID
join Recommendation_Inventory ri on r.RecommendationID = ri.RecommendationID
join Inventory i on i.StockNumber = ri.StockNumber;


-- We want to know the relationship between the number of likes on Facebook and traits and Aesthetic Preferencesof customers

select f.likes, a.FirstName, s.AestheticPreferences, s.PersonalityTraits
from facebooklogin f join CarvanaAccount a 
on f.FCarvanaID = a.CarvanaID
join personalityorfinancesurvey s
on a.CarvanaID = s.CarvanaID
order by f.likes;


-- we want to see whether customers with higher income tend to have higher credit score

select c.CreditScore, a.CarvanaID, S.AnnualIncome
FROM Credit c join  CarvanaAccount a 
on c.CreditID = a.CreditID
join personalityorfinancesurvey s
on a.CarvanaID = s.CarvanaID
order by 1,3;

--Query to see which cars are recommended to which customer.

SELECT a.CarvanaID "Carvana ID", a.LastName "Last Name", a.FirstName "First Name",
EXTRACT(YEAR FROM i.caryear)||' '||i.Make||' '||i.CarModel "Recommendation"
FROM CarvanaAccount a 
JOIN PersonalityOrFinanceSurvey s ON a.CarvanaID = s.CarvanaID
JOIN Recommendation r ON s.SurveyID = r.SurveyID
JOIN Recommendation_Inventory ri ON r.RecommendationID = ri.RecommendationID
JOIN Inventory i ON ri.StockNumber = i.StockNumber
ORDER BY 2;

--Query to see which customers are approved to purchase a vehicle based on credit

SELECT a.carvanaid, a.lastname, a.firstname,
    CASE WHEN (c.creditscore > 670) THEN 'Approved'
    ELSE 'Not Approved' END "CREDIT_CHECK"
FROM Credit c
JOIN CarvanaAccount a ON c.CreditID = a.CreditID
ORDER BY 4,2;


-- To see if there is a relationship between the address of a customer and drivetrain (awd, fwd, rwd)

SELECT a.carvanaid,a.address, i.drivertrain
from carvanaaccount a
join PersonalityOrFinanceSurvey s on a.CarvanaID = s.CarvanaID
JOIN Recommendation r ON s.SurveyID = r.SurveyID
JOIN Recommendation_Inventory ri ON r.RecommendationID = ri.RecommendationID
JOIN Inventory i ON ri.StockNumber = i.StockNumber
;

--To see if the personality traits of customer will affect their choice toward the make of car
Select s.PersonalityTraits, i.Make
from personalityorfinancesurvey s
JOIN Recommendation r ON s.SurveyID = r.SurveyID
JOIN Recommendation_Inventory ri ON r.RecommendationID = ri.RecommendationID
JOIN Inventory i ON ri.StockNumber = i.StockNumber
;



