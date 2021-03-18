--1. ������б��� �а� �̸��� �迭�� ǥ���Ͻÿ�. ��, ��� ����� "�а� ��", "�迭" ���� ǥ���ϵ��� �Ѵ�. 
SELECT DEPARTMENT_NAME AS "�а� ��",
       CATEGORY AS �迭
FROM   TB_DEPARTMENT;

--2. �а��� �а� ������ ������ ���� ���·� ȭ�鿡 ����Ѵ�.
--�а��� ����
--------------------
--������а��� ������ 20�� �Դϴ�.
SELECT DEPARTMENT_NAME||'�� ������'||CAPACITY||'�� �Դϴ�.'
FROM   TB_DEPARTMENT;

-- 3. "������а�" �� �ٴϴ� ���л� �� ���� �������� ���л��� ã�ƴ޶�� ��û�� ���Դ�. �����ΰ�?
--(�����а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� ã�� ������ ����)/ 001
SELECT STUDENT_NAME
FROM   TB_STUDENT
WHERE  DEPARTMENT_NO=001 
AND    ABSENCE_YN='Y';

--4. ���������� ���� ���� ��� ��ü�� ���� ã�� �̸��� �Խ��ϰ��� �Ѵ�. 
--�� ����ڵ��� �й��� ������ ���� �� ����ڵ��� ã�� ������ SQL ������ �ۼ��Ͻÿ�. 
--A513079, A513090, A513091, A513110, A513119 
SELECT STUDENT_NAME
FROM   TB_STUDENT
WHERE  STUDENT_NO IN('A513079','A513090','A513091','A513110','A513119');

--5. ���������� 20 �� �̻� 30�� ������ �а����� �а� �̸��� �迭�� ����Ͻÿ�.
SELECT DEPARTMENT_NAME, CATEGORY
FROM   TB_DEPARTMENT
WHERE  CAPACITY BETWEEN 20 AND 30;

-- 6. ������б��� ������ �����ϰ� ��� �������� �Ҽ� �а��� ������ �ִ�.  
--������б� ������ �̸��� �˾Ƴ� �� �ִ� SQL ������ �ۼ��Ͻÿ�. 
SELECT PROFESSOR_NAME
FROM   TB_PROFESSOR
WHERE  DEPARTMENT_NO IS NULL;

--7. ������� ������ �а��� �����Ǿ� ���� ���� �л��� �ִ��� Ȯ���ϰ��� �Ѵ�.
SELECT STUDENT_NAME
FROM   TB_STUDENT
WHERE  DEPARTMENT_NO IS NULL;

--8. ������û�� �Ϸ��� �Ѵ�. 
--�������� ���θ� Ȯ���ؾ� �ϴµ�, ���������� �����ϴ� ������� � �������� �����ȣ�� ��ȸ�غ��ÿ�.
SELECT CLASS_NO
FROM   TB_CLASS
WHERE  PREATTENDING_CLASS_NO IS NOT NULL;

--9. �� ���п��� � �迭(CATEGORY)���� �ִ��� ��ȸ�غ��ÿ�.
SELECT DISTINCT CATEGORY
FROM   TB_DEPARTMENT;

--10. 02 �й� ���� �����ڵ��� ������ ������� �Ѵ�. 
--������ ������� ������ �������� �л����� �й�, �̸�, �ֹι�ȣ�� ����ϴ� ������ �ۼ��Ͻÿ�. 
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_SSN
FROM   TB_STUDENT
WHERE  STUDENT_ADDRESS LIKE '����%' AND ENTRANCE_DATE LIKE '02%'
AND    ABSENCE_YN!='Y'