/* 1. Crear la base de datos */

create database covid_reports;

use covid_reports;

/* 2. Crear las tablas */

CREATE TABLE user (
    user_id int NOT NULL AUTO_INCREMENT,
    document_type enum('ID','PASSPORT') NOT NULL,
    document_number varchar(20) NOT NULL,
    fullname varchar(255) NOT NULL, 
    created_date datetime,
    modified_date datetime,
    PRIMARY KEY (user_id)
);


CREATE TABLE vaccine_shot (
  vaccine_shot_id int NOT NULL AUTO_INCREMENT,
  vaccine_type enum('PFIZER','J&J','SINOPHARM','ASTRAZENECA') NOT NULL,
  vaccination_date datetime NOT NULL,
  dose_number int NOT NULL,
  user_id int NOT NULL,
  created_date datetime,
  modified_date datetime,
  PRIMARY KEY (vaccine_shot_id),
  FOREIGN KEY (user_id) REFERENCES user(user_id)
);


CREATE TABLE covid_report (
    covid_report_id int NOT NULL AUTO_INCREMENT,
    latitude decimal(11,8) NOT NULL,
    longitude decimal(11,8) NOT NULL,
    public_exposure_date datetime NOT NULL,
    user_id int NOT NULL,
    created_date datetime,
    modified_date datetime,
    PRIMARY KEY (covid_report_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);


/* 3. Insertar los datos */

INSERT INTO user (user_id, document_type, document_number, fullname ,created_date, modified_date)
VALUES (1, enum('1', '987654321'),'vacuna Pfizer', 'Alireza Firouzja', NOW(), NOW());


INSERT INTO vaccine_shot (vaccine_shot_id, vaccine_type, vaccination_date, dose_number, user_id, created_date, modified_date)
VALUES (1,'PFIZER', '2021-02-01 10:00:00', 2, 1, NOW(), NOW());


INSERT INTO covid_report (covid_report_id, latitude, longitude, public_exposure_date,user_id,created_date, modified_date)
VALUES (1, -12.076778, -77.0852847, '2021-09-22 10:59:00', 1, NOW(), NOW());
