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
WHERE `departments`.`name` = "Dipartimento di Neuroscienze";

-- Selezionare tutti i corsi in cui insegna Fulvio Amato 
SELECT `T`.`name`, `T`.`surname`, `C`.`name`   
FROM `course_teacher` `CT`
INNER JOIN `teachers` `T`
ON `CT`.`teacher_id` = `T`.`id`
INNER JOIN `courses` `C`
ON `CT`.`course_id` = `C`.`id`
WHERE `teacher_id` = 44;

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
ORDER BY `students`.`surname`, `students`.`name`;

-- Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT 
`D`.`name` AS `degree_name`, 
`C`.`name` AS `course_name`, 
`T`.`name` AS `teacher_name`, 
`T`.`surname` AS `teacher_surname`
FROM `course_teacher` `CT`
INNER JOIN `courses` `C`
ON `C`.`id` = `CT`.`course_id`
INNER JOIN `teachers` `T`
ON `T`.`id` = `CT`.`teacher_id`
INNER JOIN `degrees` `D`
ON `D`.`id` = `C`.`degree_id`
ORDER BY `D`.`name`;

-- Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica
SELECT 
`departments`.`name` AS `department_name`,
`teachers`.`name` AS `teacher_name`,
`teachers`.`surname` AS `teacher_surname`
FROM `course_teacher`
INNER JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `courses`
ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `degrees` 
ON `degrees`.`id` = `courses`.`degree_id`
INNER JOIN `departments`
ON `departments`.`id` = `degrees`.`id`
WHERE `departments`.`name` = "Dipartimento di Matematica"
GROUP BY `teachers`.`id`
ORDER BY `teachers`.`surname`;

-- Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami
SELECT 
`S`.`name` AS `student_name`,
`S`.`surname` AS `student_surname`,
`C`.`name` AS `exam_name`,
COUNT(*) AS `attempts`
FROM `exam_student` `ES`
INNER JOIN `exams` `E`
ON `E`.`id` = `ES`.`exam_id`
INNER JOIN `students` `S`
ON `S`.`id` = `ES`.`student_id`
INNER JOIN `courses` `C`
ON `C`.`id` = `E`.`course_id`  
GROUP BY `C`.`id`, `S`.`id`
ORDER BY `S`.`surname`, `S`.`name`;