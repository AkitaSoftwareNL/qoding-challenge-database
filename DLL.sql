delete from given_answer;
delete from participant_of_campaign;
delete from campaign;
delete from employee;
delete from campaign_type;
delete from multiple_choice_question;
delete from state;
delete from conference;
delete from knowledge_session;
delete from participant;
delete from question;
delete from category;
ALTER TABLE participant AUTO_INCREMENT = 1;

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

insert into campaign (name, category_name, CAMPAIGN_TYPE, username, amount_of_questions, timelimit, state) values ('HC2 Holdings, Inc', 'JAVA', 'conferentie', 'admin', 1, 1, true);
insert into campaign (name, category_name, CAMPAIGN_TYPE, username, amount_of_questions, timelimit, state) values ('Syros Pharmaceuticals, Inc','.NET', 'conferentie','hcollerd1', 2, 2, true);
insert into campaign (name, category_name, CAMPAIGN_TYPE, username, amount_of_questions, timelimit, state) values ('Principal U.S. Small Cap Index ETF', 'Python', 'conferentie','apudney2',  3, 3, false);

insert into question (category_name, question, state, QUESTION_TYPE) values ('JAVA', 'Wat is de output van het draaien van de main methode in klasse B voor de volgende code', 1, 'open');
insert into question (category_name, question, state, QUESTION_TYPE) values ('JAVA', 'Juist of onjuist, er bestaat ter allen tijd een instantie van de class singelton. Licht je antwoord toe', 1, 'open');
insert into question (category_name, question, state, QUESTION_TYPE) values ('JAVA', 'Kan je meerdere catch statements gebruiken voor EEN try', 1, 'multiple');
insert into question (category_name, question, state, QUESTION_TYPE) values ('JAVA', 'Wat is dependency injection', 1, 'open');
insert into question (category_name, question, state, QUESTION_TYPE) values ('JAVA', 'Welke methode moet je ook omschrijven als je de equals() methode overschrijft', 1, 'open');
insert into question (category_name, question, state, QUESTION_TYPE, ATTACHMENT) values ('JAVA', 'Welke methodes moeten geimplenmenteerd worden door een klasse die de volgende interfaces implenmenteerd', 1, 'multiple', 'interface first \n{void() method() throws IOException \n } interface first \n {void() method() throws IOException \n}');
insert into question (category_name, question, state, QUESTION_TYPE) values ('JAVA', 'In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas.', 1, 'open');
insert into question (category_name, question, state, QUESTION_TYPE) values ('JAVA', 'dictum eleifend, nunc risus varius orci, in consequat enim diam', 1, 'open');
insert into question (category_name, question, state, QUESTION_TYPE) values ('JAVA', 'euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas', 1, 'open');
insert into question (category_name, question, state, QUESTION_TYPE) values ('JAVA', 'gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet', 1, 'open');
insert into question (category_name, question, state, QUESTION_TYPE) values ('JAVA', 'gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet', 1, 'open');
insert into question (category_name, question, state, QUESTION_TYPE) values ('JAVA', 'gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet', 1, 'multiple');

insert into multiple_choice_question (questionID, ANSWER_OPTIONS, is_correct) values (3, 'Ja', 1);
insert into multiple_choice_question (questionID, ANSWER_OPTIONS, is_correct) values (3, 'Nee', 0);

insert into multiple_choice_question (questionID, ANSWER_OPTIONS, is_correct) values (6, 'Beide', 1);
insert into multiple_choice_question (questionID, ANSWER_OPTIONS, is_correct) values (6, 'Eerst', 0);
insert into multiple_choice_question (questionID, ANSWER_OPTIONS, is_correct) values (6, 'Twee', 0);
insert into multiple_choice_question (questionID, ANSWER_OPTIONS, is_correct) values (6, 'Error', 0);

insert into multiple_choice_question (questionID, ANSWER_OPTIONS, is_correct) values (12, 'Ja', 1);
insert into multiple_choice_question (questionID, ANSWER_OPTIONS, is_correct) values (12, 'Nee', 0);

insert into PARTICIPANT (PARTICIPANTID) values (null), (null), (null), (null), (null), (null), (null), (null);

insert into KNOWLEDGE_SESSION (PARTICIPANTID, NICKNAME) values (1, 'Jax');
insert into KNOWLEDGE_SESSION (PARTICIPANTID, NICKNAME) values (2, 'Bob');
insert into KNOWLEDGE_SESSION (PARTICIPANTID, NICKNAME) values (3, 'Ricardo');
insert into KNOWLEDGE_SESSION (PARTICIPANTID, NICKNAME) values (4, 'Bas');

insert into conference (PARTICIPANTID, FIRSTNAME, insertion, LASTNAME, email, phonenumber) values (5, 'Gray', null, 'Snare', 'gsnare0@xinhuanet.com', 2219773471);
insert into conference (PARTICIPANTID, FIRSTNAME, insertion, LASTNAME, email, phonenumber) values (6, 'Germayne', null, 'Greated', 'ggreated1@google.com.hk', 3896612994);
insert into conference (PARTICIPANTID, FIRSTNAME, insertion, LASTNAME, email, phonenumber) values (7, 'Neda', 'ncommander2', 'Commander', 'ncommander2@google.co.jp', 8823491928);
insert into conference (PARTICIPANTID, FIRSTNAME, insertion, LASTNAME, email, phonenumber) values (8, 'Dav', 'dsilverlock3', 'Silverlock', 'dsilverlock3@discuz.net', 6325212856);

insert into PARTICIPANT_OF_CAMPAIGN (PARTICIPANTID, NAME) values (1, 'HC2 Holdings, Inc');

insert into STATE (STATEID, STATE_NAME) values (1, 'pending');
insert into STATE (STATEID, STATE_NAME) values (2, 'correct');
insert into STATE (STATEID, STATE_NAME) values (3, 'incorrect');

insert into GIVEN_ANSWER (QUESTIONID, PARTICIPANTID, NAME, STATEID, GIVEN_ANSWER) values (3, 1, 'HC2 Holdings, Inc', 1, 'A');
