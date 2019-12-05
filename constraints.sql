use qodingchallenge;

DROP TRIGGER IF EXISTS TR_participant_in_knowledge_session;
DROP PROCEDURE IF EXISTS SP_multiplechoice_answers;
DROP PROCEDURE IF EXISTS SP_MultipleChoiceQuestion; 

/*---------------------------------------------------------- */

DELIMITER $$
CREATE TRIGGER TR_participant_in_knowledge_session
BEFORE INSERT
ON
participant_of_campaign
FOR EACH ROW
BEGIN
  IF ((SELECT campaign.CAMPAIGN_TYPE FROM campaign WHERE campaign.CAMPAIGN_ID = NEW.CAMPAIGN_ID) != 'conferentie') THEN
		IF ((SELECT count(*) FROM knowledge_session WHERE knowledge_session.PARTICIPANTID = NEW.PARTICIPANTID) = 0) Then
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'no nickname available for user of knowledge session';
        END IF;
  END IF;
END$$

/*---------------------------------------------------------- */

DELIMITER $$
CREATE PROCEDURE SP_multiplechoice_answers (IN question_id INT)
BEGIN
    IF((SELECT ((SELECT COUNT(*)
        FROM tmp_multiple_choice_question
        WHERE QUESTIONID = question_id)
        +
        (SELECT COUNT(*)
        FROM multiple_choice_question
        WHERE QUESTIONID = question_id))
        ) < 2) THEN
        DELETE FROM tmp_multiple_choice_question where QUESTIONID = question_id;
        DELETE FROM question WHERE QUESTIONID = question_id;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A multiple choice question must have two or more answers';
    END IF;

    IF((SELECT ((SELECT COUNT(*)
        FROM tmp_multiple_choice_question
        WHERE QUESTIONID = question_id AND IS_CORRECT = 1)
            +
        (SELECT COUNT(*)
        FROM multiple_choice_question
        WHERE QUESTIONID = question_id AND IS_CORRECT = 1)))
        != 1) THEN
        DELETE FROM tmp_multiple_choice_question where QUESTIONID = question_id;
        DELETE FROM question WHERE QUESTIONID = question_id;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'There cannot be more or less then one correct answer';
    END IF;

    INSERT INTO multiple_choice_question
    SELECT * FROM tmp_multiple_choice_question
    WHERE QUESTIONID = question_id;

    DELETE FROM tmp_multiple_choice_question WHERE QUESTIONID = question_id;
END$$

/*---------------------------------------------------------- */

DELIMITER $$
CREATE PROCEDURE SP_MultipleChoiceQuestion(IN category_name VARCHAR(255), IN question VARCHAR(255), IN QUESTION_TYPE VARCHAR(255), 
IN ATTACHMENT VARCHAR(4096), IN possibleAnswers VARCHAR(4096), IN is_correct VARCHAR(255), IN amount INT, IN answerSeparator VARCHAR(255))
BEGIN
    DECLARE subStringAnswer VARCHAR(255);
    DECLARE subStringIsCorrect VARCHAR(255);
    DECLARE i INT;
    DECLARE questionID INT;

    SET i = 1;
    
	INSERT INTO question(category_name, question, question_type, attachment) values (category_name, question, QUESTION_TYPE, ATTACHMENT);
    
	SET questionID = (SELECT LAST_INSERT_ID());
    
    loop_label: LOOP
		IF i > amount THEN
			LEAVE loop_label;
		END IF;
		
        SET i = i + 1;
		
        SET subStringAnswer = REPLACE(SUBSTRING(SUBSTRING_INDEX(possibleAnswers, answerSeparator, i), 
										LENGTH(SUBSTRING_INDEX(possibleAnswers, answerSeparator, i -1)) + 1), answerSeparator, '');
        SET subStringIsCorrect = REPLACE(SUBSTRING(SUBSTRING_INDEX(is_correct, answerSeparator, i), 
										LENGTH(SUBSTRING_INDEX(is_correct, answerSeparator, i -1)) + 1), answerSeparator, '');

		INSERT INTO tmp_multiple_choice_question(QUESTIONID, ANSWER_OPTIONS, IS_CORRECT) values (questionID, subStringAnswer, subStringIsCorrect);
		
	END LOOP;  
    CALL SP_multiplechoice_answers(questionID);
END $$
DELIMITER ;

/*---------------------------------------------------------- */

