--III
--1
SELECT MASP, TENSP FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'

--2
SELECT MASP, TENSP FROM SANPHAM
WHERE DVT = 'cay' OR DVT = 'quyen'

--3
SELECT MASP, TENSP FROM SANPHAM
WHERE MASP LIKE 'B%01'

--4
SELECT MASP, TENSP FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc' AND (GIA < 40000 AND GIA > 30000)

--5
SELECT MASP, TENSP FROM SANPHAM
WHERE (NUOCSX = 'Trung Quoc' OR NUOCSX = 'Thai Lan') AND (GIA >= 30000 AND GIA <= 40000)

--6 
SELECT SOHD, TRIGIA FROM HOADON
WHERE NGHD = '20070101' OR NGHD = '20070102'

--7
SELECT SOHD, TRIGIA, NGHD FROM HOADON
WHERE YEAR (NGHD) = 2007 AND MONTH (NGHD) = 01
ORDER BY NGHD DESC, TRIGIA ASC 

--8
SELECT KHACHHANG.MAKH, HOTEN FROM KHACHHANG, HOADON
WHERE KHACHHANG.MAKH = HOADON.MAKH
AND NGHD = '20070101'

--9
SELECT SOHD, TRIGIA FROM HOADON, NHANVIEN
WHERE HOADON.MANV = NHANVIEN.MANV
AND NHANVIEN.HOTEN = 'Nguyen Van B'
AND NGHD = '20061028'

--10
SELECT SANPHAM.MASP, SANPHAM.TENSP FROM SANPHAM, KHACHHANG, HOADON, CTHD
WHERE SANPHAM.MASP = CTHD.MASP
AND HOADON.SOHD = CTHD.SOHD
AND HOADON.MAKH = KHACHHANG.MAKH
AND KHACHHANG.HOTEN = 'Nguyen Van A'
AND YEAR (HOADON.NGHD) = 2006 AND MONTH (HOADON.NGHD) = 10

--11
SELECT SOHD FROM CTHD
WHERE MASP = 'BB01' OR MASP = 'BB02'

SELECT SOHD FROM CTHD
WHERE MASP IN ('BB01','BB02')

--12
SELECT SOHD FROM CTHD
WHERE MASP = 'BB01' OR MASP = 'BB02'
AND (SL < 20 AND SL >= 10)

SELECT SOHD FROM CTHD
WHERE MASP IN ('BB01','BB02')
AND SL BETWEEN 10 AND 20

--13
SELECT SOHD FROM CTHD
WHERE (MASP = 'BB01' AND MASP = 'BB02')
AND (SL < 20 AND SL >= 10)

--14
SELECT SANPHAM.MASP, TENSP FROM SANPHAM, HOADON, CTHD
WHERE SANPHAM.MASP = CTHD.MASP
AND HOADON.SOHD = CTHD.SOHD
AND NUOCSX = 'Trung Quoc'
OR NGHD = '20070101'

--15
SELECT MASP, TENSP FROM SANPHAM
WHERE MASP NOT IN (SELECT MASP FROM CTHD)

--16
SELECT SANPHAM.MASP, TENSP FROM SANPHAM
WHERE SANPHAM.MASP NOT IN (
SELECT MASP FROM CTHD, HOADON
WHERE CTHD.SOHD = HOADON.SOHD
AND YEAR (NGHD) = 2006)

--17
SELECT SANPHAM.MASP, TENSP FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc' AND SANPHAM.MASP NOT IN (
SELECT MASP FROM CTHD, HOADON
WHERE CTHD.SOHD = HOADON.SOHD
AND YEAR (NGHD) = 2006)

--18
SELECT HOADON.SOHD FROM SANPHAM,HOADON, CTHD
WHERE SANPHAM.MASP = CTHD.MASP
AND HOADON.SOHD = CTHD.SOHD
AND NUOCSX = 'Singapore'

--20
SELECT COUNT(HOADON.MAKH ) FROM HOADON 
WHERE HOADON.MAKH NOT IN
(SELECT KHACHHANG.MAKH FROM KHACHHANG 
WHERE KHACHHANG.MAKH=HOADON.MAKH)

--21
SELECT COUNT(DISTINCT MASP) FROM CTHD, HOADON
WHERE CTHD.SOHD = HOADON.SOHD
AND YEAR (NGHD) = 2006

--22
SELECT MIN(TRIGIA), MAX(TRIGIA) FROM HOADON

--23
SELECT AVG(TRIGIA) FROM HOADON
WHERE YEAR (NGHD) = 2006

--24
SELECT SUM(TRIGIA) FROM HOADON
WHERE YEAR (NGHD) = 2006

--25
SELECT SOHD FROM HOADON
WHERE YEAR (NGHD) = 2006 AND TRIGIA = (SELECT MAX(TRIGIA) FROM HOADON)

--26
SELECT HOTEN FROM KHACHHANG, HOADON
WHERE KHACHHANG.MAKH = HOADON.MAKH 
AND TRIGIA = (SELECT MAX(TRIGIA) FROM HOADON)
AND YEAR (NGHD) = 2006

--27
SELECT TOP 3 MAKH,HOTEN FROM KHACHHANG
ORDER BY DOANHSO DESC

--28
SELECT MASP, TENSP FROM SANPHAM
WHERE GIA IN (SELECT TOP 3 GIA FROM SANPHAM ORDER BY GIA DESC)

--29
SELECT MASP, TENSP FROM SANPHAM
WHERE GIA IN (SELECT TOP 3 GIA FROM SANPHAM ORDER BY GIA DESC)
AND NUOCSX = 'Thai Lan'

--30
SELECT MASP, TENSP FROM SANPHAM
WHERE GIA IN 
(SELECT TOP 3 GIA FROM SANPHAM 
WHERE NUOCSX = 'Trung Quoc' 
ORDER BY GIA DESC)
AND NUOCSX = 'Trung Quoc'

--31
SELECT TOP 3 * FROM KHACHHANG 
ORDER BY DOANHSO DESC

--32
SELECT COUNT(NUOCSX) FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'

--33
SELECT COUNT(NUOCSX), NUOCSX FROM SANPHAM
GROUP BY NUOCSX

--34
SELECT COUNT(NUOCSX), NUOCSX, MAX(GIA), MIN(GIA), AVG(GIA) FROM SANPHAM
GROUP BY NUOCSX

--35
SELECT SUM(TRIGIA), NGHD FROM HOADON
GROUP BY NGHD	

--36
SELECT SUM(SL) FROM CTHD, HOADON
WHERE CTHD.SOHD = HOADON.SOHD
AND YEAR (NGHD) = 2006 AND MONTH (NGHD) = 10
GROUP BY MASP

--37
SELECT MONTH(NGHD) , SUM(TRIGIA) FROM HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH (NGHD)

--38
SELECT SOHD FROM CTHD 
GROUP BY SOHD
HAVING COUNT(DISTINCT MASP) >= 4

--39
SELECT SOHD FROM SANPHAM, CTHD
WHERE SANPHAM.MASP = CTHD.MASP
AND NUOCSX = 'Viet Nam'
GROUP BY SOHD
HAVING COUNT (DISTINCT CTHD.MASP) = 3

--40
SELECT TOP 1 KHACHHANG.MAKH, HOTEN FROM KHACHHANG, HOADON
WHERE KHACHHANG.MAKH = HOADON.MAKH
GROUP BY KHACHHANG.MAKH, HOTEN
ORDER BY COUNT(*) DESC

--41
SELECT TOP 1 MONTH(NGHD) FROM HOADON
WHERE YEAR (NGHD)= 2006
GROUP BY MONTH (NGHD)
ORDER BY SUM(TRIGIA) DESC

--42
SELECT TOP 1 SANPHAM.MASP, TENSP FROM HOADON, CTHD, SANPHAM
WHERE HOADON.SOHD = CTHD.SOHD
AND SANPHAM.MASP = CTHD.MASP
AND YEAR (NGHD) = 2006
GROUP BY SANPHAM.MASP, TENSP
ORDER BY SUM(SL) ASC

--43
SELECT NUOCSX , MASP , TENSP  FROM SANPHAM
GROUP BY NUOCSX , MASP ,TENSP 
ORDER BY MAX(GIA) DESC

--44
SELECT NUOCSX FROM SANPHAM
GROUP BY NUOCSX
HAVING COUNT (DISTINCT GIA) >= 3

--45
