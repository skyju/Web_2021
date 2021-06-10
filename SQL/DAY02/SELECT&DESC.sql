-- 2021.06.09
-- SQL Basic: SELECT 

-- 계정 HR이 권한을 가진 테이블 객체 리스트
SELECT * FROM TAB;

-- 테이블의 정보를 검색 : 컬럼의 이름, NULL허용 유무, 타입, 사이즈
DESC DEPT;


--EMP 테이블과 DEPT 테이블을 이용해서 풀이해 주세요.
​-- 테이블에서 원하는 행의 컬럼의 값을 추출하는것
-- select {컬럼명,...} from 테이블 이름 where 조건 -> 원하는 행, 열을 표현 -> 결과 : 테이블


--1. 덧셈연산자를 이용하여 모든 사원에 대해서 $300의 급여 인상을 계산한 후 사원의 이름, 급여, 인상된 급여를 출력하시오.

select ename, sal, sal+300 as addsal
from emp
;


--2. 사원의 이름, 급여, 연간 총 수입을 
--   총 수입이 많은 것부터 작은 순으로 출력하시오, 
--   연간 총수입은 월급에 12를 곱한 후 $100의 상여금을 더해서 계산하시오.

select ename, sal, sal*12+100 as income
from emp
order by income desc
;
​

--3. 급여가 2000을 넘는 사원의
--   이름과 급여를 표현, 
--   급여가 많은 것부터 작은 순으로 출력하시오.

select ename, sal
from emp
where sal > 2000
order by sal desc
;

​
--4. 사원번호가 7788인 사원의 이름과 부서번호를 출력하시오.

select ename, deptno
from emp
where empno=7788
;

​
--5. 급여가 2000에서 3000 사이에 포함되지 않는 사원의 -> 범위 : between 또는 논리연산
--   이름과 급여를 출력하시오.

select ename, sal
from emp
where sal not between 2000 and 3000
;

select ename, sal 
from emp
where not ( sal>=2000 and sal<=3000 )
;


--6. 1981년 2월 20일 부터 1981년 5월 1일 사이에 입사한 사원의 -> 날짜의 범위
--   이름, 담당업무, 입사일을 출력하시오.

select ename, job, hiredate
from emp
where hiredate between '81/02/20' and '81/05/01'
;
​

--7. 부서번호가 20 및 30에 속한 사원의  -> 행의 조건
--   이름과 부서번호를 출력,            -> 출력 컬럼
--   이름을 기준(내림차순)으로 영문자순으로 출력하시오.  --> 정렬

select ename, deptno
from emp
--where deptno=20 or deptno=30
where deptno in (20, 30)
order by ename desc
;

-- 이름이 'SCOTT'인 사원을 출력
select *
from emp
where ename = 'SCOTT';

-- 소문자로 검색하면 인식 못함
select *
from emp
where ename = 'scott';

-- 날짜 타입의 데이터 비교시에도 작은 따옴표를 사용해야 함
select *
from emp
where hiredate = '96/11/17';

​
--8. 사원의 급여가 2000에서 3000사이에 포함되고  --> 조건 1   and
--   부서번호가 20 또는 30인 사원의             --> 조건 2
--   이름, 급여와 부서번호를 출력, 
--   이름순(오름차순)으로 출력하시오. 

select ename, sal, deptno
from emp
where (sal>=2000 and sal<=3000) and (deptno=20 or deptno=30)
order by ename 
;

-- 논리 연산자: and, or, not
-- 10번 부서의 관리자를 찾아 출력
select *
from emp
where deptno = 10 and job = 'MANAGER';

-- 10번 부서의 직원들과 관리자들의 리스트를 출력
SELECT *
FROM EMP
WHERE DEPTNO = 10 OR JOB = 'MANAGER'
ORDER BY DEPTNO ASC;

-- 10번 부서의 직원을 제외한 나머지 직원들 출력 (20,30)
SELECT *
FROM EMP
WHERE NOT DEPTNO = 10
ORDER BY DEPTNO ASC;

-- 범위 연산을 할 때
    -- 1) 논리연산자
    -- 2) BETWENN A AND B : A 이상 B 이하
-- 2000이상 3000 이하의 급여를 받는 직원 리스트
SELECT ENAME, JOB, SAL, SAL*1.1 AS ADDSAL
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

-- 날짜에도 적용해서 기간 검색할 수 있음
SELECT *
FROM EMP
WHERE HIREDATE BETWEEN '1997/01/01' AND '1997/12/31';

SELECT *
FROM EMP
WHERE HIREDATE >= '1997/01/01' AND HIREDATE <= '1997/12/31'
ORDER BY HIREDATE;

--9. 1981년도에 입사한 사원의 이름과 입사일을 출력하시오. (like 연산자와 와일드카드 사용)
-- '81/01/01'  -> 81로 시작 뒤에 오는 문자열은 0이상의 문자열이 올 수 있는 조건
-- like '81%'

select ename, hiredate
from emp
where hiredate like '81%'
;

--10. 관리자가 없는 사원의 이름과 담당 업무를 출력하시오.
-- null : 있는것도 아니고 없는것도 아닌 데이터 연산의 결과도 null , 비교연산 불가, 산술연산 불가
-- is null / is not null

select ename, job 
from emp
where mgr is null
;

​
--11. 커미션을 받을 수 있는 자격이 되는 
--    사원의 이름, 급여, 커미션을 출력하되 
--    급여 및 커미션을 기준으로 내림차순 정렬하여 표시하시오.

select ename, sal, comm
from emp
where comm is not null and comm>0
order by sal desc, comm desc
;

​
--12. 이름의 세번째 문자가 R인 사원의 이름을 표시하시오.
--   OOROOOOOO -> like '__R%'

select ename
from emp
where ename like '__R%'
--where ename like '__R___'
;


--13. 이름에 A와 E를 모두 포함하고 있는 사원의 이름을 표시하시오.

select ename
from emp
where ename like '%A%' and ename like '%E%'
;
​

--14. 담당업무가 CLERK, 또는 SALESMAN이면서  -- (or) and
--    급여가 $1600, $950 또는 $1300이 아닌 사원의  -- not (or) 
--    이름, 담당업무, 급여를 출력하시오.

select ename, job, sal
from emp
where ( job in ('CLERK', 'SALESMAN') ) and ( sal not in(1600, 950, 1300) )
;


--15. 커미션이 $500 이상인 사원의 이름과 급여 및 커미션을 출력하시오.

select ename, sal, comm
from emp
where comm>=500 
;

