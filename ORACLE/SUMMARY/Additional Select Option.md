# Additional Select Option

### ORDER BY

- SELECT 구문 실행 결과를 특정 컬럼 값 기준으로 정렬할 때 사용 
  -  항상 `SELECT 구문의 맨 마지막`에 위치
  - 지정한 컬럼 값을 기준으로 정렬
  - `ASC `: 오름차순(기본 값) / `DESC` : 내림차순 
  - 여러 개의 정렬 기준을 사용하면 `기술된 순서대로 적용` 
  - `컬럼 이름, 컬럼 별칭, 컬럼 기술 순서로 표현` 가능 



### GROUP BY

- GROUP BY  절에 기술한 컬럼이나 표현식을 기준으로 데이터 그룹 생성
  - 각 그룹 별로 `SELECT 절에 기술한 그룹 함수가 적용`  
  - `SELECT 절에 기술한 컬럼 중, 그룹 함수에 사용되지 않은 컬럼은 GROUP BY 절에 반드시 기술`되어야 함 
  - WHERE 절에는 그룹 함수를 사용할 수 없음 
  -  GROUP BY 절에는 컬럼 이름만 사용 가능(별칭, 순서 사용 불가) 



### HAVING

- GROUP BY에 의해 그룹화 된 데이터에 대한 `그룹 함수 실행 결과를 제한`하기 위해 사용



### JOIN

- 서로 연관되고 다른 테이블에 존재하는 컬럼들을 `한번에 조회`하기 위해 사용하는 대표적인 기법
- WHERE 절에서 JOIN 조건을 별도로 분리하고 JOIN 키워드를 명시적으로 사용

![](C:\Users\NT901X5L\Desktop\IMAGE\제목 없음.png)

- JOIN USING : 조인 조건으로 사용하는 `컬럼 이름이 동일한 경우` 사용 
- JOIN ON : 조인 조건으로 사용하는 `컬럼 이름이 서로 다른 경우` 사용 
- OUTER JOIN : `조건을 만족시키지 못하는 행까지 Result Set에 포함`시키는 조인 유형 
  - `LEFT` : `기준 테이블이 JOIN 키워드보다 먼저` 기술된 경우 
  - `RIGHT` : `기준 테이블이 JOIN 키워드보다 나중에` 기술된 경우
  - `FULL` :  `양쪽 테이블을 동시`에 OUTER JOIN하는 구문

![](C:\Users\NT901X5L\Desktop\IMAGE\제목 없음1.png)

### SET Operate

- `두 개 이상의 쿼리 결과를 하나로 결합`시키는 연산자  
- SELECT 절에 기술하는 컬럼 개수와 데이터 타입은 모든 쿼리에서 동일해야 함

![](C:\Users\NT901X5L\Desktop\IMAGE\제목 없음2.png)



### Subquery

- `하나의 쿼리가 다른 쿼리에 포함`되는 구조 
- 다른 쿼리에 포함된 내부 쿼리(서브 쿼리)는 외부 쿼리(메인 쿼리)에 사용될 값을 반환하는 역할
- 서브쿼리는 `일반적인 SQL 구문과 동일` 
- SELECT, FROM, WHERE, HAVING 절 등에서 사용 가능 
- 서브쿼리는 ( )로 묶어서표현 
- `단일 행 서브쿼리` : 단일 행 반환
  - 단일 행 비교 연산자`(=, >, >=, <, <=, <> 등)` 사용 
- `다중 행 서브쿼리` :여러 행 반환 
  - 다중 행 비교 연산자`(IN, ANY, ALL 등)` 사용
  - `NOT IN 연산자와 다중 행 서브쿼리를 함께 사용`하는 경우, `서브쿼리 결과에 NULL이 포함`되면 `전체 결과가 NULL`이 됨 --> `서브쿼리 결과에서 NULL인 경우를 제외`시켜야 함
  - `< ANY` : 비교 대상 중 최대 값 보다 작음  
  - `> ANY ` :  비교 대상 중 최소 값 보다 큼 
  - `< ALL` : 비교 대상 중 최소 값 보다 작음 
  - `> ALL` : 비교 대상 중 최대 값 보다 큼
-  `Correlated Subquery`  : 메인 쿼리에서 고려된 각 후보 행들에 대해 서브쿼리가 다른 결과를 반환해야 하는 경우(메인 쿼리에서 처리되는 각 행의 값에 따라 응답이 달라져야 하는 경우)에 유용

- `Subquery - EXISTS, NOT EXISTS` : 결과에 포함되는지의 여부를 확인해야 하는 경우에 유용한 연산자 
- 존재 여부에 따라 `TRUE 값을 반환`

