CREATE TABLE KHACHHANG
(
	MAKH		char(4),
	HOTEN		varchar(40),
	DCHI		varchar(50),
	SODT		varchar(20),
	NGSINH		smalldatetime,
	NGDK		smalldatetime,
	DOANHSO		money,
	PRIMARY KEY(MAKH),
);

GO

CREATE TABLE NHANVIEN
(
	MANV		char(4),
	HOTEN		varchar(40),
	SODT		varchar(20),
	NGVL		smalldatetime,
	PRIMARY KEY(MANV),
)
GO

CREATE TABLE SANPHAM
(
	MASP		char(4)	PRIMARY KEY,
	TENSP		varchar(40),
	DVT			varchar(20),
	NUOCSX		varchar(40),
	GIA			money,
)
GO

CREATE TABLE HOADON
(
	SOHD		int,
	NGHD		smalldatetime,
	MAKH		char(4),
	MANV		char(4),
	TRIGIA		money,
	PRIMARY KEY (SOHD),
	FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV),
	FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH)
)
GO


CREATE TABLE CTHD
(
	SOHD		int,
	MASP		char(4),
	SL			int,

	PRIMARY KEY(SOHD, MASP),
	FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP),
	FOREIGN KEY(SOHD) REFERENCES HOADON(SOHD)
)
--I
--2
ALTER TABLE SANPHAM ADD GHICHU varchar(20)

--3
ALTER TABLE KHACHHANG ADD LOAIKH tinyint

--4
ALTER TABLE SANPHAM
ALTER COLUMN GHICHU varchar(100)

--5
ALTER TABLE SANPHAM
DROP COLUMN GHICHU

--6: thay đổi kiểu dữ liệu thành varchar(20)
ALTER TABLE KHACHHANG
ALTER COLUMN LOAIKH varchar(20)

--7
ALTER TABLE SANPHAM
ADD CONSTRAINT CHK_DVT CHECK (DVT = 'cay' OR DVT = 'hop' OR DVT = 'cai' OR DVT = 'quyen' OR DVT = 'chuc')

--8: DÙNG CHECK(GIA>500)
ALTER TABLE SANPHAM
ADD CHECK (GIA > 500)

-- 9
ALTER TABLE CTHD
ADD CHECK (SL >= 1)

--10
ALTER TABLE KHACHHANG
ADD CHECK (NGDK > NGSINH)

--11
--12
--13
--14
--15

--II
--1
insert into KHACHHANG 
values ('KH01','Nguyen Van A','731,Tran Hung Dao, Q 5 ,Tp HCM','08823451','19601022','20061022',13060000)

insert into KHACHHANG 
values ('KH02','Tran Ngoc Han','23/5, Nguyen Trai, Q 5, Tp HCM','0908256478','19740403','20060730',280000)

insert into KHACHHANG 
values ('KH03','Tran Ngoc Linh','45, Nguyen Canh Chan, Q 1, Tp HCM','0938776266','19800612','20060805',3860000)

insert into KHACHHANG 
values ('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q 10, Tp HCM','0917325476','19650309','20061002',250000)

insert into KHACHHANG 
values ('KH05','Le Nhat Minh','34, Truong Dinh, Q 3, Tp HCM','08246108','19500310','20061028',21000)

insert into KHACHHANG 
values ('KH06','Le Hoai Thuong','227, Nguyen Van Cu, Q 5, Tp HCM','08631738','19811231','20061124',915000)

insert into KHACHHANG 
values ('KH07','Nguyen Van Tam','32/3, Tran Binh Trong, Q 5, Tp HCM','0916783565','19710406','20061201',12500)

insert into KHACHHANG 
values ('KH08','Phan Thi Thanh','45/2, An Duong Vuong, Q 5, Tp HCM','0938435756','19710110','20061213',365000)

insert into KHACHHANG 
values ('KH09','Le Ha Vinh','873, Le Hong Phong, Q 5, Tp HCM','08654763','19790903','20070114',70000)

insert into KHACHHANG 
values ('KH10','Ha Duy Lap','34/34B, Nguyen Trai, Q 1, Tp HCM','08768904','19830502','20070116',67500)

insert into NHANVIEN values ('NV01','Nguyen Nhu Nhut','0927345678','20060413')

insert into NHANVIEN values ('NV02','Le Thi Phi Yen','0987567390','20060421')

insert into NHANVIEN values ('NV03','Nguyen Van B','0997047382','20060427')

insert into NHANVIEN values ('NV04','Ngo Thanh Tuan','0913758498','20060624')

insert into NHANVIEN values ('NV05','Nguyen Thi Truc Thanh','0918590387','20060720')

insert into SANPHAM values ('BC01','But chi','cay','Singapore',3000)
insert into SANPHAM values ('BC02','But chi','cay','Singapore',5000)
insert into SANPHAM values ('BC03','But chi','cay','Viet Nam',3500)
insert into SANPHAM values ('BC04','But chi','hop','Viet Nam',30000)
insert into SANPHAM values ('BB01','But bi','cay','Viet Nam',5000)
insert into SANPHAM values ('BB02','But bi','cay','Trung Quoc',7000)
insert into SANPHAM values ('BB03','But bi','hop','Thai Lan',100000)
insert into SANPHAM values ('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
insert into SANPHAM values ('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
insert into SANPHAM values ('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
insert into SANPHAM values ('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
insert into SANPHAM values ('TV05','Tap 100 trang','chuc','Viet Nam',23000)
insert into SANPHAM values ('TV06','Tap 200 trang','chuc','Viet Nam',53000)
insert into SANPHAM values ('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
insert into SANPHAM values ('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
insert into SANPHAM values ('ST02','So tay loai 1','quyen','Viet Nam',55000)
insert into SANPHAM values ('ST03','So tay loai 2','quyen','Viet Nam',51000)
insert into SANPHAM values ('ST04','So tay ','quyen','Thai Lan',55000)
insert into SANPHAM values ('ST05','So tay mong','quyen','Thai Lan',20000)
insert into SANPHAM values ('ST06','Phan viet bang','hop','Viet Nam',5000)
insert into SANPHAM values ('ST07','Phan khong bui','hop','Viet Nam',7000)
insert into SANPHAM values ('ST08','Bong bang','cai','Viet Nam',1000)
insert into SANPHAM values ('ST09','But long','cay','Viet Nam',5000)
insert into SANPHAM values ('ST10','But long','cay','Trung Quoc',7000)

insert into HOADON values (1001,'20060723','KH01','NV01',320000)
insert into HOADON values (1002,'20060812','KH01','NV02',840000)
insert into HOADON values (1003,'20060823','KH02','NV01',100000)
insert into HOADON values (1004,'20060901','KH02','NV01',180000)
insert into HOADON values (1005,'20061020','KH01','NV02',3800000)
insert into HOADON values (1006,'20061016','KH01','NV03',2430000)
insert into HOADON values (1007,'20061028','KH03','NV03',510000)
insert into HOADON values (1008,'20061228','KH01','NV03',440000)
insert into HOADON values (1009,'20061028','KH03','NV04',200000)
insert into HOADON values (1010,'20061101','KH01','NV01',5200000)
insert into HOADON values (1011,'20061104','KH04','NV03',250000)
insert into HOADON values (1012,'20061130','KH05','NV03',21000)
insert into HOADON values (1013,'20061212','KH06','NV01',5000)
insert into HOADON values (1014,'20061231','KH03','NV02',3150000)
insert into HOADON values (1015,'20070101','KH06','NV01',910000)
insert into HOADON values (1016,'20070101','KH07','NV02',12500)
insert into HOADON values (1017,'20070102','KH08','NV03',35000)
insert into HOADON values (1018,'20070113','KH08','NV03',330000)
insert into HOADON values (1019,'20070113','KH01','NV03',30000)
insert into HOADON values (1020,'20070114','KH09','NV04',70000)
insert into HOADON values (1021,'20070116','KH10','NV03',67500)
insert into HOADON values (1022,'20070116',null,'NV03',7000)
insert into HOADON values (1023,'20070117',null,'NV01',330000)

insert into CTHD values (1001,'TV02',10)
insert into CTHD values (1001,'ST01',5)
insert into CTHD values (1001,'BC01',5)
insert into CTHD values (1001,'BC02',10)
insert into CTHD values (1001,'ST08',10)
insert into CTHD values (1002,'BC04',20)
insert into CTHD values (1002,'BB01',20)
insert into CTHD values (1002,'BB02',20)
insert into CTHD values (1003,'BB03',10)
insert into CTHD values (1004,'TV01',20)
insert into CTHD values (1004,'TV02',20)
insert into CTHD values (1004,'TV03',20)
insert into CTHD values (1004,'TV04',20)
insert into CTHD values (1005,'TV05',50)
insert into CTHD values (1005,'TV06',50)
insert into CTHD values (1006,'TV07',20)
insert into CTHD values (1006,'ST01',30)
insert into CTHD values (1006,'ST02',10)
insert into CTHD values (1007,'ST03',10)
insert into CTHD values (1008,'ST04',8)
insert into CTHD values (1009,'ST05',10)
insert into CTHD values (1010,'TV07',50)
insert into CTHD values (1010,'ST07',50)
insert into CTHD values (1010,'ST08',100)
insert into CTHD values (1010,'ST04',50)
insert into CTHD values (1010,'TV03',100)
insert into CTHD values (1011,'ST06',50)
insert into CTHD values (1012,'ST07',3)
insert into CTHD values (1013,'ST08',5)
insert into CTHD values (1014,'BC02',80)
insert into CTHD values (1014,'BB02',100)
insert into CTHD values (1014,'BC04',60)
insert into CTHD values (1014,'BB01',50)
insert into CTHD values (1015,'BB02',30)
insert into CTHD values (1015,'BB03',7)
insert into CTHD values (1016,'TV01',5)
insert into CTHD values (1017,'TV02',1)
insert into CTHD values (1017,'TV03',1)
insert into CTHD values (1017,'TV04',5)
insert into CTHD values (1018,'ST04',6)
insert into CTHD values (1019,'ST05',1)
insert into CTHD values (1019,'ST06',2)
insert into CTHD values (1020,'ST07',10)
insert into CTHD values (1021,'ST08',5)
insert into CTHD values (1021,'TV01',7)
insert into CTHD values (1021,'TV02',10)
insert into CTHD values (1022,'ST07',1)
insert into CTHD values (1023,'ST04',6)

--2
SELECT * INTO SANPHAM1 FROM SANPHAM
SELECT * INTO KHACHHANG1 FROM KHACHHANG

--3 
UPDATE SANPHAM1
SET GIA = GIA+GIA/(100/5)
WHERE NUOCSX = 'Thai Lan'

--4 
UPDATE SANPHAM1
SET GIA = GIA+GIA/(100/5)
WHERE NUOCSX = 'Trung Quoc' AND GIA < 10000

--5 

UPDATE KHACHHANG1
SET LOAIKH = 'vip'
WHERE (NGDK < '20070101' AND DOANHSO > 10000000)
OR  (NGDK >= '20070101' AND DOANHSO > 2000000)

