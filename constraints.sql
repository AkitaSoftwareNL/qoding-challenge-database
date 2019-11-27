DROP trigger if exists TR_participant_in_knowledge_session;

DELIMITER $$
CREATE trigger TR_participant_in_knowledge_session
before insert
on
participant_of_campaign
for each row
BEGIN
  if ((select campaign.CAMPAIGN_TYPE from campaign where campaign.NAME = NEW.NAME) != 'conferentie') THEN
		if((select count(*) from knowledge_session where knowledge_session.PARTICIPANTID = NEW.PARTICIPANTID) = 0) Then
            signal sqlstate '45000' set message_text = 'no nickname available for user of knowledge session';
        end if;
  end if;
END$$

DROP procedure if exists SP_multiplechoice_answers;

DELIMITER $$
CREATE PROCEDURE SP_multiplechoice_answers (IN question_id INT)
BEGIN
    IF((SELECT ((SELECT COUNT(*)
        FROM tmp_multiple_choice_question
        where QUESTIONID = question_id)
        +
        (SELECT COUNT(*)
        FROM multiple_choice_question
        where QUESTIONID = question_id))
        ) < 2) THEN
        DELETE FROM tmp_multiple_choice_question where QUESTIONID = question_id;
        signal sqlstate '45000' set message_text = 'A multiple choice question must have two or more answers';
    end if;

    IF((SELECT ((SELECT COUNT(*)
        FROM tmp_multiple_choice_question
        where QUESTIONID = question_id AND IS_CORRECT = 1)
            +
        (SELECT COUNT(*)
        FROM multiple_choice_question
        where QUESTIONID = question_id AND IS_CORRECT = 1)))
        != 1) THEN
        DELETE FROM tmp_multiple_choice_question where QUESTIONID = question_id;
        signal sqlstate '45000' set message_text = 'There cannot be more or less then one correct answer';
    end if;

    INSERT INTO multiple_choice_question
    SELECT * FROM tmp_multiple_choice_question
    where QUESTIONID = question_id;

    DELETE FROM tmp_multiple_choice_question where QUESTIONID = question_id;
END$$
