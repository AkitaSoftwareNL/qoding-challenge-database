DROP TRIGGER IF EXISTS TR_participant_in_knowledge_session;

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

DROP PROCEDURE IF EXISTS SP_multiplechoice_answers;

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
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'There cannot be more or less then one correct answer';
    END IF;

    INSERT INTO multiple_choice_question
    SELECT * FROM tmp_multiple_choice_question
    WHERE QUESTIONID = question_id;

    DELETE FROM tmp_multiple_choice_question WHERE QUESTIONID = question_id;
END$$
