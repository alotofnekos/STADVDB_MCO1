/*doctors*/
UPDATE doctors
SET mainspecialty = 'NA'
WHERE mainspecialty IS NULL;

UPDATE doctors
SET age = -1
WHERE age IS NULL OR age < -1;

select * from doctors;

/*px*/
UPDATE px
SET age = -1
WHERE age IS NULL OR age < -1;

select * from px;
