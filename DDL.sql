DROP DATABASE IF EXISTS qodingchallenge;

CREATE DATABASE qodingchallenge;

USE qodingchallenge;

create table CAMPAIGN
(
   NAME                 varchar(255) not null,
   CATEGORY_NAME        varchar(255) not null,
   CAMPAIGN_TYPE        varchar(255) not null,
   USERNAME             varchar(255) not null,
   AMOUNT_OF_QUESTIONS  smallint not null,
   TIMELIMIT            smallint,
   STATE                bool not null,
   primary key (NAME)
);

create table CAMPAIGN_CONTAINS_QUESTIONS
(
   NAME                 varchar(255) not null,
   QUESTIONID           smallint not null,
   primary key (NAME, QUESTIONID)
);

create table CAMPAIGN_TYPE
(
   CAMPAIGN_TYPE        varchar(255) not null,
   primary key (CAMPAIGN_TYPE)
);

create table CATEGORY
(
   CATEGORY_NAME        varchar(255) not null,
   primary key (CATEGORY_NAME)
);

create table CONFERENCE
(
   PARTICIPANTID        smallint not null,
   FIRSTNAME            varchar(255) not null,
   INSERTION            varchar(20),
   LASTNAME             varchar(255) not null,
   EMAIL                varchar(255),
   PHONENUMBER          bigint,
   primary key (PARTICIPANTID)
);

create table EMPLOYEE
(
   USERNAME             varchar(255) not null,
   PASSWORD             varchar(300) not null,
   primary key (USERNAME)
);

create table GIVEN_ANSWER
(
   QUESTIONID           smallint not null,
   PARTICIPANTID        smallint not null,
   NAME                 varchar(255) not null,
   STATEID              smallint not null,
   GIVEN_ANSWER         varchar(1024) not null,
   primary key (QUESTIONID, PARTICIPANTID, NAME)
);

create table KNOWLEDGE_SESSION
(
   PARTICIPANTID        smallint not null,
   NICKNAME             varchar(255) not null,
   primary key (PARTICIPANTID)
);

create table MULTIPLE_CHOICE_QUESTION
(
   QUESTIONID           smallint not null,
   ANSWER_OPTIONS       varchar(255) not null,
   IS_CORRECT           bool not null,
   primary key (QUESTIONID, ANSWER_OPTIONS)
);

create table PARTICIPANT
(
   PARTICIPANTID        smallint not null AUTO_INCREMENT,
   primary key (PARTICIPANTID)
);

create table PARTICIPANT_OF_CAMPAIGN
(
   PARTICIPANTID        smallint not null,
   NAME                 varchar(255) not null,
   TIME_STARTED         timestamp not null default now(),
   primary key (PARTICIPANTID, NAME)
);

create table PROGRAMMING_QUESTION
(
   QUESTIONID           smallint not null,
   STARTCODE            varchar(1024),
   primary key (QUESTIONID)
);

create table QUESTION
(
   QUESTIONID           smallint not null AUTO_INCREMENT,
   CATEGORY_NAME        varchar(255) not null,
   QUESTION             varchar(255) not null,
   STATE                bool not null default 1,
   QUESTION_TYPE        varchar(255),
   ATTACHMENT           varchar(4096),
   primary key (QUESTIONID)
);

create table STATE
(
   STATEID              smallint not null,
   STATE_NAME           varchar(50) not null,
   primary key (STATEID)
);

create table TMP_MULTIPLE_CHOICE_QUESTION
(
   QUESTIONID           smallint not null,
   ANSWER_OPTIONS       varchar(255) not null,
   IS_CORRECT           bool not null,
   primary key (QUESTIONID, ANSWER_OPTIONS)
);

alter table CAMPAIGN add constraint FK_CAMPAIGN_TYPE_OF_CAMPAIGN foreign key (CAMPAIGN_TYPE)
      references CAMPAIGN_TYPE (CAMPAIGN_TYPE) on delete restrict on update restrict;

alter table CAMPAIGN add constraint FK_CATEGORY_OF_CAMPAIGN foreign key (CATEGORY_NAME)
      references CATEGORY (CATEGORY_NAME) on delete restrict on update restrict;

alter table CAMPAIGN add constraint FK_EMPLOYEE_CREATED_CAMPAIGN foreign key (USERNAME)
      references EMPLOYEE (USERNAME) on delete restrict on update restrict;

alter table CAMPAIGN_CONTAINS_QUESTIONS add constraint FK_CAMPAIGN_CONTAINS_QUESTIONS foreign key (NAME)
      references CAMPAIGN (NAME) on delete restrict on update restrict;

alter table CAMPAIGN_CONTAINS_QUESTIONS add constraint FK_CAMPAIGN_CONTAINS_QUESTIONS2 foreign key (QUESTIONID)
      references QUESTION (QUESTIONID) on delete restrict on update restrict;

alter table CONFERENCE add constraint FK_TYPE_OF_PARTICIPANT2 foreign key (PARTICIPANTID)
      references PARTICIPANT (PARTICIPANTID) on delete restrict on update restrict;

alter table GIVEN_ANSWER add constraint FK_GIVEN_ANSWER foreign key (QUESTIONID)
      references QUESTION (QUESTIONID) on delete restrict on update restrict;

alter table GIVEN_ANSWER add constraint FK_GIVEN_ANSWER2 foreign key (PARTICIPANTID)
      references PARTICIPANT (PARTICIPANTID) on delete restrict on update restrict;

alter table GIVEN_ANSWER add constraint FK_GIVEN_ANSWER3 foreign key (NAME)
      references CAMPAIGN (NAME) on delete restrict on update restrict;

alter table GIVEN_ANSWER add constraint FK_GIVEN_ANSWER5 foreign key (STATEID)
      references STATE (STATEID) on delete restrict on update restrict;

alter table KNOWLEDGE_SESSION add constraint FK_TYPE_OF_PARTICIPANT foreign key (PARTICIPANTID)
      references PARTICIPANT (PARTICIPANTID) on delete restrict on update restrict;

alter table MULTIPLE_CHOICE_QUESTION add constraint FK_TYPE_OF_QUESTION foreign key (QUESTIONID)
      references QUESTION (QUESTIONID) on delete restrict on update restrict;

alter table PARTICIPANT_OF_CAMPAIGN add constraint FK_PARTICIPANT_OF_CAMPAIGN foreign key (PARTICIPANTID)
      references PARTICIPANT (PARTICIPANTID) on delete restrict on update restrict;

alter table PARTICIPANT_OF_CAMPAIGN add constraint FK_PARTICIPANT_OF_CAMPAIGN2 foreign key (NAME)
      references CAMPAIGN (NAME) on delete restrict on update restrict;

alter table PROGRAMMING_QUESTION add constraint FK_TYPE_OF_QUESTION3 foreign key (QUESTIONID)
      references QUESTION (QUESTIONID) on delete restrict on update restrict;

alter table QUESTION add constraint FK_CATEGORY_OF_QUESTION foreign key (CATEGORY_NAME)
      references CATEGORY (CATEGORY_NAME) on delete restrict on update restrict;

alter table conference add constraint CHK_PHONE_EMAIL CHECK ((email IS NOT NULL) OR (phonenumber IS NOT NULL));

alter table campaign add constraint CHK_CAMPAIGN_TIMELIMIT CHECK ((TIMELIMIT is null) OR (TIMELIMIT > 0));