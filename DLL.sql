DELETE
FROM campaign_type;
DELETE
FROM STATE;
DELETE
FROM question_type;
DELETE
FROM category;

ALTER TABLE campaign
    AUTO_INCREMENT = 1;
ALTER TABLE question
    AUTO_INCREMENT = 1;
ALTER TABLE question_type
    AUTO_INCREMENT = 1;

INSERT INTO category (CATEGORY_NAME)
VALUES ('JAVA');
INSERT INTO category (CATEGORY_NAME)
VALUES ('.NET');
INSERT INTO category (CATEGORY_NAME)
VALUES ('Python');

INSERT INTO campaign_type (CAMPAIGN_TYPE)
VALUES ('conferentie');
INSERT INTO CAMPAIGN_TYPE (CAMPAIGN_TYPE)
VALUES ('kennissessie');


INSERT INTO question_type (TYPE) VALUES ('open'), ('multiple'), ('program'), ('total');

INSERT INTO STATE (STATEID, STATE_NAME)
VALUES (1, 'pending');
INSERT INTO STATE (STATEID, STATE_NAME)
VALUES (2, 'correct');
INSERT INTO STATE (STATEID, STATE_NAME)
VALUES (3, 'incorrect');