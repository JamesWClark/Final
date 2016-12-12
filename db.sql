CREATE DATABASE mytasks;

USE mytasks;

CREATE TABLE IF NOT EXISTS tasks (
  task_id       INT(11)             NOT NULL AUTO_INCREMENT,
  subject       VARCHAR(45)         DEFAULT NULL,
  start_date    DATE                DEFAULT NULL,
  end_date      DATE                DEFAULT NULL,
  description   VARCHAR(200)        DEFAULT NULL,
  PRIMARY KEY (task_id)
) ENGINE=InnoDB;

INSERT INTO tasks(subject, description)
VALUES('kitchen','do the dishes; take out trash');