/*test for stuff*/
/*delete from given_answer where PARTICIPANTID = 1*/

DELETE FROM given_answer;
DELETE FROM participant_of_campaign;
DELETE FROM campaign;
DELETE FROM employee;
DELETE FROM campaign_type;
DELETE FROM multiple_choice_question;
DELETE FROM STATE;
DELETE FROM conference;
DELETE FROM knowledge_session;
DELETE FROM participant;
DELETE FROM question;
DELETE FROM category;
ALTER TABLE participant AUTO_INCREMENT = 1;
ALTER TABLE campaign AUTO_INCREMENT = 1;
ALTER TABLE question AUTO_INCREMENT = 1;

INSERT INTO employee (USERNAME, PASSWORD) VALUES ('admin', 'password123');
INSERT INTO employee (USERNAME, PASSWORD) VALUES ('hcollerd1', 'mbownde1');
INSERT INTO employee (USERNAME, PASSWORD) VALUES ('apudney2', 'mwissby2');
INSERT INTO employee (USERNAME, PASSWORD) VALUES ('brubinsohn3', 'hfriett3');
INSERT INTO employee (USERNAME, PASSWORD) VALUES ('zpoole4', 'mhatchell4');

INSERT INTO category (CATEGORY_NAME) VALUES ('JAVA');
INSERT INTO category (CATEGORY_NAME) VALUES ('.NET');
INSERT INTO category (CATEGORY_NAME) VALUES ('Python');

INSERT INTO campaign_type (CAMPAIGN_TYPE) VALUES ('conferentie');
INSERT INTO CAMPAIGN_TYPE (CAMPAIGN_TYPE) VALUES ('kennissessie');

INSERT INTO campaign (CAMPAIGN_NAME, CATEGORY_NAME, CAMPAIGN_TYPE, USERNAME, AMOUNT_OF_QUESTIONS, TIMELIMIT, STATE) VALUES ('HC2 Holdings, Inc', 'JAVA', 'conferentie', 'admin', 1, 1, true);
INSERT INTO campaign (CAMPAIGN_NAME, CATEGORY_NAME, CAMPAIGN_TYPE, USERNAME, AMOUNT_OF_QUESTIONS, TIMELIMIT, STATE) VALUES ('Syros Pharmaceuticals, Inc','.NET', 'conferentie','hcollerd1', 2, 2, true);
INSERT INTO campaign (CAMPAIGN_NAME, CATEGORY_NAME, CAMPAIGN_TYPE, USERNAME, AMOUNT_OF_QUESTIONS, TIMELIMIT, STATE) VALUES ('Principal U.S. Small Cap Index ETF', 'Python', 'conferentie','apudney2',  3, 3, false);

INSERT INTO question (CATEGORY_NAME, QUESTION, STATE, QUESTION_TYPE) VALUES ('JAVA', 'Wat is de output van het draaien van de main methode in klasse B voor de volgende code', 1, 'open');
INSERT INTO question (CATEGORY_NAME, QUESTION, STATE, QUESTION_TYPE) VALUES ('JAVA', 'Juist of onjuist, er bestaat ter allen tijd een instantie van de class singelton. Licht je antwoord toe', 1, 'open');
INSERT INTO question (CATEGORY_NAME, QUESTION, STATE, QUESTION_TYPE) VALUES ('JAVA', 'Kan je meerdere catch STATEments gebruiken voor EEN try', 1, 'multiple');
INSERT INTO question (CATEGORY_NAME, QUESTION, STATE, QUESTION_TYPE) VALUES ('JAVA', 'Wat is dependency injection', 1, 'open');
INSERT INTO question (CATEGORY_NAME, QUESTION, STATE, QUESTION_TYPE) VALUES ('JAVA', 'Welke methode moet je ook omschrijven als je de equals() methode overschrijft', 1, 'open');
INSERT INTO question (CATEGORY_NAME, QUESTION, STATE, QUESTION_TYPE, ATTACHMENT) VALUES ('JAVA', 'Welke methodes moeten geimplenmenteerd worden door een klasse die de volgende interfaces implenmenteerd', 1, 'multiple', 'interface first \n{void() method() throws IOException \n } interface first \n {void() method() throws IOException \n}');
INSERT INTO question (CATEGORY_NAME, QUESTION, STATE, QUESTION_TYPE) VALUES ('JAVA', 'Moet er bij het maken van een class altijd een constructor gemaakt worden? licht je antwoord toe', 1, 'open');
INSERT INTO question (CATEGORY_NAME, QUESTION, STATE, QUESTION_TYPE) VALUES ('JAVA', 'Bij het testen met junit, waarom is het niet netjes om static te gebruiken?', 1, 'open');
INSERT INTO question (CATEGORY_NAME, QUESTION, STATE, QUESTION_TYPE) VALUES ('JAVA', 'Welk command binnen maven gebruik je om een .war bestand te genereren', 1, 'open');
INSERT INTO question (CATEGORY_NAME, QUESTION, STATE, QUESTION_TYPE) VALUES ('JAVA', 'Als een short het nummer 32,767 bevat en je de waarde wilt opslaan in de byte, welke error wordt er gegeven', 1, 'open');
INSERT INTO question (CATEGORY_NAME, QUESTION, STATE, QUESTION_TYPE) VALUES ('JAVA', 'Welke oprator binnen java wordt gebruikt voor modulus', 1, 'open');
INSERT INTO question (CATEGORY_NAME, QUESTION, STATE, QUESTION_TYPE) VALUES ('JAVA', 'Waar of niet waar, kan je een char array in een string zetten', 1, 'multiple');

INSERT INTO multiple_choice_question (QUESTIONID, ANSWER_OPTIONS, IS_CORRECT) VALUES (3, 'Ja', 1);
INSERT INTO multiple_choice_question (QUESTIONID, ANSWER_OPTIONS, IS_CORRECT) VALUES (3, 'Nee', 0);

INSERT INTO multiple_choice_question (QUESTIONID, ANSWER_OPTIONS, IS_CORRECT) VALUES (6, 'Beide', 1);
INSERT INTO multiple_choice_question (QUESTIONID, ANSWER_OPTIONS, IS_CORRECT) VALUES (6, 'Eerst', 0);
INSERT INTO multiple_choice_question (QUESTIONID, ANSWER_OPTIONS, IS_CORRECT) VALUES (6, 'Twee', 0);
INSERT INTO multiple_choice_question (QUESTIONID, ANSWER_OPTIONS, IS_CORRECT) VALUES (6, 'Error', 0);

INSERT INTO multiple_choice_question (QUESTIONID, ANSWER_OPTIONS, IS_CORRECT) VALUES (12, 'Waar', 1);
INSERT INTO multiple_choice_question (QUESTIONID, ANSWER_OPTIONS, IS_CORRECT) VALUES (12, 'Niet waar', 0);

INSERT INTO PARTICIPANT (PARTICIPANTID) VALUES (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL);

INSERT INTO KNOWLEDGE_SESSION (PARTICIPANTID, NICKNAME) VALUES (1, 'Jax');
INSERT INTO KNOWLEDGE_SESSION (PARTICIPANTID, NICKNAME) VALUES (2, 'Bob');
INSERT INTO KNOWLEDGE_SESSION (PARTICIPANTID, NICKNAME) VALUES (3, 'Ricardo');
INSERT INTO KNOWLEDGE_SESSION (PARTICIPANTID, NICKNAME) VALUES (4, 'Bas');

INSERT INTO conference (PARTICIPANTID, FIRSTNAME, INSERTION, LASTNAME, EMAIL, PHONENUMBER) VALUES (5, 'Gray', null, 'Snare', 'gsnare0@xinhuanet.com', 2219773471);
INSERT INTO conference (PARTICIPANTID, FIRSTNAME, INSERTION, LASTNAME, EMAIL, PHONENUMBER) VALUES (6, 'Germayne', null, 'Greated', 'ggreated1@google.com.hk', 3896612994);
INSERT INTO conference (PARTICIPANTID, FIRSTNAME, INSERTION, LASTNAME, EMAIL, PHONENUMBER) VALUES (7, 'Neda', 'ncommander2', 'Commander', 'ncommander2@google.co.jp', 8823491928);
INSERT INTO conference (PARTICIPANTID, FIRSTNAME, INSERTION, LASTNAME, EMAIL, PHONENUMBER) VALUES (8, 'Dav', 'dsilverlock3', 'Silverlock', 'dsilverlock3@discuz.net', 6325212856);
INSERT INTO conference (PARTICIPANTID, FIRSTNAME, INSERTION, LASTNAME, EMAIL, PHONENUMBER) VALUES (9, 'Aimee', 'Ooba', 'Capner', 'acapner0@chicagotribune.com', 5806737459);
INSERT INTO conference (PARTICIPANTID, FIRSTNAME, INSERTION, LASTNAME, EMAIL, PHONENUMBER) VALUES (10, 'Tristan', 'Jabberstorm', 'Doohey', 'tdoohey1@infoseek.co.jp', 1108986529);
INSERT INTO conference (PARTICIPANTID, FIRSTNAME, INSERTION, LASTNAME, EMAIL, PHONENUMBER) VALUES (11, 'Gilberto', 'Yodel', 'Presland', 'gpresland2@economist.com', 4708705667);
INSERT INTO conference (PARTICIPANTID, FIRSTNAME, INSERTION, LASTNAME, EMAIL, PHONENUMBER) VALUES (12, 'Ted', 'Realbuzz', 'Traise', 'ttraise3@nbcnews.com', 2924248629);

INSERT INTO PARTICIPANT_OF_CAMPAIGN (PARTICIPANTID, CAMPAIGN_ID, TIME_STARTED, TIME_ENDED) VALUES (1, 1, '2019-12-04 15:00:23', '2019-12-04 16:00:23');
INSERT INTO PARTICIPANT_OF_CAMPAIGN (PARTICIPANTID, CAMPAIGN_ID, TIME_STARTED, TIME_ENDED) VALUES (2, 1, '2019-12-04 15:00:23', '2019-12-04 17:00:23');
INSERT INTO PARTICIPANT_OF_CAMPAIGN (PARTICIPANTID, CAMPAIGN_ID, TIME_STARTED, TIME_ENDED) VALUES (3, 1, '2019-12-04 15:00:23', '2019-12-05 18:03:23');

INSERT INTO STATE (STATEID, STATE_NAME) VALUES (1, 'pending');
INSERT INTO STATE (STATEID, STATE_NAME) VALUES (2, 'correct');
INSERT INTO STATE (STATEID, STATE_NAME) VALUES (3, 'incorrect');

INSERT INTO GIVEN_ANSWER (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
VALUES (1, 5, 1, 1, 'Hello world'),
       (2, 5, 1, 1, 'Juist, idk'),
       (3, 5, 1, 2, 'A'),
       (4, 5, 1, 1, 'Dependency injection zorgt ervoor dat je geen handmatige injection meer hoeft te doen'),
       (5, 5, 1, 1, 'jazeker'),
       (6, 5, 1, 1, 'Beide'),
       (7, 5, 1, 1, 'B'),
       (8, 5, 1, 1, 'P'),
       (9, 5, 1, 1, 'n'),
       (10, 5, 1, 1, 'k'),
       (11, 5, 1, 1, 'f'),
       (12, 5, 1, 1, 'Waar');

insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, 6, 1, 1, 'U'),
       (2, 6, 1, 1, 'N'),
       (3, 6, 1, 2, 'Ja'),
       (4, 6, 1, 1, 'H'),
       (5, 6, 1, 1, 'p'),
       (6, 6, 1, 3, 'Tweede'),
       (7, 6, 1, 1, 'I'),
       (8, 6, 1, 1, 'b'),
       (9, 6, 1, 1, 'A'),
       (10, 6, 1, 1, 's'),
       (11, 6, 1, 1, 'L'),
       (12, 6, 1, 2, 'waar');

insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, 7, 1, 1, 'T'),
       (2, 7, 1, 1, 'M'),
       (3, 7, 1, 2, 'Ja'),
       (4, 7, 1, 1, 'a'),
       (5, 7, 1, 1, 'N'),
       (6, 7, 1, 2, 'Beide'),
       (7, 7, 1, 1, 'N'),
       (8, 7, 1, 1, 'i'),
       (9, 7, 1, 1, 'U'),
       (10, 7, 1, 1, 'n'),
       (11, 7, 1, 1, 'r'),
       (12, 7, 1, 2, 'Waar');

insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, 8, 1, 1, 'd'),
       (2, 8, 1, 1, 'A'),
       (3, 8, 1, 3, 'Nee'),
       (4, 8, 1, 1, 'y'),
       (5, 8, 1, 1, 'l'),
       (6, 8, 1, 3, 'Eerst'),
       (7, 8, 1, 1, 'J'),
       (8, 8, 1, 1, 'T'),
       (9, 8, 1, 1, 't'),
       (10, 8, 1, 1, 'g'),
       (11, 8, 1, 1, 'U'),
       (12, 8, 1, 3, 'Niet waar');



insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, 9, 1, 1, 'I'),
       (2, 9, 1, 1, 'T'),
       (3, 9, 1, 3, 'Nee'),
       (4, 9, 1, 1, 'G'),
       (5, 9, 1, 1, 'n'),
       (6, 9, 1, 3, 'Error'),
       (7, 9, 1, 1, 'D'),
       (8, 9, 1, 1, 'C'),
       (9, 9, 1, 1, 'c'),
       (10, 9, 1, 1, 'H'),
       (11, 9, 1, 1, 'p'),
       (12, 9, 1, 2, 'waar');

insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, 10, 1, 1, 'X'),
       (2, 10, 1, 1, 'P'),
       (3, 10, 1, 2, 'Ja'),
       (4, 10, 1, 1, 'X'),
       (5, 10, 1, 1, 'I'),
       (6, 10, 1, 3, 'Error'),
       (7, 10, 1, 1, 'S'),
       (8, 10, 1, 1, 'x'),
       (9, 10, 1, 1, 'L'),
       (10, 10, 1, 1, 'Y'),
       (11, 10, 1, 1, 'D'),
       (12, 10, 1, 2, 'waar');

insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, 11, 1, 1, 'H'),
       (2, 11, 1, 1, 'P'),
       (3, 11, 1, 3, 'Nee'),
       (4, 11, 1, 1, 'h'),
       (5, 11, 1, 1, 'S'),
       (6, 11, 1, 2, 'Beide'),
       (7, 11, 1, 1, 'T'),
       (8, 11, 1, 1, 'P'),
       (9, 11, 1, 1, 'd'),
       (10, 11, 1, 1, 'A'),
       (11, 11, 1, 1, 'A'),
       (12, 11, 1, 2, 'Waar');


insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, 12, 1, 1, 'N'),
       (2, 12, 1, 1, 'b'),
       (3, 12, 1, 2, 'Ja'),
       (4, 12, 1, 1, 'k'),
       (5, 12, 1, 1, 'D'),
       (6, 12, 1, 3, 'Error'),
       (7, 12, 1, 1, 'r'),
       (8, 12, 1, 1, 'K'),
       (9, 12, 1, 1, 'r'),
       (10, 12, 1, 1, 'M'),
       (11, 12, 1, 1, 'c'),
       (12, 12, 1, 2, 'Waar');

insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, 5, 2, 1, 'A'),
       (2, 5, 2, 1, 'k'),
       (3, 5, 2, 3, 'Nee'),
       (4, 5, 2, 1, 'r'),
       (5, 5, 2, 1, 'B'),
       (6, 5, 2, 2, 'Beide'),
       (7, 5, 2, 1, 'X'),
       (8, 5, 2, 1, 'd'),
       (9, 5, 2, 1, 'h'),
       (10, 5, 2, 1, 'g'),
       (11, 5, 2, 1, 'Q'),
       (12, 5, 2, 3, 'Niet waar');

insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, 6, 2, 1, 'W'),
       (2, 6, 2, 1, 'd'),
       (3, 6, 2, 2, 'Ja'),
       (4, 6, 2, 1, 'm'),
       (5, 6, 2, 1, 'I'),
       (6, 6, 2, 3, 'Eerste'),
       (7, 6, 2, 1, 'X'),
       (8, 6, 2, 1, 't'),
       (9, 6, 2, 1, 'z'),
       (10, 6, 2, 1, 'R'),
       (11, 6, 2, 1, 'e'),
       (12, 6, 2, 2, 'Waar');

insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, 7, 2, 1, 'E'),
       (2, 7, 2, 1, 'C'),
       (3, 7, 2, 3, 'Nee'),
       (4, 7, 2, 1, 'u'),
       (5, 7, 2, 1, 'M'),
       (6, 7, 2, 3, 'Tweede'),
       (7, 7, 2, 1, 'n'),
       (8, 7, 2, 1, 'N'),
       (9, 7, 2, 1, 'x'),
       (10, 7, 2, 1, 'e'),
       (11, 7, 2, 1, 'I'),
       (12, 7, 2, 2, 'Waar');

insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, 8, 2, 1, 'P'),
       (2, 8, 2, 1, 'Y'),
       (3, 8, 2, 2, 'Ja'),
       (4, 8, 2, 1, 'A'),
       (5, 8, 2, 1, 'J'),
       (6, 8, 2, 2, 'Beide'),
       (7, 8, 2, 1, 'R'),
       (8, 8, 2, 1, 'p'),
       (9, 8, 2, 1, 'a'),
       (10, 8, 2, 1, 'v'),
       (11, 8, 2, 1, 'w'),
       (12, 8, 2, 2, 'Waar');

insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, 5, 3, 1, 'm'),
       (2, 5, 3, 1, 'G'),
       (3, 5, 3, 2, 'Ja'),
       (4, 5, 3, 1, 'r'),
       (5, 5, 3, 1, 'S'),
       (6, 5, 3, 3, 'Error'),
       (7, 5, 3, 1, 'c'),
       (8, 5, 3, 1, 'a'),
       (9, 5, 3, 1, 'W'),
       (10, 5, 3, 1, 'B'),
       (11, 5, 3, 1, 'k'),
       (12, 5, 3, 2, 'Waar');

insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, 6, 3, 1, 't'),
       (2, 6, 3, 1, 'n'),
       (3, 6, 3, 2, 'Ja'),
       (4, 6, 3, 1, 'H'),
       (5, 6, 3, 1, 'd'),
       (6, 6, 3, 3, 'Eerste'),
       (7, 6, 3, 1, 'y'),
       (8, 6, 3, 1, 'x'),
       (9, 6, 3, 1, 'Z'),
       (10, 6, 3, 1, 'f'),
       (11, 6, 3, 1, 'j'),
       (12, 6, 3, 2, 'Waar');