### NVL

```sql
SELECT  AVG(BONUS_PCT),
        ROUND(AVG(NVL(BONUS_PCT, 0)), 2) --NULL값을 0으로 지정하고 소숫점 3째자리에서 반올림 후, 2째자리까지 리턴
FROM    EMPLOYEE;
```



### DECODE, SUBSTR, CASE WHEN

```sql
SELECT  DECODE(SUBSTR(EMP_NO, 8, 1), 
        '1', '남자', '3', '남자', '여자'),
        AVG(SALARY)
FROM    EMPLOYEE

--> DECODE 활용
--> EMP_NO 8번째 자리가 1이나 3이면 남자, 나머진 여자
--> 남녀의 평균급여

SELECT  CASE SUBSTR(EMP_NO,8,1) 
            WHEN '1' THEN '남자'
            WHEN '3' THEN '남자'
            ELSE '여자'
        END,
        AVG(SALARY)
FROM    EMPLOYEE
GROUP BY  CASE SUBSTR(EMP_NO,8,1) 
            WHEN '1' THEN '남자'
            WHEN '3' THEN '남자'
            ELSE '여자'
        END
ORDER BY 2 DESC;

--> CASE WEHN 구문 사용
```



### TO_DATE, LAST

--입사일이 03/01/01일 이후 입사자들의 이름, 입사일, 부서번호 조회
--부서번호가 높은순으로 정렬, 같다면 입사일이 빠른순으로 정렬, 같다면 이름이 빠른순으로 정렬

```sql
SELECT  EMP_NAME, HIRE_DATE, DEPT_ID
FROM    EMPLOYEE
WHERE   HIRE_DATE > TO_DATE('03/01/01', 'YY/MM/DD')
ORDER BY DEPT_ID DESC NULLS LAST, HIRE_DATE, EMP_NAME;

-->NULLS LAST : NULL값을 맨 뒤로 정렬
```



### LIKE 응용

--9000번대 4자리 국번의 전화번호를 사용하는 직원 전화번호 조회

```sql
SELECT EMP_NAME,
       PHONE
FROM   EMPLOYEE
WHERE  PHONE LIKE '__9%';

--이메일 주소의 언더바 앞자리가 3자라인 직원 조회
SELECT EMP_NAME,
       EMAIL
FROM   EMPLOYEE
WHERE  EMAIL LIKE'___@_%'ESCAPE'@'; --_를 문자열로 지정하겠습니다.
-- like문에서 %, _, @ 등을 특수문자로 선택하고 싶을 때 ESCAPE 사용
```



### 날짜 함수

```sql
SELECT  EMP_NAME,
        HIRE_DATE,
        ADD_MONTHS(HIRE_DATE, 240)  -- 240개월 후의 값 출력
FROM    EMPLOYEE;

SELECT  MONTHS_BETWEEN (SYSDATE, '21/03/14'),
        MONTHS_BETWEEN (SYSDATE, '20/03/14'),
        MONTHS_BETWEEN (SYSDATE, '21/01/19'),
        MONTHS_BETWEEN (SYSDATE, '20/11/19')
FROM    DUAL;

--> sysdate와 작성한 날짜 사이의 차를 반환

SELECT  EMP_NAME,
        HIRE_DATE,
        MONTHS_BETWEEN (SYSDATE, HIRE_DATE)/12 AS 근무년수
FROM    EMPLOYEE
WHERE   MONTHS_BETWEEN (SYSDATE, HIRE_DATE) > 120;

--> 고용날짜와 현재날짜의 월 차이를 12로 나누면 근속년수가 된다
```



### JOIN

- 기본키와 외래키가 같을때 : USING
- 기본키와 외래키가 다를때 : ON

#### ANSI표준

```sql
SELECT  EMP_NAME, DEPT_NAME
FROM    EMPLOYEE
JOIN    DEPARTMENT USING(DEPT_ID)
WHERE   JOB_ID='J6';

SELECT  EMP_NAME, DEPT_NAME
FROM    EMPLOYEE E
JOIN    DEPARTMENT D ON(E.DEPT_ID=D.DEPT_ID)
WHERE   JOB_ID='J6';
```

#### JOIN 종류별

##### - FULL JOIN

```sql
SELECT  EMP_NAME, DEPT_ID
FROM    EMPLOYEE
FULL JOIN   DEPARTMRNT USING(DEPT_ID);
```

##### - LEFT JOIN

```sql
SELECT  EMP_NAME, DEPT_ID
FROM    EMPLOYEE
LEFT JOIN   DEPARTMENT USING(DEPT_ID);
```

##### - RIGHT JOIN

```sql
SELECT  EMP_NAME, DEPT_ID
FROM    EMPLOYEE
RIGHT JOIN  DEPARTMENT USING(DEPT_ID);
```

##### - NON EQUT JOIN

관계가 존재하지 않는 두 테이블간의 세개의 값을 가져옴

- ORACLE

```sql
SELECT  SLEVEL, EMP_NAME, SALARY
FROM    EMPLOYEE, SAL_GRADE
WHERE   SALARY BETWEEN LOWEST AND HIGHEST;
```

- ANSI

```sql
SELECT  SLEVEL, EMP_NAME, SALARY
FROM    EMPLOYEE 
JOIN    SAL_GRADE ON(SALARY BETWEEN LOWEST AND HIGHEST);
```

