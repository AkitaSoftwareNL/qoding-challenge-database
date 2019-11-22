DROP DATABASE IF EXISTS qodingchallenge;

CREATE DATABASE qodingchallenge;

USE qodingchallenge;

drop table if exists CAMPAIGN;

drop table if exists CAMPAIGN_CONTAINS_QUESTIONS;

drop table if exists CAMPAIGN_TYPE;

drop table if exists CATEGORY;

drop table if exists CONFERENCE;

drop table if exists EMPLOYEE;

drop table if exists GIVEN_ANSWER;

drop table if exists KNOWLEDGE_SESSION;

drop table if exists MULTIPLE_CHOICE_QUESTION;

drop table if exists OPEN_QUESTION;

drop table if exists PARTICIPANT;

drop table if exists PARTICIPANT_OF_CAMPAIGN;

drop table if exists PROGRAMMING_QUESTION;

drop table if exists QUESTION;

drop table if exists STATE;

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

create table OPEN_QUESTION
(
   QUESTIONID           smallint not null,
   primary key (QUESTIONID)
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
   QUESTIONID           smallint not null,
   CATEGORY_NAME        varchar(255) not null,
   QUESTION             varchar(255) not null,
   STATE                bool not null,
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

alter table OPEN_QUESTION add constraint FK_TYPE_OF_QUESTION2 foreign key (QUESTIONID)
      references QUESTION (QUESTIONID) on delete restrict on update restrict;

alter table PARTICIPANT_OF_CAMPAIGN add constraint FK_PARTICIPANT_OF_CAMPAIGN foreign key (PARTICIPANTID)
      references PARTICIPANT (PARTICIPANTID) on delete restrict on update restrict;

alter table PARTICIPANT_OF_CAMPAIGN add constraint FK_PARTICIPANT_OF_CAMPAIGN2 foreign key (NAME)
      references CAMPAIGN (NAME) on delete restrict on update restrict;

alter table PROGRAMMING_QUESTION add constraint FK_TYPE_OF_QUESTION3 foreign key (QUESTIONID)
      references QUESTION (QUESTIONID) on delete restrict on update restrict;

alter table QUESTION add constraint FK_CATEGORY_OF_QUESTION foreign key (CATEGORY_NAME)
      references CATEGORY (CATEGORY_NAME) on delete restrict on update restrict;

alter table conference add constraint CHK_PHONE_EMAIL CHECK ((email IS NOT NULL) ||(phonenumber IS NOT NULL));

alter table campaign add constraint CHK_CAMPAIGN_TIMELIMIT CHECK ((TIMELIMIT is null) || (TIMELIMIT > 0));

/*CREATE trigger TR_participant_in_knowledge_session
before insert
on
participant_of_campaign
for each row
Begin
    if ((select campaign.CAMPAIGN_TYPE from campaign where campaign.NAME = NEW.NAME) != 'conferentie') THEN
        if((select count(*) from knowledge_session where knowledge_session.PARTICIPANTID = NEW.PARTICIPANTID) = 0) Then
            signal sqlstate '45000' set message_text = 'no nickname available for user of knowledge session';
        end if;
    end if;
end;

CREATE PROCEDURE SP_multiplechoice_answers (IN question_id INT)
BEGIN

    IF ((SELECT COUNT(*) FROM tmp_multiple_choice_question where QUESTIONID = question_id) < 2) THEN
        DELETE FROM tmp_multiple_choice_question where QUESTIONID = question_id;
        signal sqlstate '45000' set message_text = 'A multiple choice question must have two or more answers';
    end if;

    IF((SELECT count(*) from tmp_multiple_choice_question where QUESTIONID = question_id AND IS_CORRECT = 1) != 1) THEN
        DELETE FROM tmp_multiple_choice_question where QUESTIONID = question_id;
        signal sqlstate '45000' set message_text = 'There cannot be more or less then one correct answer';
    end if;

    INSERT INTO multiple_choice_question
    SELECT * FROM tmp_multiple_choice_question
    where QUESTIONID = question_id;

    DELETE FROM tmp_multiple_choice_question where QUESTIONID = question_id;
END;*/

insert into employee (username, password) values ('admin', 'password123');
insert into employee (username, password) values ('hcollerd1', 'mbownde1');
insert into employee (username, password) values ('apudney2', 'mwissby2');
insert into employee (username, password) values ('brubinsohn3', 'hfriett3');
insert into employee (username, password) values ('zpoole4', 'mhatchell4');

insert into category (category_name) values ('JAVA');
insert into category (category_name) values ('.NET');
insert into category (category_name) values ('Python');

insert into campaign_type (CAMPAIGN_TYPE) values ('conferentie');
insert into CAMPAIGN_TYPE (CAMPAIGN_TYPE) values ('kennissessie');

insert into campaign (name, category_name, CAMPAIGN_TYPE, username, amount_of_questions, timelimit, state) values ('HC2 Holdings, Inc.', 'JAVA', 'conferentie', 'admin', 1, 1, true);
insert into campaign (name, category_name, CAMPAIGN_TYPE, username, amount_of_questions, timelimit, state) values ('Syros Pharmaceuticals, Inc.','.NET', 'conferentie','hcollerd1', 2, 2, true);
insert into campaign (name, category_name, CAMPAIGN_TYPE, username, amount_of_questions, timelimit, state) values ('Principal U.S. Small Cap Index ETF', 'Python', 'conferentie','apudney2',  3, 3, false);

insert into question (questionID, category_name, question, state, QUESTION_TYPE) values (1, 'JAVA', 'Wat is de output van het draaien van de main methode in klasse B voor de volgende code', 1, 'open');
insert into question (questionID, category_name, question, state, QUESTION_TYPE) values (2, 'JAVA', 'Juist of onjuist, er bestaat ter allen tijd een instantie van de class singelton. Licht je antwoord toe', 1, 'open');
insert into question (questionID, category_name, question, state, QUESTION_TYPE) values (3, 'JAVA', 'Kan je meerdere catch statements gebruiken voor EEN try', 1, 'multiple');
insert into question (questionID, category_name, question, state, QUESTION_TYPE) values (4, 'JAVA', 'Wat is dependency injection', 1, 'open');
insert into question (questionID, category_name, question, state, QUESTION_TYPE) values (5, 'JAVA', 'Welke methode moet je ook omschrijven als je de equals() methode overschrijft', 1, 'open');
insert into question (questionID, category_name, question, state, QUESTION_TYPE, ATTACHEMENT) values (6, 'JAVA', 'Welke methodes moeten geimplenmenteerd worden door een klasse die de volgende interfaces implenmenterd', 1, 'multiple', 'interface first{void() method() throws IOException} interface first{void() method() throws IOException}');
insert into question (questionID, category_name, question, state, QUESTION_TYPE) values (7, 'JAVA', 'In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas.', 1, 'open');
insert into question (questionID, category_name, question, state, QUESTION_TYPE) values (8, 'JAVA', 'dictum eleifend, nunc risus varius orci, in consequat enim diam', 1, 'open');
insert into question (questionID, category_name, question, state, QUESTION_TYPE) values (9, 'JAVA', 'euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas', 1, 'open');
insert into question (questionID, category_name, question, state, QUESTION_TYPE) values (10, 'JAVA', 'gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet', 1, 'open');
insert into question (questionID, category_name, question, state, QUESTION_TYPE) values (11, 'JAVA', 'gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet', 1, 'open');
insert into question (questionID, category_name, question, state, QUESTION_TYPE) values (12, 'JAVA', 'gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet', 1, 'multiple');


insert into multiple_choice_question (questionID, ANSWER_OPTIONS, is_correct) values (3, 'Ja', 1);
insert into multiple_choice_question (questionID, ANSWER_OPTIONS, is_correct) values (3, 'Nee', 0);

insert into multiple_choice_question (questionID, ANSWER_OPTIONS, is_correct) values (6, 'Beide', 1);
insert into multiple_choice_question (questionID, ANSWER_OPTIONS, is_correct) values (6, 'Eerst', 0);
insert into multiple_choice_question (questionID, ANSWER_OPTIONS, is_correct) values (6, 'Twee', 0);
insert into multiple_choice_question (questionID, ANSWER_OPTIONS, is_correct) values (6, 'Error', 0);

insert into multiple_choice_question (questionID, ANSWER_OPTIONS, is_correct) values (12, 'Ja', 1);
insert into multiple_choice_question (questionID, ANSWER_OPTIONS, is_correct) values (12, 'Nee', 0);

insert into PARTICIPANT (PARTICIPANTID) values (null);

insert into KNOWLEDGE_SESSION (PARTICIPANTID, NICKNAME) values (1, 'Jax');

insert into PARTICIPANT_OF_CAMPAIGN (PARTICIPANTID, NAME) values (1, 'HC2 Holdings, Inc.');

insert into STATE (STATEID, STATE_NAME) values (1, 'pending');
insert into STATE (STATEID, STATE_NAME) values (2, 'correct');
insert into STATE (STATEID, STATE_NAME) values (3, 'incorrect');

insert into GIVEN_ANSWER (QUESTIONID, PARTICIPANTID, NAME, STATEID, GIVEN_ANSWER) values (3, 1, 'HC2 Holdings, Inc.', 1, 'A');
