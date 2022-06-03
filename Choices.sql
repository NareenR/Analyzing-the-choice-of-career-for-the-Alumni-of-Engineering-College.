## 1.Import all .csv files into MySQL
CREATE DATABASE alumni;
USE alumni;

## 3.Run SQL command to see the structure of six tables
DESC college_a_hs;
DESC college_a_se;
DESC college_a_sj;
DESC college_b_hs;
DESC college_b_se;
DESC college_b_sj;

## 6.Perform data cleaning on table College_A_HS and store cleaned data in view College_A_HS_V.
CREATE VIEW College_A_HS_V AS
    SELECT 
        *
    FROM
        college_a_hs
    WHERE HSDegree != ''
            AND Institute != ''
            AND Location != ''
            AND HSDegree NOT LIKE '.%'
            AND Institute NOT LIKE '.%'
            AND Location NOT LIKE '.%'
            AND HSDegree != 'Nil'
            AND Institute != 'Nil'
            AND Location != 'Nil'
            AND HSDegree != 'None'
            AND Institute != 'None'
            AND Location != 'None'
            AND HSDegree != '-'
            AND Institute != '-'
            AND Location != '-'
            AND HSDegree != 'Not Decided'
            AND Institute != 'Not Decided'
            AND Location != 'Not Decided';
            
## 7.Perform data cleaning on table College_A_SE and store cleaned data in view College_A_SE_V.
CREATE VIEW College_A_SE_V AS
    SELECT 
        *
    FROM
        college_a_se
    WHERE
    Organization != ''
            AND Location != ''
            AND Organization NOT LIKE '.%'
            AND Location NOT LIKE '.%'
            AND Organization != 'Nil'
            AND Location != 'Nil'
            AND Organization!= 'None'
            AND Location != 'None'
            AND Organization != '-'
            AND Location != '-'
            AND Organization != 'Not Decided'
            AND Location != 'Not Decided';
## 8.Perform data cleaning on table College_A_SJ and store cleaned data in view College_A_SJ_V.
CREATE VIEW College_A_SJ_V AS
    SELECT 
        *
    FROM
        college_a_sj
    WHERE
    Organization != ''
            AND Location != ''
            AND Designation != ''
            AND Organization NOT LIKE '.%'
            AND Location NOT LIKE '.%'
            AND Designation NOT LIKE '.%'
            AND Organization != 'Nil'
            AND Location != 'Nil'
            AND Designation != 'Nil'            
            AND Organization!= 'None'
            AND Location != 'None'
            AND Designation != 'None'
            AND Organization != '-'
            AND Location != '-'
            AND Designation != '-'
            AND Organization != 'Not Decided'
            AND Designation != 'Not Decided';
## 9.Perform data cleaning on table College_B_HS and store cleaned data in view College_B_HS_V.
CREATE VIEW College_b_HS_V AS
    SELECT 
        *
    FROM
        college_b_hs
    WHERE
    HSDegree != ''
            AND Institute != ''
            AND Location != ''
            AND HSDegree NOT LIKE '.%'
            AND Institute NOT LIKE '.%'
            AND Location NOT LIKE '.%'
            AND HSDegree != 'Nil'
            AND Institute != 'Nil'
            AND Location != 'Nil'
            AND HSDegree != 'None'
            AND Institute != 'None'
            AND Location != 'None'
            AND HSDegree != '-'
            AND Institute != '-'
            AND Location != '-'
            AND HSDegree != 'Not Decided'
            AND Institute != 'Not Decided'
            AND Location != 'Not Decided';
## 10.Perform data cleaning on table College_B_SE and store cleaned data in view College_B_SE_V.
CREATE VIEW College_B_SE_V AS
    SELECT 
        *
    FROM
        college_B_se
    WHERE
    Organization != ''
            AND Location != ''
            AND Organization NOT LIKE '.%'
            AND Location NOT LIKE '.%'
            AND Organization != 'Nil'
            AND Location != 'Nil'
            AND Organization!= 'None'
            AND Location != 'None'
            AND Organization != '-'
            AND Location != '-'
            AND Organization != 'Not Decided'
            AND Location != 'Not Decided';
## 11.Perform data cleaning on table College_B_SJ and store cleaned data in view College_B_SJ_V.
CREATE VIEW College_B_SJ_V AS
    SELECT 
        *
    FROM
        college_B_sj
    WHERE
    Organization != ''
            AND Location != ''
            AND Designation != ''
            AND Organization NOT LIKE '.%'
            AND Location NOT LIKE '.%'
            AND Designation NOT LIKE '.%'
            AND Organization != 'Nil'
            AND Location != 'Nil'
            AND Designation != 'Nil'            
            AND Organization!= 'None'
            AND Location != 'None'
            AND Designation != 'None'
            AND Organization != '-'
            AND Location != '-'
            AND Designation != '-'
            AND Organization != 'Not Decided'
            AND Designation != 'Not Decided';

## 12.Make procedure to use string function/s for converting record of Name, FatherName, MotherName into lower case for views (College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V) 

DELIMITER $$
CREATE PROCEDURE `converting`()
BEGIN
UPDATE college_a_hs_V SET Name=LOWER(name),FatherName=LOWER(FatherName),MotherName=LOWER(MotherName);
UPDATE college_a_sj_V SET Name=LOWER(name),FatherName=LOWER(FatherName),MotherName=LOWER(MotherName);
UPDATE college_a_se_V SET Name=LOWER(name),FatherName=LOWER(FatherName),MotherName=LOWER(MotherName);
UPDATE college_b_hs_V SET Name=LOWER(name),FatherName=LOWER(FatherName),MotherName=LOWER(MotherName);
UPDATE college_b_se_V SET Name=LOWER(name),FatherName=LOWER(FatherName),MotherName=LOWER(MotherName);
UPDATE college_b_sj_V SET Name=LOWER(name),FatherName=LOWER(FatherName),MotherName=LOWER(MotherName);
END $$
DELIMITER ;

call converting();

## 14.Make data summary for all six views (College_A_HS_V, College_A_SE_V, College_A_SJ_V, College_B_HS_V, College_B_SE_V, College_B_SJ_V) for demographic analysis through SQL. 

##          DATA SUMMARY OF college_A_HS_V

SELECT Location,count(*) FROM college_a_hs_v group by location;

##          DATA SUMMARY OF college_A_SE_V

SELECT Location,count(*) FROM college_a_se_v group by location;

##           DATA SUMMARY OF COLLEGE_A_SJ_V

SELECT Location,count(*) FROM college_a_sj_v group by location;

##          DATA SUMMARY OF college_B_HS_V

SELECT Location,count(*) FROM college_b_hs_v group by location;

##          DATA SUMMARY OF college_B_SE_V

SELECT Location,count(*) FROM college_b_se_v group by location;


##           DATA SUMMARY OF COLLEGE_B_SJ_V

SELECT Location,count(*) FROM college_b_sj_v group by location;



## 15. Make data summary for views (College_A_SJ_V, College_B_SJ_V) for company choices of Alumni through SQL. 


SELECT 
    College_A_SJ_V.Organization,
    COUNT(College_A_SJ_V.Name) 'College A',
    (SELECT 
            COUNT(College_B_SJ_V.Name)
        FROM
            College_B_SJ_V
        WHERE
            College_B_SJ_V.Organization = College_A_SJ_V.Organization) AS collegeB
FROM
    College_A_SJ_V
GROUP BY Organization ORDER BY COUNT(College_A_SJ_V.Name) DESC;


## 16.Make data summary for the decision of being entrepreneur of Alumni of particular domain through SQL. 

SELECT DEGREE,COUNT(*) FROM College_A_SE_V  GROUP BY Degree;

SELECT Degree,COUNT(*) FROM College_B_SE_V  GROUP BY Degree;


## 17.Analyze the choice of course after being graduated from College for College A and College B through SQL. (Use the cleaned data only)

SELECT 
    College_A_HS_V.HSDegree,
    COUNT(College_A_HS_V.Name) 'COLLEGE A',
    (SELECT 
            COUNT(College_B_HS_V.Name)
        FROM
            College_B_HS_V
        WHERE
            College_A_HS_V.HSDegree = College_B_HS_V.HSDegree) 'COLLEGE B'
FROM
    College_A_HS_V
GROUP BY HSDegree ORDER BY COUNT(College_A_HS_V.Name) DESC;

## 18.Analyze the choice of Institute after being graduated from College for College A and College B through SQL (Use the cleaned data only)


SELECT 
    College_A_HS_V.Institute,
    COUNT(College_A_HS_V.Name) 'COLLEGE A',
    (SELECT 
            COUNT(College_B_HS_V.Name)
        FROM
            College_B_HS_V
        WHERE
            College_A_HS_V.Institute = College_B_HS_V.Institute) 'COLLEGE B'
FROM
    College_A_HS_V
GROUP BY Institute ORDER BY COUNT(College_A_HS_V.Name) DESC;

## 19.Analyze the choice of higher studies in India and abroad for College A and College B through SQL (Use the cleaned data only)

SELECT 
    College_A_HS_V.COUNTRY,
    COUNT(College_A_HS_V.Name) 'COLLEGE A',
    (SELECT 
            COUNT(College_B_HS_V.Name)
        FROM
            College_B_HS_V
        WHERE
            College_A_HS_V.COUNTRY = College_B_HS_V.COUNTRY) 'COLLEGE B'
FROM
    College_A_HS_V
GROUP BY COUNTRY;

## 20.Calculate the percentage of career choice of College A and College B Alumni (w.r.t Higher Studies, Self Employed and Service/Job)

SELECT 
    'COLLEGE' " A",
    ((COUNT(College_A_HS_V.RollNo) / (COUNT(College_A_HS_V.RollNo) + (SELECT 
            COUNT(College_A_SE_V.RollNo)
        FROM
            College_A_SE_V) + (SELECT 
            COUNT(College_A_SJ_V.RollNo)
        FROM
            College_A_SJ_V))) * 100) AS HS,
    (SELECT 
            ((COUNT(College_A_SE_V.RollNo) / (COUNT(College_A_SE_V.RollNo) + (SELECT 
                        COUNT(College_A_HS_V.RollNo)
                    FROM
                        College_A_HS_V) + (SELECT 
                        COUNT(College_A_SJ_V.RollNo)
                    FROM
                        College_A_SJ_V))) * 100)
        FROM
            College_A_SE_V) AS SE,
    (SELECT 
            ((COUNT(College_A_SJ_V.RollNo) / (COUNT(College_A_SJ_V.RollNo) + (SELECT 
                        COUNT(College_A_SE_V.RollNo)
                    FROM
                        College_A_SE_V) + (SELECT 
                        COUNT(College_A_HS_V.RollNo)
                    FROM
                        College_A_HS_V))) * 100)
        FROM
            College_A_SJ_V) AS SJ
FROM
    College_A_HS_V 
UNION SELECT 
    'COLLEGE B',
    ((COUNT(College_B_HS_V.RollNo) / (COUNT(College_B_HS_V.RollNo) + (SELECT 
            COUNT(College_B_SE_V.RollNo)
        FROM
            College_B_SE_V) + (SELECT 
            COUNT(College_B_SJ_V.RollNo)
        FROM
            College_B_SJ_V))) * 100) AS HS,
    (SELECT 
            ((COUNT(College_B_SE_V.RollNo) / (COUNT(College_B_SE_V.RollNo) + (SELECT 
                        COUNT(College_B_HS_V.RollNo)
                    FROM
                        College_B_HS_V) + (SELECT 
                        COUNT(College_B_SJ_V.RollNo)
                    FROM
                        College_B_SJ_V))) * 100)
        FROM
            College_B_SE_V) AS SE,
    (SELECT 
            ((COUNT(College_B_SJ_V.RollNo) / (COUNT(College_B_SJ_V.RollNo) + (SELECT 
                        COUNT(College_B_SE_V.RollNo)
                    FROM
                        College_B_SE_V) + (SELECT 
                        COUNT(College_B_HS_V.RollNo)
                    FROM
                        College_B_HS_V))) * 100)
        FROM
            College_B_SJ_V) AS SJ
FROM
    College_B_HS_V;