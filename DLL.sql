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
INSERT INTO question (CATEGORY_NAME, QUESTION, STATE, QUESTION_TYPE) VALUES ('JAVA', 'In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas.', 1, 'open');
INSERT INTO question (CATEGORY_NAME, QUESTION, STATE, QUESTION_TYPE) VALUES ('JAVA', 'dictum eleifend, nunc risus varius orci, in consequat enim diam', 1, 'open');
INSERT INTO question (CATEGORY_NAME, QUESTION, STATE, QUESTION_TYPE) VALUES ('JAVA', 'euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas', 1, 'open');
INSERT INTO question (CATEGORY_NAME, QUESTION, STATE, QUESTION_TYPE) VALUES ('JAVA', 'gravida mauris ut Duis risus odio, auctor vitae, aliquet', 1, 'open');
INSERT INTO question (CATEGORY_NAME, QUESTION, STATE, QUESTION_TYPE) VALUES ('JAVA', 'gravida mauris mi. Duis risus odio, auctor vitae, aliquet', 1, 'open');
INSERT INTO question (CATEGORY_NAME, QUESTION, STATE, QUESTION_TYPE) VALUES ('JAVA', 'gravida ut mi. Duis risus odio, auctor vitae, aliquet', 1, 'multiple');

INSERT INTO multiple_choice_question (QUESTIONID, ANSWER_OPTIONS, IS_CORRECT) VALUES (3, 'Ja', 1);
INSERT INTO multiple_choice_question (QUESTIONID, ANSWER_OPTIONS, IS_CORRECT) VALUES (3, 'Nee', 0);

INSERT INTO multiple_choice_question (QUESTIONID, ANSWER_OPTIONS, IS_CORRECT) VALUES (6, 'Beide', 1);
INSERT INTO multiple_choice_question (QUESTIONID, ANSWER_OPTIONS, IS_CORRECT) VALUES (6, 'Eerst', 0);
INSERT INTO multiple_choice_question (QUESTIONID, ANSWER_OPTIONS, IS_CORRECT) VALUES (6, 'Twee', 0);
INSERT INTO multiple_choice_question (QUESTIONID, ANSWER_OPTIONS, IS_CORRECT) VALUES (6, 'Error', 0);

INSERT INTO multiple_choice_question (QUESTIONID, ANSWER_OPTIONS, IS_CORRECT) VALUES (12, 'Ja', 1);
INSERT INTO multiple_choice_question (QUESTIONID, ANSWER_OPTIONS, IS_CORRECT) VALUES (12, 'Nee', 0);

INSERT INTO PARTICIPANT (PARTICIPANTID) VALUES (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL), (NULL);

INSERT INTO KNOWLEDGE_SESSION (PARTICIPANTID, NICKNAME) VALUES (1, 'Jax');
INSERT INTO KNOWLEDGE_SESSION (PARTICIPANTID, NICKNAME) VALUES (2, 'Bob');
INSERT INTO KNOWLEDGE_SESSION (PARTICIPANTID, NICKNAME) VALUES (3, 'Ricardo');
INSERT INTO KNOWLEDGE_SESSION (PARTICIPANTID, NICKNAME) VALUES (4, 'Bas');

INSERT INTO conference (PARTICIPANTID, FIRSTNAME, INSERTION, LASTNAME, EMAIL, PHONENUMBER) VALUES (5, 'Gray', null, 'Snare', 'gsnare0@xinhuanet.com', 2219773471);
INSERT INTO conference (PARTICIPANTID, FIRSTNAME, INSERTION, LASTNAME, EMAIL, PHONENUMBER) VALUES (6, 'Germayne', null, 'Greated', 'ggreated1@google.com.hk', 3896612994);
INSERT INTO conference (PARTICIPANTID, FIRSTNAME, INSERTION, LASTNAME, EMAIL, PHONENUMBER) VALUES (7, 'Neda', 'ncommander2', 'Commander', 'ncommander2@google.co.jp', 8823491928);
INSERT INTO conference (PARTICIPANTID, FIRSTNAME, INSERTION, LASTNAME, EMAIL, PHONENUMBER) VALUES (8, 'Dav', 'dsilverlock3', 'Silverlock', 'dsilverlock3@discuz.net', 6325212856);

INSERT INTO PARTICIPANT_OF_CAMPAIGN (PARTICIPANTID, CAMPAIGN_ID, TIME_STARTED, TIME_ENDED) VALUES (1, 1, '2019-12-04 15:00:23', '2019-12-04 16:00:23');
INSERT INTO PARTICIPANT_OF_CAMPAIGN (PARTICIPANTID, CAMPAIGN_ID, TIME_STARTED, TIME_ENDED) VALUES (2, 1, '2019-12-04 15:00:23', '2019-12-04 17:00:23');
INSERT INTO PARTICIPANT_OF_CAMPAIGN (PARTICIPANTID, CAMPAIGN_ID, TIME_STARTED, TIME_ENDED) VALUES (3, 1, '2019-12-04 15:00:23', '2019-12-05 18:03:23');

INSERT INTO STATE (STATEID, STATE_NAME) VALUES (1, 'pending');
INSERT INTO STATE (STATEID, STATE_NAME) VALUES (2, 'correct');
INSERT INTO STATE (STATEID, STATE_NAME) VALUES (3, 'incorrect');

INSERT INTO GIVEN_ANSWER (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER) VALUES (3, 1, 1, 1, 'A');
