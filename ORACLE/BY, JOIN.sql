--ORDER BY
SELECT  EMP_NAME, SALARY
FROM    EMPLOYEE
WHERE   DEPT_ID='50'
OR      DEPT_ID IS NULL
ORDER BY SALARY DESC;

SELECT  EMP_NAME, HIRE_DATE, DEPT_ID
FROM    EMPLOYEE
WHERE   HIRE_DATE > TO_DATE('20030101', 'YYYYMMDD')
ORDER BY DEPT_ID DESC, HIRE_DATE, EMP_NAME;

SELECT  EMP_NAME AS 이름,
        HIRE_DATE AS 입사일,
        DEPT_ID AS 부서코드
FROM    EMPLOYEE
WHERE  HIRE_DATE > TO_DATE('20030101', 'YYYYMMDD')
ORDER BY 부서코드 DESC, 입사일, 이름;

SELECT  EMP_NAME AS 이름,
        HIRE_DATE AS 입사일,
        DEPT_ID AS 부서코드
FROM    EMPLOYEE
WHERE  HIRE_DATE > TO_DATE('20030101', 'YYYYMMDD')
ORDER BY 3 DESC, 2, 1;

--GROUP BY
--오류 : GROUP BY에서 DEPT_ID만 명시해줬기 때문에 SELECT절엔 EMP_NAME이 들어갈 수 없음!!
SELECT  EMP_NAME, DEPT_ID, COUNT(*) 
FROM    EMPLOYEE
GROUP BY DEPT_ID;

--수정구문
SELECT  EMP_NAME, DEPT_ID, COUNT(*)
FROM    EMPLOYEE
GROUP BY EMP_NAME, DEPT_ID;

--HAVING : 그룹화된 데이터에 대한 실행결과 제한
--오류 : 그룹함수는 WHERE절에 사용 불가!!
SELECT  DEPT_ID, SUM(SALARY)
FROM    EMPLOYEE
WHERE   SUM(SALARY) > 900000
GROUP BY DEPT_ID;

--수정구문
SELECT  DEPT_ID, SUM(SALARY)
FROM    EMPLOYEE
GROUP BY DEPT_ID
HAVING  SUM(SALARY) > 900000;

--JOIN : 테이블이 다를때 두 컬럼을 한번에 볼 수 있음
--ORACLE전용
SELECT  EMP_NAME, DEPT_NAME, E.DEPT_ID --NULL인 DEPT_ID는 누락됨
FROM    EMPLOYEE E,
        DEPARTMENT D
WHERE   E.DEPT_ID = D.DEPT_ID; --공통적

--ORCLE전용에서도 ANSI처럼 OUTER JOIN을 쓸 수 있음
--FULL은 사용X
SELECT  EMP_NAME, DEPT_NAME, E.DEPT_ID
FROM    EMPLOYEE E,
        DEPARTMENT D
WHERE   E.DEPT_ID(+) = D.DEPT_ID; --(+)기호가 붙은 반대쪽이 모두 출력

SELECT  EMP_NAME, DEPT_NAME, E.DEPT_ID
FROM    EMPLOYEE E,
        DEPARTMENT D
WHERE   E.DEPT_ID = D.DEPT_ID(+);
--기본키와 외래키가 같을때 : USING
--기본키와 외래키가 다를때 : ON
--ANSI표준
SELECT  EMP_NAME, DEPT_NAME
FROM    EMPLOYEE
JOIN    DEPARTMENT USING(DEPT_ID)
WHERE   JOB_ID='J6';

SELECT  EMP_NAME, DEPT_NAME
FROM    EMPLOYEE E
JOIN    DEPARTMENT D ON(E.DEPT_ID=D.DEPT_ID)
WHERE   JOB_ID='J6';

--기본키와 외래키의 이름이 다를때(3개의 테이블)
SELECT  EMP_NAME, DEPT_NAME, LOC_DESCRIBE
FROM    EMPLOYEE E
JOIN    DEPARTMENT D USING(DEPT_ID)
JOIN    LOCATION L ON(L.LOCATION_ID=D.LOC_ID);

--OUTER JOIN :RESULT행의 값에 포함되지 않는 것들을 표시
SELECT  EMP_NAME, DEPT_ID
FROM    EMPLOYEE
FULL JOIN   DEPARTMRNT USING(DEPT_ID);

SELECT  EMP_NAME, DEPT_ID
FROM    EMPLOYEE
LEFT JOIN   DEPARTMENT USING(DEPT_ID);

SELECT  EMP_NAME, DEPT_ID
FROM    EMPLOYEE
RIGHT JOIN  DEPARTMENT USING(DEPT_ID);

--관계가 존재하지 않는 두 테이블간의 세개의 값을 가져옴
--NON EQUT JOIN
SELECT  *
FROM    SAL_GRADE;
--ORACLE
SELECT  SLEVEL, EMP_NAME, SALARY
FROM    EMPLOYEE, SAL_GRADE
WHERE   SALARY BETWEEN LOWEST AND HIGHEST;

--ANSI
SELECT  SLEVEL, EMP_NAME, SALARY
FROM    EMPLOYEE 
JOIN    SAL_GRADE ON(SALARY BETWEEN LOWEST AND HIGHEST);

--EMPLOYEE의 논리적인 테이블
--SELF JOIN : 같은 테이블을 서로 다른 별칭을 줘서 사용
SELECT  E.EMP_NAME, M.EMP_NAME, S.EMP_NAME
FROM    EMPLOYEE E
LEFT JOIN    EMPLOYEE M ON(E.MGR_ID=M.EMP_ID)
LEFT JOIN    EMPLOYEE S ON(M.MGR_ID=S.EMP_ID)
ORDER BY 1SPQ;

--EXAM
SELECT  E.EMP_NAME, E.SALARY, J.JOB_TITLE, S.SLEVEL, D.DEPT_NAME, L.LOC_DESCRIBE, C.COUNTRY_NAME
FROM    EMPLOYEE E
JOIN    JOB J USING(JOB_ID)
JOIN    SAL_GRADE S ON(E.SALARY BETWEEN LOWEST AND HIGHEST)
JOIN    DEPARTMENT D USING(DEPT_ID)
JOIN    LOCATION L ON(L.LOCATION_ID=D.LOC_ID)
JOIN    COUNTRY C USING(COUNTRY_ID);

--직급이 대리이고 지역이 '아시아'로 시작하는 필터링
SELECT  E.EMP_NAME, E.SALARY, J.JOB_TITLE, S.SLEVEL, D.DEPT_NAME, L.LOC_DESCRIBE, C.COUNTRY_NAME
FROM    EMPLOYEE E
JOIN    JOB J USING(JOB_ID)
JOIN    SAL_GRADE S ON(E.SALARY BETWEEN LOWEST AND HIGHEST)
JOIN    DEPARTMENT D USING(DEPT_ID)
JOIN    LOCATION L ON(L.LOCATION_ID=D.LOC_ID)
JOIN    COUNTRY C USING(COUNTRY_ID)
WHERE   JOB_TITLE = '대리' AND LOC_DESCRIBE LIKE '아시아%';







