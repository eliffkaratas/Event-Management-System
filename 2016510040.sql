﻿﻿﻿
Create table EVENT(
"eventID" serial NOT NULL,
"Category" varchar(10),
"Name" varchar(30),
"Address" varchar(50),
"Country" varchar(20),
"City" varchar(10),
"StartDate" date,
"EndDate" date,
"Price" int,
"Quota" int,
"Discount" int,
CONSTRAINT "pk_eventID" PRIMARY KEY("eventID")
);

Create table CATEGORY(
"categoryID" serial NOT NULL,
"Name" varchar(10),
CONSTRAINT "pk_categorytID" PRIMARY KEY("categoryID"),
CONSTRAINT "un_Name" UNIQUE("Name")
);

Create table ORGANIZATOR(
"organizatorID" serial NOT NULL,
"User_Name" varchar(20),
"Password" varchar(10),
CONSTRAINT "pk_organizatorID" PRIMARY KEY("organizatorID")
);

Create table ORGANIZATION_INFO(
"organization_infoID" serial NOT NULL,
"Name" varchar(20),
"Address" varchar(50),
"Charged_Personel" int,
"Contact_Info" varchar(30),
CONSTRAINT "pk_organization_infoID" PRIMARY KEY("organization_infoID")
);

Create table MEMBER(
"memberID" serial NOT NULL,
"Name" varchar(20),
"Surname" varchar(20),
"UserName" varchar(20),
"Password" varchar(10),
"Birthdate" date,
"Age" int,
"e-mail" varchar(30),
"MemberType" varchar(10),
CONSTRAINT "pk_memberID" PRIMARY KEY("memberID"),
CONSTRAINT "un_UserName" UNIQUE("UserName")
);

Create table INVOICE(
"invoiceID" serial NOT NULL,
"Event_Name" varchar(20),
"Event_Date" date,
"Location" varchar(20),
"Event_Payment" int,
CONSTRAINT "pk_invoiceID" PRIMARY KEY("invoiceID")
);

Create table EVENT_CATEGORY(
"categoryID" int NOT NULL,
"eventID" int NOT NULL,
CONSTRAINT "pks" PRIMARY KEY("eventID","categoryID"),
CONSTRAINT "for_key_eventID" FOREIGN KEY("eventID")
REFERENCES EVENT("eventID") match simple
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT "for_key_categoryID" FOREIGN KEY("categoryID")
REFERENCES CATEGORY("categoryID") match simple
ON UPDATE CASCADE ON DELETE CASCADE
);

Create table INVOICE_MEMBER(
"invoiceID" int NOT NULL,
"memberID" int NOT NULL,
CONSTRAINT "pkm" PRIMARY KEY("invoiceID","memberID"),
CONSTRAINT "for_key_invoiceID" FOREIGN KEY("invoiceID")
REFERENCES INVOICE("invoiceID") match simple
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT "for_key_memberID" FOREIGN KEY("memberID")
REFERENCES MEMBER("memberID") match simple
ON UPDATE CASCADE ON DELETE CASCADE
);

Create table EVENT_INVOICE(
"invoiceID" int NOT NULL,
"eventID" int NOT NULL,
CONSTRAINT "pki" PRIMARY KEY("invoiceID","eventID"),
CONSTRAINT "for_key_invoiceID" FOREIGN KEY("invoiceID")
REFERENCES INVOICE("invoiceID") match simple
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT "for_key_eventID" FOREIGN KEY("eventID")
REFERENCES EVENT("eventID") match simple
ON UPDATE CASCADE ON DELETE CASCADE
);

Create table MEMBER_EVENT(
"memberID" int NOT NULL,
"eventID" int NOT NULL,
CONSTRAINT "pkK" PRIMARY KEY("memberID","eventID"),
CONSTRAINT "for_key_memberID" FOREIGN KEY("memberID")
REFERENCES MEMBER("memberID") match simple
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT "for_key_eventID" FOREIGN KEY("eventID")
REFERENCES EVENT("eventID") match simple
ON UPDATE CASCADE ON DELETE CASCADE
);

Create table ORGANIZATOR_EVENT(
"organizatorID" int NOT NULL,
"eventID" int NOT NULL,
CONSTRAINT "pko" PRIMARY KEY("organizatorID","eventID"),
CONSTRAINT "for_key_organizatorID" FOREIGN KEY("organizatorID")
REFERENCES ORGANIZATOR("organizatorID") match simple
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT "for_key_eventID" FOREIGN KEY("eventID")
REFERENCES EVENT("eventID") match simple
ON UPDATE CASCADE ON DELETE CASCADE
);


INSERT INTO EVENT("Category","Name", "Address", "Country", "City", "StartDate", "EndDate", "Price", "Quota", "Discount")
VALUES ('Tiyatro', 'RomeoVeJuliet', 'AlsancakMah', 'Turkiye', 'Izmir', '01-02-2019', '14-02-2019', 40, 20, 10);
INSERT INTO EVENT("Category","Name", "Address", "Country", "City", "StartDate", "EndDate", "Price", "Quota", "Discount")
VALUES ('Tiyatro', 'RomeoVeJuliet', 'AlsancakMah', 'Turkiye', 'Izmir', '01-03-2019', '14-03-2019', 40, 20, 10);
INSERT INTO EVENT("Category","Name", "Address", "Country", "City", "StartDate", "EndDate", "Price", "Quota", "Discount")
VALUES ('Tiyatro', 'RomeoVeJuliet', 'KadikoyMah', 'Turkiye', 'Istanbul', '15-02-2019', '28-02-2019', 40, 20, 10);
INSERT INTO EVENT("Category","Name", "Address", "Country", "City", "StartDate", "EndDate", "Price", "Quota", "Discount")
VALUES ('Akademik', 'Seminer', 'Tinaztepe', 'Turkiye', 'Izmir', '10-10-2019', '13-10-2019', 5, 30, 0);
INSERT INTO EVENT("Category","Name", "Address", "Country", "City", "StartDate", "EndDate", "Price", "Quota", "Discount")
VALUES ('Akademik', 'Zakkum', 'Tinaztepe', 'Turkiye', 'Izmir', '19-05-2019', '19-05-2019', 0, 200, 0);
INSERT INTO EVENT("Category","Name", "Address", "Country", "City", "StartDate", "EndDate", "Price", "Quota", "Discount")
VALUES ('Sinema', 'Avengers', 'Mavisehir', 'Turkiye', 'Izmir', '26-04-2019', '26-05-2019', 30, 50, 0);
INSERT INTO EVENT("Category","Name", "Address", "Country", "City", "StartDate", "EndDate", "Price", "Quota", "Discount")
VALUES ('Konser', 'Rihanna', 'VodafonePark', 'Turkiye', 'Istanbul', '15-06-2019', '15-06-2019', 250, 100, 20);

INSERT INTO CATEGORY("Name")
VALUES ('Tiyatro');
INSERT INTO CATEGORY("Name")
VALUES ('Sinema');
INSERT INTO CATEGORY("Name")
VALUES ('Konser');
INSERT INTO CATEGORY("Name")
VALUES ('Akademik');

INSERT INTO ORGANIZATOR("User_Name", "Password")
VALUES ('İzmirTiyatrosu', '123');
INSERT INTO ORGANIZATOR("User_Name", "Password")
VALUES ('İstanbulTiyatrosu', '456');
INSERT INTO ORGANIZATOR("User_Name", "Password")
VALUES ('DokuzEylulUnv', '123');
INSERT INTO ORGANIZATOR("User_Name", "Password")
VALUES ('Cinemaximum', '123');
INSERT INTO ORGANIZATOR("User_Name", "Password")
VALUES ('VodafonePark', '123');

INSERT INTO ORGANIZATION_INFO("Name", "Address", "Charged_Personel", "Contact_Info")
VALUES ('İzmirTiyatrosu', 'AlsancakMah', 15, 'izmirtiyatrosu@hotmail.com');
INSERT INTO ORGANIZATION_INFO("Name", "Address", "Charged_Personel", "Contact_Info")
VALUES ('İstanbulTiyatrosu', 'KadikoyMah', 10, 'istanbultiyatrosu@hotmail.com');
INSERT INTO ORGANIZATION_INFO("Name", "Address", "Charged_Personel", "Contact_Info")
VALUES ('DokuzEylulUnv', 'Tinaztepe', 10, 'dokuzeylul@hotmail.com');
INSERT INTO ORGANIZATION_INFO("Name", "Address", "Charged_Personel", "Contact_Info")
VALUES ('Cinemaximum', 'Mavisehir', 10, 'cinemaximum@hotmail.com');
INSERT INTO ORGANIZATION_INFO("Name", "Address", "Charged_Personel", "Contact_Info")
VALUES ('VodafonePark', 'VodafonePark', 40, 'vodafonepark@hotmail.com');

INSERT INTO MEMBER("Name", "Surname", "UserName", "Password", "Birthdate", "e-mail", "Age", "MemberType")
VALUES ('Elif', 'Karatas', 'elifkaratas', '123', '23-09-1997', 'elif.karatas@ceng.deu.edu.tr', 22, 'standard');
INSERT INTO MEMBER("Name", "Surname", "UserName", "Password", "Birthdate", "e-mail", "Age", "MemberType")
VALUES ('Thalia', 'Simone', 'thaliasimone', '123', '08-05-1998', 'thaliasimone@hotmail.com', 21, 'standard');
INSERT INTO MEMBER("Name", "Surname", "UserName", "Password", "Birthdate", "e-mail", "Age", "MemberType")
VALUES ('Sarah', 'Parker', 'sarahparker', '123', '01-01-1980', 'sarahparker@hotmail.com', 39, 'standard');
INSERT INTO MEMBER("Name", "Surname", "UserName", "Password", "Birthdate", "e-mail", "Age", "MemberType")
VALUES ('Emily', 'Brown', 'emilybrown', '123', '01-01-1990', 'emilybrown@hotmail.com', 29, 'standard');
INSERT INTO MEMBER("Name", "Surname", "UserName", "Password", "Birthdate", "e-mail", "Age", "MemberType")
VALUES ('Nick', 'Miles', 'nickmiles', '123', '01-01-1994', 'nickmiles@hotmail.com', 25, 'standard');

INSERT INTO INVOICE("Event_Name", "Event_Date", "Location", "Event_Payment")
VALUES ('RomeoVeJuliet', '14-02-2019', 'Izmir', 40);
INSERT INTO INVOICE("Event_Name", "Event_Date", "Location", "Event_Payment")
VALUES ('RomeoVeJuliet', '15-02-2019', 'Istanbul', 40);
INSERT INTO INVOICE("Event_Name", "Event_Date", "Location", "Event_Payment")
VALUES ('Avengers', '26-04-2019', 'Izmir', 30);


/* *********Sentetik tablolarin ortak idsi oldugunu dusunerek islemleri yaptim. Ornegin
Memberlarin eklendigi siradaki event ve invoicelara katiliyorlar. Ilk haliyle su an sadece Izmir ve Istanbuldaki
RomeoVeJuliet oyununa ve Izmirdeki Avengers sinemasina katilim gerceklesiyor. Daha fazla eklenebilir.********** */

/*TUM TABLOLARIN LISTELEMELERI*/
SELECT *
FROM EVENT;

SELECT *
FROM CATEGORY;

SELECT *
FROM ORGANIZATOR;

SELECT *
FROM ORGANIZATION_INFO;

SELECT *
FROM MEMBER;

/*1. ISLEM*/
SELECT *
FROM EVENT
WHERE EVENT."City"='Izmir';

/*2. ISLEM*/
SELECT EVENT."Name" AS EventName, EVENT."Category" AS Category, ORGANIZATION_INFO."Name" AS OrganizatorName, MAX("Quota") AS HighestAttendees, SUM("Price"*"Quota") AS TotalObtainedRevenue
FROM ORGANIZATION_INFO
INNER JOIN  EVENT ON EVENT."Address"=ORGANIZATION_INFO."Address"
GROUP BY EventName, Category, OrganizatorName
ORDER BY TotalObtainedRevenue DESC;

/*3. ISLEM*/
SELECT CATEGORY."Name", COUNT("Category")
FROM CATEGORY
INNER JOIN EVENT ON CATEGORY."Name"=EVENT."Category"
GROUP BY CATEGORY."Name";

/*4. ISLEM*/
SELECT INVOICE."Event_Name" AS Event, MEMBER."Age" AS Age
FROM INVOICE
INNER JOIN MEMBER ON INVOICE."invoiceID"=MEMBER."memberID"
GROUP BY Event, Age HAVING "Age" BETWEEN 18 AND 25
ORDER BY Age;

/*5. ISLEM*/
SELECT INVOICE."Event_Name" AS Event, COUNT("memberID")
FROM INVOICE
INNER JOIN MEMBER ON INVOICE."invoiceID"=MEMBER."memberID"
GROUP BY Event HAVING COUNT("memberID")<3;

/*6. ISLEM*/
SELECT INVOICE."invoiceID", MEMBER."memberID", MEMBER."Name", INVOICE."Event_Name"
FROM INVOICE
INNER JOIN MEMBER ON MEMBER."memberID"=INVOICE."invoiceID"
GROUP BY MEMBER."Name", MEMBER."memberID", INVOICE."invoiceID" HAVING COUNT("Event_Name")>=3;

UPDATE MEMBER SET "MemberType"='gold' WHERE "MemberType"='standard';

/*UPDATE MEMBER SET "MemberType"='gold' WHERE "MemberType"='standard' FROM MEMBER, INVOICE_MEMBER WHERE INVOICE_MEMBER."memberID"=MEMBER."memberID" AND HAVING COUNT("memberID")>=3;*/

/*7. ISLEM*/
DELETE FROM EVENT
 WHERE EVENT."Category" IN
 (
 SELECT EVENT."Category"
 FROM EVENT
  WHERE EVENT."Category"='Akademik' AND EVENT."StartDate"=date('19-05-2019')
 );

/*8. ISLEM*/
SELECT MEMBER."e-mail", SUM(INVOICE."Event_Payment") AS Paid
FROM MEMBER
INNER JOIN INVOICE ON INVOICE."invoiceID"=MEMBER."memberID"
GROUP BY MEMBER."e-mail"
ORDER BY Paid DESC;

/*9. ISLEM*/
UPDATE EVENT SET "Discount"=25 WHERE "Name"='İ*';
SELECT "Discount", "Name" FROM EVENT;

/*10. ISLEM*/
DELETE FROM MEMBER
 WHERE MEMBER."memberID" IN
 (
 SELECT INVOICE."invoiceID"
 FROM INVOICE
  WHERE MEMBER."memberID"!=INVOICE."invoiceID"
 );

/*GOLD UYELERIN INDIRIMI*/
UPDATE INVOICE SET "Event_Payment"=(EVENT."Price" - EVENT."Discount") FROM EVENT, MEMBER WHERE MEMBER."MemberType"='gold';