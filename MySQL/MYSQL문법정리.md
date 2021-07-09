# MYSQL



### ROLLUP - 그룹핑 된 것을 집계하기 위한 함수



```mariadb
*--1. ROLLUP 없을 때* 
SELECT JOB_ID , SUM(SALARY)  
FROM EMPLOYEES e  
GROUP BY JOB_ID 
ORDER BY JOB_ID;

 *--2. ROLLUP 썼을 때* 
SELECT JOB_ID , SUM(SALARY)  
FROM EMPLOYEES e  
GROUP BY JON_ID WITH ROLLUP 	# JOB_ID 제외하고 계산해!
ORDER BY JOB_ID;
```



![image-20210703182045313](C:\Users\kmj94\AppData\Roaming\Typora\typora-user-images\image-20210703182045313.png)

-> ROLLUP을 사용하면 행이 한 줄 추가됨을 알 수 있다.

691,416은 SUM(SALARY)를 의미.