-- DDL ¼±¾ð
SELECT 'DROP TABLE "' || TABLE_NAME || '" CASCADE CONSTRAINTS;' FROM user_tables;

CREATE TABLE Admin (
	Admin_seq	Number	NOT NULL,
	Admin_name	Varchar2(30)	NULL,
	Admin_id	Varchar2(30)	NULL,
	Admin_pw	Varchar2(30)	NULL
);

CREATE TABLE Owner (
	Owner_seq	Number	NOT NULL,
	Business_seq	Number	NOT NULL,
	Owner_name	Varchar2(30)	NULL,
	Owner_id	Varchar2(30)	NULL,
	Owner_pw	Varchar2(30)	NULL
);

CREATE TABLE Users (
	User_seq	Number	NOT NULL,
	User_name	varchar2(30)	NULL,
	User_ssn	varchar2(30)	NULL,
	User_id	varchar2(30)	NULL,
	User_pw	varchar2(30)	NULL,
	User_nickname	varchar2(30)	NULL,
	User_money	Number	NULL,
	User_mileage	Number	NULL
);

CREATE TABLE Business (
	Business_seq	Number	NOT NULL,
	Business_kind	Varchar2(30)	NULL,
	Business_name	Varchar2(100)	NULL,
	Buisiness_address	Varchar2(100)	NULL
);

CREATE TABLE Tour_area (
	Tour_area_seq	Number	NOT NULL,
	Tour_area_name	Varchar2(50)	NULL,
	Tour_area_address	varchar2(100)	NULL
);

CREATE TABLE Reservation (
	Reservation_seq	Number	NOT NULL,
	User_seq	Number	NOT NULL,
	Business_seq	Number	NOT NULL,
	Reservation_begin	Date	NULL,
	Reservation_end	Date	NULL
);

CREATE TABLE Review (
	Review_seq	Number	NOT NULL,
	User_seq	Number	NOT NULL,
	Business_seq	Number	NOT NULL,
	Tour_area_seq	Number	NOT NULL,
	Review_content	varchar2(4000)	NULL,
	Review_open	Number	NULL
);

CREATE TABLE Notice (
	Notice_seq	Number	NOT NULL,
	Business_seq	Number	NOT NULL,
	Tour_area_seq	Number	NOT NULL,
	Notice_content	Varchar2(4000)	NULL
);

CREATE TABLE Payment (
	Payment_seq	Number	NOT NULL,
	User_seq	Number	NOT NULL,
	Reservation_seq	Number	NOT NULL,
    Rentcar_reservation_seq Number NOT NULL,
	Business_seq	Number	NOT NULL,
	Payment_price	Number	NULL,
	Payment_date	Date	NULL,
	Payment_mileage	Number	NULL
);

CREATE TABLE Charge_record (
	Charge_record_seq	Number	NOT NULL,
	User_seq	Number	NOT NULL,
	Charge_amount	Number	NULL,
	Charge_date	Date	NULL
);

CREATE TABLE Question (
	Question_seq	Number	NOT NULL,
	User_seq	Number	NOT NULL,
	Question_kind_seq	Number	NOT NULL,
	Question_content	varchar2(4000)	NULL
);

CREATE TABLE Question_reply (
	Question_reply_seq	Number	NOT NULL,
	Question_seq	Number	NOT NULL,
	Admin_seq	Number	NOT NULL,
	Question_kind_seq	Number	NOT NULL,
	Question_reply_content	varchar2(4000)	NULL
);

CREATE TABLE Review_reply (
	Review_reply_seq	Number	NOT NULL,
	Review_seq	Number	NOT NULL,
	Review_reply_detail	varchar2(4000)	NULL
);

CREATE TABLE Oil_bank (
	Oil_bank_seq	Number	NOT NULL,
	Oil_bank_name	varchar2(60)	NULL,
	Oil_bank_address	varchar2(100)	NULL
);

CREATE TABLE Electronic_charge (
	Electronic_charge_seq	Number	NOT NULL,
	Electronic_charge_name	varchar2(60)	NULL,
	Electronic_charge_address	varchar2(100)	NULL
);

CREATE TABLE Advertisement (
	Ad_seq	Number NOT NULL,
	Business_seq	Number REFERENCES Business(Business_seq) NOT NULL,
	Owner_seq	Number REFERENCES Owner(owner_seq) NOT NULL,
	Ad_content	Varchar2(4000)	NULL
);

CREATE TABLE Rentcar (
	Rentcar_seq	Number	NOT NULL,
	Business_seq	Number	NOT NULL,
	Car_kind	Varchar2(50)	NULL
);

CREATE TABLE Rentcar_reservation (
	Rentcar_reservation_seq	Number	NOT NULL,
	User_seq	Number	NOT NULL,
	Business_seq	Number	NOT NULL,
	Rentcar_seq	Number	NOT NULL,
	Reservation_begin	Date	NULL,
	Reservation_end	Date	NULL
);

CREATE TABLE Tour (
	Tour_seq	Number	NOT NULL,
	Tour_name	varchar2(50)	NULL,
	Tour_date	Date	NULL,
	Tour_content	varchar2(4000)	NULL
);

CREATE TABLE Scheduler (
	Scheduler_seq	Number	NOT NULL,
	User_seq	Number	NOT NULL,
	Scheduler_date	Date	NULL,
	Scheduler_content	varchar2(4000)	NULL
);

CREATE TABLE Bookmark (
	Bookmark_seq	Number	NOT NULL,
	User_seq	Number	NOT NULL,
	Bookmark_name	varchar2(50)	NULL
);

CREATE TABLE Question_kind (
	Question_kind_seq	Number	NOT NULL,
	Question_name	varchar2(50)	NULL
);

ALTER TABLE Admin ADD CONSTRAINT PK_ADMIN PRIMARY KEY (
	Admin_seq
);

ALTER TABLE Owner ADD CONSTRAINT PK_OWNER PRIMARY KEY (
	Owner_seq,
	Business_seq
);

ALTER TABLE Users ADD CONSTRAINT PK_USERS PRIMARY KEY (
	User_seq
);

ALTER TABLE Business ADD CONSTRAINT PK_BUSINESS PRIMARY KEY (
	Business_seq
);

ALTER TABLE Tour_area ADD CONSTRAINT PK_TOUR_AREA PRIMARY KEY (
	Tour_area_seq
);

ALTER TABLE Reservation ADD CONSTRAINT PK_RESERVATION PRIMARY KEY (
	Reservation_seq,
	User_seq,
	Business_seq
);

ALTER TABLE Review ADD CONSTRAINT PK_REVIEW PRIMARY KEY (
	Review_seq,
	User_seq,
	Business_seq,
	Tour_area_seq
);

ALTER TABLE Notice ADD CONSTRAINT PK_NOTICE PRIMARY KEY (
	Notice_seq,
	Business_seq,
	Tour_area_seq
);

ALTER TABLE Payment ADD CONSTRAINT PK_PAYMENT PRIMARY KEY (
	Payment_seq,
	User_seq,
	Reservation_seq,
	Business_seq
);

ALTER TABLE Charge_record ADD CONSTRAINT PK_CHARGE_RECORD PRIMARY KEY (
	Charge_record_seq,
	User_seq
);

ALTER TABLE Question ADD CONSTRAINT PK_QUESTION PRIMARY KEY (
	Question_seq,
	User_seq,
	Question_kind_seq
);

ALTER TABLE Question_reply ADD CONSTRAINT PK_QUESTION_REPLY PRIMARY KEY (
	Question_reply_seq,
	Question_seq,
	Admin_seq,
	Question_kind_seq
);

ALTER TABLE Review_reply ADD CONSTRAINT PK_REVIEW_REPLY PRIMARY KEY (
	Review_reply_seq,
	Review_seq
);

ALTER TABLE Oil_bank ADD CONSTRAINT PK_OIL_BANK PRIMARY KEY (
	Oil_bank_seq
);

ALTER TABLE Electronic_charge ADD CONSTRAINT PK_ELECTRONIC_CHARGE PRIMARY KEY (
	Electronic_charge_seq
);

ALTER TABLE Advertisement ADD CONSTRAINT PK_ADVERTISEMENT PRIMARY KEY (
	Ad_seq,
	Business_seq
);

ALTER TABLE Rentcar ADD CONSTRAINT PK_RENTCAR PRIMARY KEY (
	Rentcar_seq,
	Business_seq
);

ALTER TABLE Rentcar_reservation ADD CONSTRAINT PK_RENTCAR_RESERVATION PRIMARY KEY (
	Rentcar_reservation_seq,
	User_seq,
	Business_seq,
	Rentcar_seq
);

ALTER TABLE Tour ADD CONSTRAINT PK_TOUR PRIMARY KEY (
	Tour_seq
);

ALTER TABLE Scheduler ADD CONSTRAINT PK_SCHEDULER PRIMARY KEY (
	Scheduler_seq,
	User_seq
);

ALTER TABLE Bookmark ADD CONSTRAINT PK_BOOKMARK PRIMARY KEY (
	Bookmark_seq,
	User_seq
);

ALTER TABLE Question_kind ADD CONSTRAINT PK_QUESTION_KIND PRIMARY KEY (
	Question_kind_seq
);

ALTER TABLE Owner ADD CONSTRAINT FK_Business_TO_Owner_1 FOREIGN KEY (
	Business_seq
)
REFERENCES Business (
	Business_seq
);

ALTER TABLE Reservation ADD CONSTRAINT FK_Users_TO_Reservation_1 FOREIGN KEY (
	User_seq
)
REFERENCES Users (
	User_seq
);

ALTER TABLE Reservation ADD CONSTRAINT FK_Business_TO_Reservation_1 FOREIGN KEY (
	Business_seq
)
REFERENCES Business (
	Business_seq
);

ALTER TABLE Review ADD CONSTRAINT FK_Users_TO_Review_1 FOREIGN KEY (
	User_seq
)
REFERENCES Users (
	User_seq
);

ALTER TABLE Review ADD CONSTRAINT FK_Business_TO_Review_1 FOREIGN KEY (
	Business_seq
)
REFERENCES Business (
	Business_seq
);

ALTER TABLE Review ADD CONSTRAINT FK_Tour_area_TO_Review_1 FOREIGN KEY (
	Tour_area_seq
)
REFERENCES Tour_area (
	Tour_area_seq
);

ALTER TABLE Notice ADD CONSTRAINT FK_Business_TO_Notice_1 FOREIGN KEY (
	Business_seq
)
REFERENCES Business (
	Business_seq
);

ALTER TABLE Notice ADD CONSTRAINT FK_Tour_area_TO_Notice_1 FOREIGN KEY (
	Tour_area_seq
)
REFERENCES Tour_area (
	Tour_area_seq
);

ALTER TABLE Payment ADD CONSTRAINT FK_Users_TO_Payment_1 FOREIGN KEY (
	User_seq
)
REFERENCES Users (
	User_seq
);

----------------------------------------
ALTER TABLE Payment ADD CONSTRAINT FK_Reservation_TO_Payment_1 FOREIGN KEY (
	Reservation_seq
)
REFERENCES Reservation (
	Reservation_seq
);
--------------------------------------------
ALTER TABLE Payment ADD CONSTRAINT FK_Business_TO_Payment_1 FOREIGN KEY (
	Business_seq
)
REFERENCES Business (
	Business_seq
);

ALTER TABLE Charge_record ADD CONSTRAINT FK_Users_TO_Charge_record_1 FOREIGN KEY (
	User_seq
)
REFERENCES Users (
	User_seq
);

ALTER TABLE Question ADD CONSTRAINT FK_Users_TO_Question_1 FOREIGN KEY (
	User_seq
)
REFERENCES Users (
	User_seq
);

ALTER TABLE Question ADD CONSTRAINT FK_Question_kind_TO_Question_1 FOREIGN KEY (
	Question_kind_seq
)
REFERENCES Question_kind (
	Question_kind_seq
);
---------------------------------------------------------------------------------------
ALTER TABLE Question_reply ADD CONSTRAINT FK_Question_TO_reply_1 FOREIGN KEY (
	Question_seq
)
REFERENCES Question (
	Question_seq
);

ALTER TABLE Question_reply ADD CONSTRAINT FK_Question_TO_reply_2 FOREIGN KEY (
	Question_kind_seq
)
REFERENCES Question (
	Question_kind_seq
);
----------------------------------------------------------------------------------------------------
ALTER TABLE Question_reply ADD CONSTRAINT FK_Admin_TO_Question_reply_1 FOREIGN KEY (
	Admin_seq
)
REFERENCES Admin (
	Admin_seq
);
----------------------------------------------------------------------------------------------
ALTER TABLE Review_reply ADD CONSTRAINT FK_Review_TO_Review_reply_1 FOREIGN KEY (
	Review_seq
)
REFERENCES Review (
	Review_seq
);
------------------------------------------------------------------------------------------------
ALTER TABLE Advertisement ADD CONSTRAINT FK_Business_TO_Advertisement_1 FOREIGN KEY (
	Business_seq
)
REFERENCES Business (
	Business_seq
);

ALTER TABLE Rentcar ADD CONSTRAINT FK_Business_TO_Rentcar_1 FOREIGN KEY (
	Business_seq
)
REFERENCES Business (
	Business_seq
);

ALTER TABLE Rentcar_reservation ADD CONSTRAINT FK_Users_TO_Rentcar_1 FOREIGN KEY (
	User_seq
)
REFERENCES Users (
	User_seq
);

ALTER TABLE Rentcar_reservation ADD CONSTRAINT FK_Business_TO_Rentcar_1 FOREIGN KEY (
	Business_seq
)
REFERENCES Business (
	Business_seq
);
---------------------------------------------------------------------
ALTER TABLE Rentcar_reservation ADD CONSTRAINT FK_Rentcar_TO_Rentcar_1 FOREIGN KEY (
	Rentcar_seq
)
REFERENCES Rentcar (
	Rentcar_seq
);
-------------------------------------------------------------------------
ALTER TABLE Scheduler ADD CONSTRAINT FK_Users_TO_Scheduler_1 FOREIGN KEY (
	User_seq
)
REFERENCES Users (
	User_seq
);

ALTER TABLE Bookmark ADD CONSTRAINT FK_Users_TO_Bookmark_1 FOREIGN KEY (
	User_seq
)
REFERENCES Users (
	User_seq
);

--****************************************************************************************************
create table Accommodate (
    Accommodate_seq number primary key,
    Business_seq number references Business(Business_seq) not null,
    Accommodate_kind varchar2(15) not null,
    Accommodate_price number not null
);

select * from owner;
alter table owner drop column business_seq;

select * from business;
alter table business ADD Owner_seq references Owner(Owner_seq) not null;

CREATE TABLE Notice (
	Notice_seq	Number NOT NULL,
    Admin_seq number references Admin(Admin_seq) not null,
    Notice_title Varchar2(500) NULL,
	Notice_content Varchar2(4000)	NULL
);

CREATE TABLE Tour (
	Tour_seq 	Number NOT NULL,
	Tour_name	varchar2(50)	NULL,
	Tour_startdate	Date	NULL,
	Tour_enddate	Date	NULL,
	Tour_content	varchar2(4000)	NULL
);

drop table Payment;

CREATE TABLE Payment (
    Payment_seq   Number primary key,
    User_seq   Number References Users(User_seq) NOT NULL,
    Reservation_seq   Number References Reservation(Reservation_seq),
    Rentcar_reservation_seq Number References Rentcar_reservation(Rentcar_reservation_seq),
    Business_seq   Number References Business(Business_seq),
    Payment_price   Number   NULL,
    Payment_date   Date   NULL,
    Payment_mileage   Number   NULL
);

-----------------------------------------------------------------------------------------------------------------------
ALTER TABLE Rentcar ADD rentcar_price Number;
select * from Rentcar;

-----------------------------------------------------------------------------------------------------------------------
CREATE TABLE Activity (
    Activity_seq NUMBER PRIMARY KEY,
    Business_seq NUMBER REFERENCES Business(Business_seq),
    Activity_price NUMBER 
);


