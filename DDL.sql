DROP DATABASE IF EXISTS qodingchallenge;

CREATE DATABASE qodingchallenge;

USE qodingchallenge;

CREATE TABLE CAMPAIGN
(
   CAMPAIGN_ID          INT AUTO_INCREMENT,
   CAMPAIGN_NAME        VARCHAR(255) NOT NULL UNIQUE,
   CATEGORY_NAME        VARCHAR(255) NOT NULL,
   CAMPAIGN_TYPE        VARCHAR(255) NOT NULL,
   USERNAME             VARCHAR(255) NOT NULL,
   AMOUNT_OF_QUESTIONS  SMALLINT NOT NULL,
   TIMELIMIT            SMALLINT,
   STATE                BOOL NOT NULL,
   PRIMARY KEY (CAMPAIGN_ID)
);

CREATE TABLE CAMPAIGN_TYPE
(
   CAMPAIGN_TYPE        VARCHAR(255) NOT NULL,
   PRIMARY KEY (CAMPAIGN_TYPE)
);

CREATE TABLE CATEGORY
(
   CATEGORY_NAME        VARCHAR(255) NOT NULL,
   PRIMARY KEY (CATEGORY_NAME)
);

CREATE TABLE CONFERENCE
(
   PARTICIPANTID        SMALLINT NOT NULL,
   FIRSTNAME            VARCHAR(255) NOT NULL,
   INSERTION            VARCHAR(20),
   LASTNAME             VARCHAR(255) NOT NULL,
   EMAIL                VARCHAR(255),
   PHONENUMBER          BIGINT,
   PRIMARY KEY (PARTICIPANTID)
);

CREATE TABLE EMPLOYEE
(
   USERNAME             VARCHAR(255) NOT NULL,
   PASSWORD             VARCHAR(300) NOT NULL,
   PRIMARY KEY (USERNAME)
);

CREATE TABLE GIVEN_ANSWER
(
   QUESTIONID           SMALLINT NOT NULL,
   PARTICIPANTID        SMALLINT NOT NULL,
   CAMPAIGN_ID          INT,
   STATEID              SMALLINT NOT NULL,
   GIVEN_ANSWER         VARCHAR(1024) NOT NULL,
   PRIMARY KEY (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID)
);

CREATE TABLE KNOWLEDGE_SESSION
(
   PARTICIPANTID        SMALLINT NOT NULL,
   NICKNAME             VARCHAR(255) NOT NULL,
   PRIMARY KEY (PARTICIPANTID)
);

CREATE TABLE MULTIPLE_CHOICE_QUESTION
(
   QUESTIONID           SMALLINT NOT NULL,
   ANSWER_OPTIONS       VARCHAR(255) NOT NULL,
   IS_CORRECT           BOOL NOT NULL,
   PRIMARY KEY (QUESTIONID, ANSWER_OPTIONS)
);

CREATE TABLE PARTICIPANT
(
   PARTICIPANTID        SMALLINT NOT NULL AUTO_INCREMENT,
   PRIMARY KEY (PARTICIPANTID)
);

CREATE TABLE PARTICIPANT_OF_CAMPAIGN
(
   PARTICIPANTID        SMALLINT NOT NULL,
   CAMPAIGN_ID          INT,
   TIME_STARTED         TIMESTAMP NOT NULL DEFAULT now(),
   PRIMARY KEY (PARTICIPANTID, CAMPAIGN_ID)
);

CREATE TABLE PROGRAMMING_QUESTION
(
   QUESTIONID           SMALLINT NOT NULL,
   STARTCODE            VARCHAR(1024),
   PRIMARY KEY (QUESTIONID)
);

CREATE TABLE QUESTION
(
   QUESTIONID           SMALLINT NOT NULL AUTO_INCREMENT,
   CATEGORY_NAME        VARCHAR(255) NOT NULL,
   QUESTION             VARCHAR(255) NOT NULL,
   STATE                BOOL NOT NULL DEFAULT 1,
   QUESTION_TYPE        VARCHAR(255),
   ATTACHMENT           VARCHAR(4096),
   PRIMARY KEY (QUESTIONID)
);

CREATE TABLE STATE
(
   STATEID              SMALLINT NOT NULL,
   STATE_NAME           VARCHAR(50) NOT NULL,
   PRIMARY KEY (STATEID)
);

CREATE TABLE TMP_MULTIPLE_CHOICE_QUESTION
(
   QUESTIONID           SMALLINT NOT NULL,
   ANSWER_OPTIONS       VARCHAR(255) NOT NULL,
   IS_CORRECT           BOOL NOT NULL,
   PRIMARY KEY (QUESTIONID, ANSWER_OPTIONS)
);

ALTER TABLE CAMPAIGN ADD CONSTRAINT FK_CAMPAIGN_TYPE_OF_CAMPAIGN FOREIGN KEY (CAMPAIGN_TYPE)
      REFERENCES CAMPAIGN_TYPE (CAMPAIGN_TYPE) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CAMPAIGN ADD CONSTRAINT FK_CATEGORY_OF_CAMPAIGN FOREIGN KEY (CATEGORY_NAME)
      REFERENCES CATEGORY (CATEGORY_NAME) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CAMPAIGN ADD CONSTRAINT FK_EMPLOYEE_CREATED_CAMPAIGN FOREIGN KEY (USERNAME)
      REFERENCES EMPLOYEE (USERNAME) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CONFERENCE ADD CONSTRAINT FK_TYPE_OF_PARTICIPANT2 FOREIGN KEY (PARTICIPANTID)
      REFERENCES PARTICIPANT (PARTICIPANTID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE GIVEN_ANSWER ADD CONSTRAINT FK_GIVEN_ANSWER FOREIGN KEY (QUESTIONID)
      REFERENCES QUESTION (QUESTIONID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE GIVEN_ANSWER ADD CONSTRAINT FK_GIVEN_ANSWER2 FOREIGN KEY (PARTICIPANTID)
      REFERENCES PARTICIPANT (PARTICIPANTID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE GIVEN_ANSWER ADD CONSTRAINT FK_GIVEN_ANSWER3 FOREIGN KEY (CAMPAIGN_ID)
      REFERENCES CAMPAIGN (CAMPAIGN_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE GIVEN_ANSWER ADD CONSTRAINT FK_GIVEN_ANSWER5 FOREIGN KEY (STATEID)
      REFERENCES STATE (STATEID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE KNOWLEDGE_SESSION ADD CONSTRAINT FK_TYPE_OF_PARTICIPANT FOREIGN KEY (PARTICIPANTID)
      REFERENCES PARTICIPANT (PARTICIPANTID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE MULTIPLE_CHOICE_QUESTION ADD CONSTRAINT FK_TYPE_OF_QUESTION FOREIGN KEY (QUESTIONID)
      REFERENCES QUESTION (QUESTIONID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PARTICIPANT_OF_CAMPAIGN ADD CONSTRAINT FK_PARTICIPANT_OF_CAMPAIGN FOREIGN KEY (PARTICIPANTID)
      REFERENCES PARTICIPANT (PARTICIPANTID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PARTICIPANT_OF_CAMPAIGN ADD CONSTRAINT FK_PARTICIPANT_OF_CAMPAIGN2 FOREIGN KEY (CAMPAIGN_ID)
      REFERENCES CAMPAIGN (CAMPAIGN_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PROGRAMMING_QUESTION ADD CONSTRAINT FK_TYPE_OF_QUESTION3 FOREIGN KEY (QUESTIONID)
      REFERENCES QUESTION (QUESTIONID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE QUESTION ADD CONSTRAINT FK_CATEGORY_OF_QUESTION FOREIGN KEY (CATEGORY_NAME)
      REFERENCES CATEGORY (CATEGORY_NAME) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE conference ADD CONSTRAINT CHK_PHONE_EMAIL CHECK ((email IS NOT NULL) OR (phonenumber IS NOT NULL));

ALTER TABLE campaign ADD CONSTRAINT CHK_CAMPAIGN_TIMELIMIT CHECK ((TIMELIMIT IS NULL) OR (TIMELIMIT > 0));