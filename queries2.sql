-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `S`.`name`, `S`.`surname`, `S`.`registration_number` , `D`.`name`
FROM `students` `S`
INNER JOIN `degrees` `D`
ON `D`.`id` = `S`.`degree_id`
WHERE `D`.`name` = "Corso di Laurea in Economia";