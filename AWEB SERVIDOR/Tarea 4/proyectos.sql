

CREATE DATABASE `proyectos`;
USE `proyectos`;

CREATE TABLE `users`(
   `user_id` int(10) NOT NULL AUTO_INCREMENT,
   `username` varchar(10) NOT NULL,
   `password` char(32) NOT NULL,
   PRIMARY KEY (`user_id`)
);

CREATE TABLE `groups`(
   `group_id` int(10) NOT NULL AUTO_INCREMENT,
   `group_name` varchar(20) NOT NULL,
   PRIMARY KEY (`group_id`)
);

CREATE TABLE `user_groups` (
   `user_id` int(10) NOT NULL,
   `group_id` int(10) NOT NULL,
   PRIMARY KEY (`user_id`,`group_id`)
);


CREATE VIEW `v_user_role` AS
   SELECT u.username, u.password, g.group_name
   FROM `user_groups`ug
      INNER JOIN `users`u on u.user_id = ug.user_id
      INNER JOIN `groups` g ON g.group_id = ug.group_id;

INSERT INTO `groups` (`group_name`) VALUES
   ('jefeproyecto'), ('programador');

INSERT INTO `users` (`username`,`password`) VALUES
   ('Liskova','5sPaWyBmNNfz81htdH/9s2tcZ1dXs4DGpf5cVwxxQ0k='), 
   ('Ullmanova','G6PRbpiBlZ+MmpdihU9yxuYyHN1ENYoQpOk5AzEX6rk='),
   ('Turinova','OstZMG725mDPgy0dNMT7o9iNYW8LtcKp4PgtGO9vwWc='),
   ('Newmanova','pBe13D0G0V2Rxmh+J/wXBevFazstgTq+AwZuVkP+TnQ=');

INSERT INTO `user_groups` (`user_id`,`group_id`) VALUES
   (1,1),(2,2),(3,2),(4,2);


CREATE TABLE `proyectos`(
   `pr_id` int(10) NOT NULL AUTO_INCREMENT,
   `nombre` varchar(50) NOT NULL,
   PRIMARY KEY (`pr_id`)
);


CREATE TABLE `tareas`(
   `ta_id` int(10) NOT NULL AUTO_INCREMENT,
   `nombre` varchar(50) NOT NULL,
   `pr_id` int(10) NOT NULL,
   `fechalimite` DATE NOT NULL,
   `user_id` int(10) NOT NULL,
   `fechafinalizacion` DATE,
   PRIMARY KEY (`ta_id`)
);


GRANT ALL ON proyectos.* TO 'webapp'@'localhost' identified by 'webapppasswd';

