



create database Insurance_agency;
/* Create Tables */



use Insurance_agency;
CREATE TABLE `states`
(
	`s_employee_id` int UNSIGNED NOT NULL ,
	`s_name` VARCHAR(150) NOT NULL,
	`s_position` VARCHAR(150) NOT NULL,
	`s_education` VARCHAR(150) NOT NULL,
    `s_work_experience` VARCHAR(150) NOT NULL,
	CONSTRAINT `PK_states` PRIMARY KEY (`s_employee_id`)
)

;
ALTER TABLE `states`
ADD `s_salary` INT NOT NULL;

CREATE TABLE `types_insurance`
(
	`t_insurance_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
	`t_insurance_name` VARCHAR(150) NOT NULL,
    `t_note` VARCHAR(150) NOT NULL,
	CONSTRAINT `PK_types_insurance` PRIMARY KEY (`t_insurance_id`)
)

;

CREATE TABLE `list_insured`
(
	`l_insured_id` int UNSIGNED NOT NULL ,
	`l_name_insured` VARCHAR(150) NOT NULL,
	`l_address` VARCHAR(150) ,
	`t_insurance_id` int UNSIGNED NOT NULL,
    `l_sum_insured` int NOT NULL, 
	`s_employee_id` int  UNSIGNED NOT NULL,
    `l_insurance_date` DATE NOT NULL,
	CONSTRAINT `PK_list_insured` PRIMARY KEY (`l_insured_id`),
	FOREIGN KEY (s_employee_id) REFERENCES states(s_employee_id) ON DELETE Cascade ON UPDATE Cascade, 
    FOREIGN KEY (t_insurance_id) REFERENCES types_insurance(t_insurance_id) ON DELETE Cascade ON UPDATE Cascade
	
)

;
CREATE TABLE `premiums_insurance`
(
	`prem_ins_id` int UNSIGNED NOT NULL ,
	`l_insured_id` int UNSIGNED NOT NULL ,
	`p_insurance_period` int UNSIGNED NOT NULL ,
	`p_insurance_premium` int UNSIGNED NOT NULL ,
    `p_contribution_date` DATE NOT NULL,
	CONSTRAINT `PK_premiums_insurance ` PRIMARY KEY (`prem_ins_id`),
    FOREIGN KEY (l_insured_id) REFERENCES list_insured(l_insured_id) ON DELETE Cascade ON UPDATE Cascade
    
)

;
CREATE TABLE `indemnities_insurance`
(
	`indemn_ins_id` int UNSIGNED NOT NULL ,
	`l_insured_id` int UNSIGNED NOT NULL ,
	`t_insurance_id` int UNSIGNED NOT NULL ,
	`indem_amount_payment` int UNSIGNED NOT NULL ,
    `indem_payment_date` DATE NOT NULL,
	CONSTRAINT `PK_indemnities_insurance ` PRIMARY KEY (`indemn_ins_id`),
    FOREIGN KEY (l_insured_id) REFERENCES list_insured(l_insured_id) ON DELETE Cascade ON UPDATE Cascade
)

;

INSERT INTO `states` (`s_employee_id`, `s_name`, `s_position`, `s_education`, `s_work_experience`, `s_salary`)
VALUES
(1, 'Семенов Евгений Николаевич', 'Директор','Высшее','10 лет', 20000),
(2, 'Краснов Петр Сергеевич', 'Заместитель директора','Высшее','5 лет', 10000),
(3, 'Белый Юрий Анатольевич', 'Страховой агент','Высшее','7 лет', 2000),
(4, 'Семцова Лариса Михайловна', 'Бухгалтер','Высшее','5 лет', 1500),
(5, 'Семцов Варилерий Михайлович', 'Страховой агент','Высшее','10 лет', 2000);


INSERT INTO `types_insurance` (`t_insurance_id`, `t_insurance_name`, `t_note`)
VALUES
(1, 'Страхование от несчастных случаев',' Скидка 20%'),
(2, 'Страхование от пожара',' До 1000 рублей'),
(3, 'Страхование от угона','При наличии ключей у владельца'),
(4, 'Страхование риска ','До 5000 уе'),
(5, 'Страхование поездки за границу','До 5000 уе');



INSERT INTO `list_insured` (`l_insured_id`,`l_name_insured`, `l_address`, `t_insurance_id`, `l_sum_insured`, `s_employee_id`, `l_insurance_date`)
VALUES
(1, 'Карамзин Павел Владимирович', 'ул. Советская д 2, кв 3'       ,1,1032 ,          3,             '2011-02-12'),
(2, 'Петровский Кирил Владимирович', 'ул. Кирова д 3. кв 1'        ,2,1000 ,        5,           '2019-04-12'),
(3, 'Карамзинович Павел Владимирович', 'ул. Кирова д 15. кв15'     ,3,10020,       5,          '2018-01-12'),
(4, 'Богданович Павел Семенович', 'ул. Малайчука д 12. кв 12'      ,4,10120 ,        5,           '2019-02-12'),
(5, 'Шолохов Семен Владимирович', 'ул. Мазурова д 11 кв 21'         ,5,1010 ,          3,             '2017-01-12'),
(6, 'Касперский Григорий Александрович', 'ул.Тимофеенко д 54 кв 14' ,2,10340 ,        3,    '2019-03-12');



INSERT INTO `premiums_insurance` (`prem_ins_id`, `l_insured_id`, `p_insurance_period`, `p_insurance_premium`, `p_contribution_date`)
VALUES
(1,1,20, 14, '2019-01-12'),
(2,2,10 , 51, '2019-04-12'),
(3,3,15, 15, '2018-01-12'),
(4,4,21 , 34, '2019-02-12'),
(5,5,20 , 24, '2017-01-12'),
(6,2,28 , 25, '2019-03-12');


INSERT INTO `indemnities_insurance` (`indemn_ins_id`,`l_insured_id`, `t_insurance_id`, `indem_amount_payment`, `indem_payment_date`)
VALUES
(1, 1,1032 , 3, '2019-02-01'),
(2, 2,1000 , 5, '2019-04-22'),
(3, 3,10020, 5, '2018-01-27'),
(4, 4,10120 , 5, '2019-03-04'),
(5, 5,1010 , 3, '2017-02-05'),
(6, 2,10340 , 3, '2019-04-15');




