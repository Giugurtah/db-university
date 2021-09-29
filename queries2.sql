-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `S`.`name`, `S`.`surname`, `S`.`registration_number` , `D`.`name`
FROM `students` `S`
INNER JOIN `degrees` `D`
ON `D`.`id` = `S`.`degree_id`
WHERE `D`.`name` = "Corso di Laurea in Economia";

-- Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT `degrees`.`id`, `degrees`.`name`, `degrees`.`level`, `departments`.`name`
FROM `degrees`
INNER JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` = "Dipartimento di Neuroscienze"

-- Selezionare tutti i corsi in cui insegna Fulvio Amato 
SELECT `T`.`name`, `T`.`surname`, `C`.`name`   
FROM `course_teacher` `CT`
INNER JOIN `teachers` `T`
ON `CT`.`teacher_id` = `T`.`id`
INNER JOIN `courses` `C`
ON `CT`.`course_id` = `C`.`id`
WHERE `teacher_id` = 44

-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT 
`students`.`surname`, 
`students`.`name`, 
`students`.`registration_number`, 
`degrees`.`name` AS `degree name`, 
`departments`.`name` AS `department name`
FROM `students` 
INNER JOIN `degrees`
ON `degrees`.`id` = `students`.`degree_id`
INNER JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `students`.`surname`, `students`.`name`