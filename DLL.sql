/*test for sprint review*/
/*delete from given_answer where PARTICIPANTID = 1*/

DELETE FROM given_answer;
DELETE FROM participant_of_campaign;
DELETE FROM campaign;
DELETE FROM employee;
DELETE FROM campaign_type;
DELETE FROM multiple_choice_question;
DELETE FROM STATE;
DELETE FROM conference;
DELETE FROM question;
DELETE FROM category;
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

INSERT INTO question (CATEGORY_NAME, QUESTION, STATE, QUESTION_TYPE, ATTACHMENT) VALUES ('JAVA', 'Wat is de output van het draaien van de main methode in klasse B voor de volgende code', 1, 'open',
'//Bestand a.java
package p1;
class A {
protected int i = 10;
public int getint(){
return i;
}
}

//Bestand b.java
package p2;
import p1.*
class B extends A
public void process (A a){
a.i = a.i * 2;
}

public static void main(String [] args){
A a = new B();
B b = new B();
b.process(a);
system.out.println(a.getI());
}
}');
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

INSERT INTO conference (PARTICIPANTID, FIRSTNAME, INSERTION, LASTNAME, EMAIL, PHONENUMBER) VALUES ('8063be67-7fec-47c4-a9ab-e3d03a9968b3', 'Gray', null, 'Snare', 'gsnare0@xinhuanet.com', 2219773471);
INSERT INTO conference (PARTICIPANTID, FIRSTNAME, INSERTION, LASTNAME, EMAIL, PHONENUMBER) VALUES ('1452950a-8059-4bd1-b397-d2bd765d6b9b', 'Germayne', null, 'Greated', 'ggreated1@google.com.hk', 3896612994);
INSERT INTO conference (PARTICIPANTID, FIRSTNAME, INSERTION, LASTNAME, EMAIL, PHONENUMBER) VALUES ('9722a79b-7494-4ef2-a56e-31a27f63911c', 'Neda', 'ncommander2', 'Commander', 'ncommander2@google.co.jp', 8823491928);
INSERT INTO conference (PARTICIPANTID, FIRSTNAME, INSERTION, LASTNAME, EMAIL, PHONENUMBER) VALUES ('00a94bb8-d00c-4244-bdf5-2051a18af5b3', 'Dav', 'dsilverlock3', 'Silverlock', 'dsilverlock3@discuz.net', 6325212856);
INSERT INTO conference (PARTICIPANTID, FIRSTNAME, INSERTION, LASTNAME, EMAIL, PHONENUMBER) VALUES ('5ffab0bf-770d-40ea-9b31-be2a0c32ac33', 'Aimee', 'Ooba', 'Capner', 'acapner0@chicagotribune.com', 5806737459);
INSERT INTO conference (PARTICIPANTID, FIRSTNAME, INSERTION, LASTNAME, EMAIL, PHONENUMBER) VALUES ('f65a7374-1af8-4c23-8d40-1bb3cc986c04', 'Tristan', 'Jabberstorm', 'Doohey', 'tdoohey1@infoseek.co.jp', 1108986529);
INSERT INTO conference (PARTICIPANTID, FIRSTNAME, INSERTION, LASTNAME, EMAIL, PHONENUMBER) VALUES ('080da1cc-db10-4da8-958c-fe983255cff4', 'Gilberto', 'Yodel', 'Presland', 'gpresland2@economist.com', 4708705667);
INSERT INTO conference (PARTICIPANTID, FIRSTNAME, INSERTION, LASTNAME, EMAIL, PHONENUMBER) VALUES ('6dbead39-df20-4c81-acec-eaefe11663ca', 'Ted', 'Realbuzz', 'Traise', 'ttraise3@nbcnews.com', 2924248629);

/*If you add test data to given_answer for a campaign, the participent needs to be added in this table*/
INSERT INTO PARTICIPANT_OF_CAMPAIGN (PARTICIPANTID, CAMPAIGN_ID, TIME_STARTED, TIME_ENDED) VALUES ('8063be67-7fec-47c4-a9ab-e3d03a9968b3', 1, '2019-12-04 15:00:23', '2019-12-04 16:00:23');
INSERT INTO PARTICIPANT_OF_CAMPAIGN (PARTICIPANTID, CAMPAIGN_ID, TIME_STARTED, TIME_ENDED) VALUES ('1452950a-8059-4bd1-b397-d2bd765d6b9b', 1, '2019-12-04 15:00:23', '2019-12-04 17:00:23');
INSERT INTO PARTICIPANT_OF_CAMPAIGN (PARTICIPANTID, CAMPAIGN_ID, TIME_STARTED, TIME_ENDED) VALUES ('9722a79b-7494-4ef2-a56e-31a27f63911c', 1, '2019-12-04 15:00:23', '2019-12-05 18:03:23');
INSERT INTO PARTICIPANT_OF_CAMPAIGN (PARTICIPANTID, CAMPAIGN_ID, TIME_STARTED, TIME_ENDED) VALUES ('00a94bb8-d00c-4244-bdf5-2051a18af5b3', 1, '2019-12-04 15:00:23', '2019-12-04 16:00:23');
INSERT INTO PARTICIPANT_OF_CAMPAIGN (PARTICIPANTID, CAMPAIGN_ID, TIME_STARTED, TIME_ENDED) VALUES ('5ffab0bf-770d-40ea-9b31-be2a0c32ac33', 1, '2019-12-04 15:00:23', '2019-12-04 17:00:23');
INSERT INTO PARTICIPANT_OF_CAMPAIGN (PARTICIPANTID, CAMPAIGN_ID, TIME_STARTED, TIME_ENDED) VALUES ('f65a7374-1af8-4c23-8d40-1bb3cc986c04', 1, '2019-12-04 15:00:23', '2019-12-05 18:03:23');
INSERT INTO PARTICIPANT_OF_CAMPAIGN (PARTICIPANTID, CAMPAIGN_ID, TIME_STARTED, TIME_ENDED) VALUES ('080da1cc-db10-4da8-958c-fe983255cff4', 1, '2019-12-04 15:00:23', '2019-12-04 16:00:23');
INSERT INTO PARTICIPANT_OF_CAMPAIGN (PARTICIPANTID, CAMPAIGN_ID, TIME_STARTED, TIME_ENDED) VALUES ('6dbead39-df20-4c81-acec-eaefe11663ca', 1, '2019-12-04 15:00:23', '2019-12-04 17:00:23');

INSERT INTO PARTICIPANT_OF_CAMPAIGN (PARTICIPANTID, CAMPAIGN_ID, TIME_STARTED, TIME_ENDED) VALUES ('8063be67-7fec-47c4-a9ab-e3d03a9968b3', 2, '2019-12-04 15:00:23', '2019-12-04 16:00:23');
INSERT INTO PARTICIPANT_OF_CAMPAIGN (PARTICIPANTID, CAMPAIGN_ID, TIME_STARTED, TIME_ENDED) VALUES ('1452950a-8059-4bd1-b397-d2bd765d6b9b', 2, '2019-12-04 15:00:23', '2019-12-04 17:00:23');
INSERT INTO PARTICIPANT_OF_CAMPAIGN (PARTICIPANTID, CAMPAIGN_ID, TIME_STARTED, TIME_ENDED) VALUES ('9722a79b-7494-4ef2-a56e-31a27f63911c', 2, '2019-12-04 15:00:23', '2019-12-05 18:03:23');
INSERT INTO PARTICIPANT_OF_CAMPAIGN (PARTICIPANTID, CAMPAIGN_ID, TIME_STARTED, TIME_ENDED) VALUES ('00a94bb8-d00c-4244-bdf5-2051a18af5b3', 2, '2019-12-04 15:00:23', '2019-12-04 16:00:23');

INSERT INTO PARTICIPANT_OF_CAMPAIGN (PARTICIPANTID, CAMPAIGN_ID, TIME_STARTED, TIME_ENDED) VALUES ('8063be67-7fec-47c4-a9ab-e3d03a9968b3', 3, '2019-12-04 15:00:23', '2019-12-05 18:03:23');
INSERT INTO PARTICIPANT_OF_CAMPAIGN (PARTICIPANTID, CAMPAIGN_ID, TIME_STARTED, TIME_ENDED) VALUES ('1452950a-8059-4bd1-b397-d2bd765d6b9b', 3, '2019-12-04 15:00:23', '2019-12-04 16:00:23');

INSERT INTO STATE (STATEID, STATE_NAME) VALUES (1, 'pending');
INSERT INTO STATE (STATEID, STATE_NAME) VALUES (2, 'correct');
INSERT INTO STATE (STATEID, STATE_NAME) VALUES (3, 'incorrect');

INSERT INTO GIVEN_ANSWER (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
VALUES (1, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 1, 1, 'Hello world'),
       (2, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 1, 1, 'Juist, idk'),
       (3, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 1, 2, 'A'),
       (4, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 1, 1, 'Dependency injection zorgt ervoor dat je geen handmatige injection meer hoeft te doen'),
       (5, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 1, 1, 'jazeker'),
       (6, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 1, 2, 'Beide'),
       (7, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 1, 1, 'B'),
       (8, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 1, 1, 'P'),
       (9, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 1, 1, 'n'),
       (10, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 1, 1, 'k'),
       (11, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 1, 1, 'f'),
       (12, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 1, 1, 'Waar');

insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 1, 1, 'U'),
       (2, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 1, 1, 'N'),
       (3, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 1, 2, 'Ja'),
       (4, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 1, 1, 'H'),
       (5, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 1, 1, 'p'),
       (6, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 1, 3, 'Tweede'),
       (7, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 1, 1, 'I'),
       (8, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 1, 1, 'b'),
       (9, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 1, 1, 'A'),
       (10, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 1, 1, 's'),
       (11, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 1, 1, 'L'),
       (12, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 1, 2, 'waar');

insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, '9722a79b-7494-4ef2-a56e-31a27f63911c', 1, 1, 'T'),
       (2, '9722a79b-7494-4ef2-a56e-31a27f63911c', 1, 1, 'M'),
       (3, '9722a79b-7494-4ef2-a56e-31a27f63911c', 1, 2, 'Ja'),
       (4, '9722a79b-7494-4ef2-a56e-31a27f63911c', 1, 1, 'a'),
       (5, '9722a79b-7494-4ef2-a56e-31a27f63911c', 1, 1, 'N'),
       (6, '9722a79b-7494-4ef2-a56e-31a27f63911c', 1, 2, 'Beide'),
       (7, '9722a79b-7494-4ef2-a56e-31a27f63911c', 1, 1, 'N'),
       (8, '9722a79b-7494-4ef2-a56e-31a27f63911c', 1, 1, 'i'),
       (9, '9722a79b-7494-4ef2-a56e-31a27f63911c', 1, 1, 'U'),
       (10, '9722a79b-7494-4ef2-a56e-31a27f63911c', 1, 1, 'n'),
       (11, '9722a79b-7494-4ef2-a56e-31a27f63911c', 1, 1, 'r'),
       (12, '9722a79b-7494-4ef2-a56e-31a27f63911c', 1, 2, 'Waar');

insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, '00a94bb8-d00c-4244-bdf5-2051a18af5b3', 1, 1, 'd'),
       (2, '00a94bb8-d00c-4244-bdf5-2051a18af5b3', 1, 1, 'A'),
       (3, '00a94bb8-d00c-4244-bdf5-2051a18af5b3', 1, 3, 'Nee'),
       (4, '00a94bb8-d00c-4244-bdf5-2051a18af5b3', 1, 1, 'y'),
       (5, '00a94bb8-d00c-4244-bdf5-2051a18af5b3', 1, 1, 'l'),
       (6, '00a94bb8-d00c-4244-bdf5-2051a18af5b3', 1, 3, 'Eerst'),
       (7, '00a94bb8-d00c-4244-bdf5-2051a18af5b3', 1, 1, 'J'),
       (8, '00a94bb8-d00c-4244-bdf5-2051a18af5b3', 1, 1, 'T'),
       (9, '00a94bb8-d00c-4244-bdf5-2051a18af5b3', 1, 1, 't'),
       (10, '00a94bb8-d00c-4244-bdf5-2051a18af5b3', 1, 1, 'g'),
       (11, '00a94bb8-d00c-4244-bdf5-2051a18af5b3', 1, 1, 'U'),
       (12, '00a94bb8-d00c-4244-bdf5-2051a18af5b3', 1, 3, 'Niet waar');



insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, '5ffab0bf-770d-40ea-9b31-be2a0c32ac33', 1, 1, 'I'),
       (2, '5ffab0bf-770d-40ea-9b31-be2a0c32ac33', 1, 1, 'T'),
       (3, '5ffab0bf-770d-40ea-9b31-be2a0c32ac33', 1, 3, 'Nee'),
       (4, '5ffab0bf-770d-40ea-9b31-be2a0c32ac33', 1, 1, 'G'),
       (5, '5ffab0bf-770d-40ea-9b31-be2a0c32ac33', 1, 1, 'n'),
       (6, '5ffab0bf-770d-40ea-9b31-be2a0c32ac33', 1, 3, 'Error'),
       (7, '5ffab0bf-770d-40ea-9b31-be2a0c32ac33', 1, 1, 'D'),
       (8, '5ffab0bf-770d-40ea-9b31-be2a0c32ac33', 1, 1, 'C'),
       (9, '5ffab0bf-770d-40ea-9b31-be2a0c32ac33', 1, 1, 'c'),
       (10, '5ffab0bf-770d-40ea-9b31-be2a0c32ac33', 1, 1, 'H'),
       (11, '5ffab0bf-770d-40ea-9b31-be2a0c32ac33', 1, 1, 'p'),
       (12, '5ffab0bf-770d-40ea-9b31-be2a0c32ac33', 1, 2, 'waar');

insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, 'f65a7374-1af8-4c23-8d40-1bb3cc986c04', 1, 1, 'X'),
       (2, 'f65a7374-1af8-4c23-8d40-1bb3cc986c04', 1, 1, 'P'),
       (3, 'f65a7374-1af8-4c23-8d40-1bb3cc986c04', 1, 2, 'Ja'),
       (4, 'f65a7374-1af8-4c23-8d40-1bb3cc986c04', 1, 1, 'X'),
       (5, 'f65a7374-1af8-4c23-8d40-1bb3cc986c04', 1, 1, 'I'),
       (6, 'f65a7374-1af8-4c23-8d40-1bb3cc986c04', 1, 3, 'Error'),
       (7, 'f65a7374-1af8-4c23-8d40-1bb3cc986c04', 1, 1, 'S'),
       (8, 'f65a7374-1af8-4c23-8d40-1bb3cc986c04', 1, 1, 'x'),
       (9, 'f65a7374-1af8-4c23-8d40-1bb3cc986c04', 1, 1, 'L'),
       (10, 'f65a7374-1af8-4c23-8d40-1bb3cc986c04', 1, 1, 'Y'),
       (11, 'f65a7374-1af8-4c23-8d40-1bb3cc986c04', 1, 1, 'D'),
       (12, 'f65a7374-1af8-4c23-8d40-1bb3cc986c04', 1, 2, 'waar');

insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, '080da1cc-db10-4da8-958c-fe983255cff4', 1, 1, 'H'),
       (2, '080da1cc-db10-4da8-958c-fe983255cff4', 1, 1, 'P'),
       (3, '080da1cc-db10-4da8-958c-fe983255cff4', 1, 3, 'Nee'),
       (4, '080da1cc-db10-4da8-958c-fe983255cff4', 1, 1, 'h'),
       (5, '080da1cc-db10-4da8-958c-fe983255cff4', 1, 1, 'S'),
       (6, '080da1cc-db10-4da8-958c-fe983255cff4', 1, 2, 'Beide'),
       (7, '080da1cc-db10-4da8-958c-fe983255cff4', 1, 1, 'T'),
       (8, '080da1cc-db10-4da8-958c-fe983255cff4', 1, 1, 'P'),
       (9, '080da1cc-db10-4da8-958c-fe983255cff4', 1, 1, 'd'),
       (10, '080da1cc-db10-4da8-958c-fe983255cff4', 1, 1, 'A'),
       (11, '080da1cc-db10-4da8-958c-fe983255cff4', 1, 1, 'A'),
       (12, '080da1cc-db10-4da8-958c-fe983255cff4', 1, 2, 'Waar');


insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, '6dbead39-df20-4c81-acec-eaefe11663ca', 1, 1, 'N'),
       (2, '6dbead39-df20-4c81-acec-eaefe11663ca', 1, 1, 'b'),
       (3, '6dbead39-df20-4c81-acec-eaefe11663ca', 1, 2, 'Ja'),
       (4, '6dbead39-df20-4c81-acec-eaefe11663ca', 1, 1, 'k'),
       (5, '6dbead39-df20-4c81-acec-eaefe11663ca', 1, 1, 'D'),
       (6, '6dbead39-df20-4c81-acec-eaefe11663ca', 1, 3, 'Error'),
       (7, '6dbead39-df20-4c81-acec-eaefe11663ca', 1, 1, 'r'),
       (8, '6dbead39-df20-4c81-acec-eaefe11663ca', 1, 1, 'K'),
       (9, '6dbead39-df20-4c81-acec-eaefe11663ca', 1, 1, 'r'),
       (10, '6dbead39-df20-4c81-acec-eaefe11663ca', 1, 1, 'M'),
       (11, '6dbead39-df20-4c81-acec-eaefe11663ca', 1, 1, 'c'),
       (12, '6dbead39-df20-4c81-acec-eaefe11663ca', 1, 2, 'Waar');

insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 2, 1, 'A'),
       (2, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 2, 1, 'k'),
       (3, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 2, 3, 'Nee'),
       (4, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 2, 1, 'r'),
       (5, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 2, 1, 'B'),
       (6, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 2, 2, 'Beide'),
       (7, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 2, 1, 'X'),
       (8, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 2, 1, 'd'),
       (9, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 2, 1, 'h'),
       (10, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 2, 1, 'g'),
       (11, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 2, 1, 'Q'),
       (12, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 2, 3, 'Niet waar');

insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 2, 1, 'W'),
       (2, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 2, 1, 'd'),
       (3, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 2, 2, 'Ja'),
       (4, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 2, 1, 'm'),
       (5, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 2, 1, 'I'),
       (6, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 2, 3, 'Eerste'),
       (7, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 2, 1, 'X'),
       (8, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 2, 1, 't'),
       (9, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 2, 1, 'z'),
       (10, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 2, 1, 'R'),
       (11, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 2, 1, 'e'),
       (12, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 2, 2, 'Waar');

insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, '9722a79b-7494-4ef2-a56e-31a27f63911c', 2, 1, 'E'),
       (2, '9722a79b-7494-4ef2-a56e-31a27f63911c', 2, 1, 'C'),
       (3, '9722a79b-7494-4ef2-a56e-31a27f63911c', 2, 3, 'Nee'),
       (4, '9722a79b-7494-4ef2-a56e-31a27f63911c', 2, 1, 'u'),
       (5, '9722a79b-7494-4ef2-a56e-31a27f63911c', 2, 1, 'M'),
       (6, '9722a79b-7494-4ef2-a56e-31a27f63911c', 2, 3, 'Tweede'),
       (7, '9722a79b-7494-4ef2-a56e-31a27f63911c', 2, 1, 'n'),
       (8, '9722a79b-7494-4ef2-a56e-31a27f63911c', 2, 1, 'N'),
       (9, '9722a79b-7494-4ef2-a56e-31a27f63911c', 2, 1, 'x'),
       (10, '9722a79b-7494-4ef2-a56e-31a27f63911c', 2, 1, 'e'),
       (11, '9722a79b-7494-4ef2-a56e-31a27f63911c', 2, 1, 'I'),
       (12, '9722a79b-7494-4ef2-a56e-31a27f63911c', 2, 2, 'Waar');

insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, '00a94bb8-d00c-4244-bdf5-2051a18af5b3', 2, 1, 'P'),
       (2, '00a94bb8-d00c-4244-bdf5-2051a18af5b3', 2, 1, 'Y'),
       (3, '00a94bb8-d00c-4244-bdf5-2051a18af5b3', 2, 2, 'Ja'),
       (4, '00a94bb8-d00c-4244-bdf5-2051a18af5b3', 2, 1, 'A'),
       (5, '00a94bb8-d00c-4244-bdf5-2051a18af5b3', 2, 1, 'J'),
       (6, '00a94bb8-d00c-4244-bdf5-2051a18af5b3', 2, 2, 'Beide'),
       (7, '00a94bb8-d00c-4244-bdf5-2051a18af5b3', 2, 1, 'R'),
       (8, '00a94bb8-d00c-4244-bdf5-2051a18af5b3', 2, 1, 'p'),
       (9, '00a94bb8-d00c-4244-bdf5-2051a18af5b3', 2, 1, 'a'),
       (10, '00a94bb8-d00c-4244-bdf5-2051a18af5b3', 2, 1, 'v'),
       (11, '00a94bb8-d00c-4244-bdf5-2051a18af5b3', 2, 1, 'w'),
       (12, '00a94bb8-d00c-4244-bdf5-2051a18af5b3', 2, 2, 'Waar');

insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 3, 1, 'm'),
       (2, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 3, 1, 'G'),
       (3, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 3, 2, 'Ja'),
       (4, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 3, 1, 'r'),
       (5, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 3, 1, 'S'),
       (6, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 3, 3, 'Error'),
       (7, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 3, 1, 'c'),
       (8,'8063be67-7fec-47c4-a9ab-e3d03a9968b3', 3, 1, 'a'),
       (9, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 3, 1, 'W'),
       (10, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 3, 1, 'B'),
       (11, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 3, 1, 'k'),
       (12, '8063be67-7fec-47c4-a9ab-e3d03a9968b3', 3, 2, 'Waar');

insert into given_answer (QUESTIONID, PARTICIPANTID, CAMPAIGN_ID, STATEID, GIVEN_ANSWER)
values (1, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 3, 1, 't'),
       (2, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 3, 1, 'n'),
       (3, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 3, 2, 'Ja'),
       (4, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 3, 1, 'H'),
       (5, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 3, 1, 'd'),
       (6, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 3, 3, 'Eerste'),
       (7, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 3, 1, 'y'),
       (8, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 3, 1, 'x'),
       (9, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 3, 1, 'Z'),
       (10, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 3, 1, 'f'),
       (11, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 3, 1, 'j'),
       (12, '1452950a-8059-4bd1-b397-d2bd765d6b9b', 3, 2, 'Waar');