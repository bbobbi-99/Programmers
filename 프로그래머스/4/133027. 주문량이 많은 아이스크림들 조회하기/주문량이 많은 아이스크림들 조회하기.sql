SELECT R.FLAVOR
FROM (SELECT A.SHIPMENT_ID,A.FLAVOR,SUM(B.TOTAL_ORDER) T1, SUM(A.TOTAL_ORDER) T2
FROM FIRST_HALF A
INNER JOIN JULY B ON A.FLAVOR = B.FLAVOR
GROUP BY A.SHIPMENT_ID,A.FLAVOR
ORDER BY T1+T2 DESC) R
WHERE ROWNUM <= 3;