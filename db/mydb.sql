use mydb;
CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `section` int(55) NOT NULL,
  `teacher` int(11) NOT NULL,
  `subject` int(11) NOT NULL,
  `time` varchar(44) NOT NULL
) ;

INSERT INTO `classes` (`id`, `section`, `teacher`, `subject`, `time`) VALUES
(1, 1, 1, 1, '9:00'),
(2, 3, 2, 2, '11:30');

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `fname` varchar(55) NOT NULL,
  `lname` varchar(55) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `class` int(11) NOT NULL
) 

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `shortcut` varchar(50) NOT NULL
) ;

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `fname` varchar(55) NOT NULL,
  `lname` varchar(55) NOT NULL,
  `age` varchar(11) DEFAULT NULL
) ;

ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_id` (`subject`),
  ADD KEY `teacher_id` (`teacher`);
  
  
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_id` (`class`);

ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `classes`
  ADD CONSTRAINT `subject_id` FOREIGN KEY (`subject`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `teacher_id` FOREIGN KEY (`teacher`) REFERENCES `teachers` (`id`);

ALTER TABLE `students`
  ADD CONSTRAINT `class_id` FOREIGN KEY (`class`) REFERENCES `classes` (`id`);
COMMIT;
