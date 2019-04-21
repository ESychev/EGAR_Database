
UPDATE states
SET s_salary = 12
WHERE s_name = 'Семенов Евгений Николаевич';

UPDATE states
SET s_salary = 12
WHERE s_employee_id BETWEEN 1 AND 3;

UPDATE states
SET s_salary = 12
WHERE  s_salary LIKE '1%';

DELETE FROM states
WHERE s_salary = 12;






SELECT* FROM insurance_agency1.premiums_insurance, insurance_agency1.list_insured
WHERE insurance_agency1.list_insured.l_insured_id=insurance_agency1.premiums_insurance.l_insured_id;

SELECT l_name_insured as 'Имя', p_insurance_premium as 'Сумма взноса',p_contribution_date as 'Дата взноса' FROM insurance_agency1.premiums_insurance, insurance_agency1.list_insured
WHERE insurance_agency1.list_insured.l_insured_id=insurance_agency1.premiums_insurance.l_insured_id;


SELECT l_name_insured as 'Имя', p_insurance_premium as 'Сумма взноса',p_contribution_date as 'Дата взноса' FROM insurance_agency1.premiums_insurance, insurance_agency1.list_insured
WHERE insurance_agency1.list_insured.l_insured_id = insurance_agency1.premiums_insurance.l_insured_id and insurance_agency1.list_insured.l_insured_id=(SELECT l_insured_id FROM insurance_agency1.list_insured WHERE l_name_insured = 'Карамзин Павел Владимирович');





