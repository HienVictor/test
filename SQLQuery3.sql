--Tạo CSD QLBanHang
USE QLBanHang
--Tạo bảng VatTu
CREATE TABLE VatTu(MaVTu CHAR(4) NOT NULL, TenVTu NVARCHAR(100), DVTinh NVARCHAR(10), PhanTram REAL, CONSTRAINT PK_VatTu PRIMARY KEY(MaVTu))
--Tạo bảng NhaCC
CREATE TABLE NhaCC(MaNhaCC CHAR(3) NOT NULL, TenNhaCC NVARCHAR(100), DiaChi NVARCHAR(200), DienThoai VARCHAR(20), CONSTRAINT PK_NhaCC PRIMARY KEY(MaNhaCC))
--Tạo bảng DonDH
CREATE TABLE DonDH(SoDH CHAR(4) NOT NULL, NgayDH DATETIME, MaNhaCC CHAR(3), CONSTRAINT PK_DonDH PRIMARY KEY(SoDH))
--Tạo bảng CTDonDH
CREATE TABLE CTDonDH(SoDH CHAR(4) NOT NULL, MaVTu CHAR(4), SLDat INT, CONSTRAINT PK_CTDonDH PRIMARY KEY(SoDH, MaVTu))
--Tạo bảng PNhap
CREATE TABLE PNhap(SoPN CHAR(4) NOT NULL, NgayNhap DATETIME, SoDH CHAR(4), CONSTRAINT PK_PNhap PRIMARY KEY(SoPN))
--Tạo bảng CTPNhap
CREATE TABLE CTPNhap(SoPN CHAR(4) NOT NULL, MaVTu CHAR(4) NOT NULL, SLNhap INT, DGNhap MONEY, CONSTRAINT PK_CTPNhap PRIMARY KEY(SoPN, MaVTu))
--Tạo bảng PXuat
CREATE TABLE PXuat(SoPX CHAR(4) NOT NULL, NgayXuat DATETIME, TenKH NVARCHAR(100), CONSTRAINT PK_PXuat PRIMARY KEY(SoPX))
--Tạo bảng CTPXuat
CREATE TABLE CTPXuat(SoPX CHAR(4) NOT NULL, MaVTu CHAR(4) NOT NULL, SLXuat INT, DGXuat MONEY, CONSTRAINT PK_CTPXuat PRIMARY KEY(SoPX, MaVTu))
--Tạo bảng TonKho
CREATE TABLE TonKho(NamThang CHAR(6) NOT NULL, MaVTu CHAR(4) NOT NULL, SLDau INT, TongSLN INT, TongSLX INT, SLCuoi AS (SLDau + TongSLN - TongSLX), CONSTRAINT PK_TonKho PRIMARY KEY(NamThang, MaVTu))
--Nhập dữ liệu bảng NhaCC
INSERT INTO NhaCC VALUES('C01', N'Lê Minh Trí', N'54 Hậu Giang Q6 HCM', '8781024')
INSERT INTO NhaCC VALUES('C02', N'Trần Minh Thạch', N'145 Hùng Vương Mỹ Tho', '7698154')
INSERT INTO NhaCC VALUES('C03', N'Hồng Phương', N'154/85 Lê Lai Q1 HCM', '9600125')
INSERT INTO NhaCC VALUES('C04', N'Nhật Thắng', N'198/40 Hương Lộ 14 QTB HCM', '8757757')
INSERT INTO NhaCC VALUES('C05', N'Lưu Nguyệt Quế', N'178 Nguyễn Văn Luông Đà Lạt', '7964251')
INSERT INTO NhaCC VALUES('C07', N'Cao Minh Trung', N'125 Lê Quang Sung Nha Trang', 'Chưa có')
--Nhập dữ liệu bảng VatTu
INSERT INTO VatTu VALUES('DD01', N'Đầu DVD Hitachi 1 đĩa', N'Bộ', 40)
INSERT INTO VatTu VALUES('DD02', N'Đầu DVD Hitachi 3 đĩa', N'Bộ', 40)
INSERT INTO VatTu VALUES('TL15', N'Tủ lạnh Sanyo 150 lít', N'Cái', 25)
INSERT INTO VatTu VALUES('TL90', N'Tủ lạnh Sanyo 90 lít', N'Cái', 20)
INSERT INTO VatTu VALUES('TV14', N'Tivi Sony 14 inches', N'Cái', 15)
INSERT INTO VatTu VALUES('TV21', N'Tivi Sony 21 inches', N'Cái', 10)
INSERT INTO VatTu VALUES('TV29', N'Tivi Sony 29 inches', N'Cái', 10)
INSERT INTO VatTu VALUES('VD01', N'Đầu VCD Sony 1 đĩa', N'Bộ', 30)
INSERT INTO VatTu VALUES('VD02', N'Đầu VCD Sony 3 đĩa', N'Bộ', 30)
--Nhập dữ liệu bảng DonDH
INSERT INTO DonDH VALUES('D001', '1/15/2005', 'C03')
INSERT INTO DonDH VALUES('D002', '1/30/2005', 'C01')
INSERT INTO DonDH VALUES('D003', '2/10/2005', 'C02')
INSERT INTO DonDH VALUES('D004', '2/17/2005', 'C05')
INSERT INTO DonDH VALUES('D005', '3/1/2005', 'C02')
INSERT INTO DonDH VALUES('D006', '3/12/2005', 'C05')
--Nhập dữ liệu bảng PNhap
INSERT INTO PNhap VALUES('N001', '1/17/2005', 'D001')
INSERT INTO PNhap VALUES('N002', '1/20/2005', 'D001')
INSERT INTO PNhap VALUES('N003', '1/31/2005', 'D002')
INSERT INTO PNhap VALUES('N004', '2/15/2005', 'D003')
--Nhập dữ liệu bảng CTDonDH
INSERT INTO CTDonDH VALUES('D001', 'DD01', 10)
INSERT INTO CTDonDH VALUES('D001', 'DD02', 15)
INSERT INTO CTDonDH VALUES('D002', 'VD02', 30)
INSERT INTO CTDonDH VALUES('D003', 'TV14', 10)
INSERT INTO CTDonDH VALUES('D003', 'TV29', 20)
INSERT INTO CTDonDH VALUES('D004', 'TL90', 10)
INSERT INTO CTDonDH VALUES('D005', 'TV14', 10)
INSERT INTO CTDonDH VALUES('D005', 'TV29', 20)
INSERT INTO CTDonDH VALUES('D006', 'TV14', 10)
INSERT INTO CTDonDH VALUES('D006', 'TV29', 20)
INSERT INTO CTDonDH VALUES('D006', 'VD01', 20)
--Nhập dữ liệu bảng CTPNhap
INSERT INTO CTPNhap VALUES('N001', 'DD01', 8, 2500000)
INSERT INTO CTPNhap VALUES('N001', 'DD02', 10, 3500000)
INSERT INTO CTPNhap VALUES('N002', 'DD01', 2, 2500000)
INSERT INTO CTPNhap VALUES('N002', 'DD02', 5, 3500000)
INSERT INTO CTPNhap VALUES('N003', 'VD02', 30, 2500000)
INSERT INTO CTPNhap VALUES('N004', 'TV14', 5, 2500000)
INSERT INTO CTPNhap VALUES('N004', 'TV29', 12, 3500000)
--Nhập dữ liệu bảng PXuat
INSERT INTO PXuat VALUES('X001', '1/17/2005', N'Nguyễn Ngọc Phương Nhi')
INSERT INTO PXuat VALUES('X002', '1/25/2005', N'Nguyễn Hoàng Phương')
INSERT INTO PXuat VALUES('X003', '1/31/2005', N'Nguyễn Tuấn Tú')
--Nhập dữ liệu bảng CTPXuat
INSERT INTO CTPXuat VALUES('X001', 'DD01', 2, 3500000)
INSERT INTO CTPXuat VALUES('X002', 'DD01', 1, 3500000)
INSERT INTO CTPXuat VALUES('X002', 'DD02', 5, 4900000)
INSERT INTO CTPXuat VALUES('X003', 'DD01', 3, 3500000)
INSERT INTO CTPXuat VALUES('X003', 'DD02', 2, 4900000)
INSERT INTO CTPXuat VALUES('X003', 'VD02', 10, 3250000)
--Nhập dữ liệu bảng TonKho
INSERT INTO TonKho(NamThang, MaVTu, SLDau, TongSLN, TongSLX) VALUES('200501', 'DD01', 0, 10, 6)
INSERT INTO TonKho(NamThang, MaVTu, SLDau, TongSLN, TongSLX) VALUES('200501', 'DD02', 0, 15, 7)
INSERT INTO TonKho(NamThang, MaVTu, SLDau, TongSLN, TongSLX) VALUES('200501', 'VD02', 0, 30, 10)
INSERT INTO TonKho(NamThang, MaVTu, SLDau, TongSLN, TongSLX) VALUES('200502', 'DD01', 4, 0, 0)
INSERT INTO TonKho(NamThang, MaVTu, SLDau, TongSLN, TongSLX) VALUES('200502', 'DD02', 8, 0, 0)
INSERT INTO TonKho(NamThang, MaVTu, SLDau, TongSLN, TongSLX) VALUES('200502', 'VD02', 20, 0, 0)
INSERT INTO TonKho(NamThang, MaVTu, SLDau, TongSLN, TongSLX) VALUES('200502', 'TV14', 5, 0, 0)
INSERT INTO TonKho(NamThang, MaVTu, SLDau, TongSLN, TongSLX) VALUES('200502', 'TV29', 12, 0, 0)
--1.6
select SoPX, SUM(DGXuat*SLXuat) as TongGiaTri from CTPXuat
group by SoPX
order by TongGiaTri desc
--1.8
DELETE
from CTDonDH
where SoDH = (select SoDH From DonDH where NgayDH='1/15/2002')
--1.11
select CTPNhap.SoPN as N'Số NX', NgayNhap as N'Ngày NX', TenVTu as N'Tên Vật tư', SLNhap as N'Số Lượng NX'
from (PNhap inner join CTPNhap on CTPNhap.SoPN = PNhap.SoPN) inner join VatTu on CTPNhap.MaVTu = VatTu.MaVTu
union
select CTPXuat.SoPX as N'Số NX', NgayXuat as N'Ngày NX', TenVTu as N'Tên Vật tư', SLXuat as N'Số Lượng NX'
from (PXuat inner join CTPXuat on CTPXuat.SoPX = PXuat.SoPX) inner join VatTu on CTPXuat.MaVTu = VatTu.MaVTu
--1.12.1
select *,(SLXuat*DGXuat)as ThanhTien
from CTPXuat
order by SoPX
Compute sum(SLXuat*DGXuat)by SoPX
--1.12.2
select MaVTu,SoPN,SLNhap,DGNhap
from CTPNhap
order by MaVTu
compute sum(SLNhap),Min(DGNhap),MAX(DGNhap)by MaVTu
--2.2
update CTPXuat
set DGXuat = case
when SLXuat<4 then DGXuat
when SLXuat>=4 and SLXuat<10 then DGXuat-DGXuat*5/100
when SLXuat>=10 and SLXuat<=20 then DGXuat-DGXuat*10/100
when SLXuat>20 then DGXuat-DGXuat*20/100 end where SoPX in 
(select SoPX From PXuat where MONTH(NgayXuat)='01' and YEAR(NgayXuat)='2002')
--3.2
create view vw_DonDH_TongSLDatNhap
AS
select DonDH.SoDH,SUM(CTDonDH.SLDat) AS TongSLDat,
SUM(CTPNhap.SLNhap) AS TongSLNhap
from CTDonDH left join DonDH on 
CTDonDH.SoDH= DonDH.SoDH 
left join PNhap on CTDonDH.SoDH= PNhap.SoDH
left join CTPNhap on PNhap.SoPN = CTPNhap.SoPN
and CTDonDH.MaVTu = CTPNhap.MaVTu
group by DonDH.SoDH
select *from vw_DonDH_TongSLDatNhap
drop view vw_DonDH_TongSLDatNhap

--3.3
create view vw_DonDH_DaNhapDu
as
select CTDonDH.SoDH, case when SUM(CTPNhap.SLNhap)
>=SUM(CTDonDH.SLDat) then N'Đã Nhập Đủ' else N'Chưa Nhập đủ' end as DaNhapDu
from CTDonDH left join
DonDH on CTDonDH.SoDH=DonDH.SoDH left join
PNhap on CTDonDH.SoDH=PNhap.SoDH left join
CTPNhap on CTDonDH.MaVTu= CTPNhap.MaVTu
AND PNhap.SoPN=CTPNhap.SoPN
group by CTDonDH.SoDH 
select *from vw_DonDH_DaNhapDu

--3.4
create view vw_TongNhap
as
select RIGHT(CONVERT(CHAR(10),PNhap.NgayNhap,103),7) as NamThang,
MaVTu,SUM(SLNhap) as TongSLNhap From PNhap,CTPNhap
Where PNhap.SoPN=CTPNhap.SoPN
group by RIGHT(CONVERT(char(10),PNhap.NgayNhap,103),7),CTPNhap.MaVTu
select *from vw_TongNhap
drop view vw_TongNhap
--3.5 
create view vw_TongXuat
as
select RIGHT (convert (char(10),PXuat.NgayXuat,103),7) as NamThang,
MaVTu, SUM(SLXuat) as TongSLXuat from PXuat,CTPXuat
where PXuat.SoPX=CTPXuat.SoPX
group by RIGHT (convert (char(10),PXuat.NgayXuat,103),7),CTPXuat.MaVTu
select * from vw_TongXuat
--4.1
select *from DonDH where SoDH Not in (select SoDH from PNhap)
--4.2
select *from VatTu where MaVTu not in (select MaVTu from CTDonDH)
--4.3
select top 1 WITH TIES MaNhaCC, COUNT(*) as TongSoDonDH
from DonDH
group by MaNhaCC
order by TongSoDonDH desc
--4.4
select top 1 with ties MaVTu, SUM(SLXuat) as TongSLXuat
from CTPXuat
group by MaVTu
order by TongSLXuat desc
--4.5
select top 1 with ties SoDH, COUNT(*) as SoMatHang
from CTDonDH
group by SoDH
order by SoMatHang desc
--4.6




-- chương 4
--1.1
DECLARE @DGTB REAL
select @DGTB = AVG(DGXuat)
From CTPXuat
Where MaVTu in (select MaVTu from VatTu where TenVTu = N'Đầu DVD Hitachi 1 đĩa')
if @DGTB>3800000
PRINT N'Không nên thay đổi giá bán'
else
Print N'Đã đến lúc tăng giá bán'


select * from NHACC
 create proc p_nhacc
 as
 begin
	decla
 end
 go