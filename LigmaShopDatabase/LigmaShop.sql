﻿create database LigmaShop
go
use LigmaShop
go
create table USERS (
    UserID int primary key identity(1,1),
    FullName nvarchar(255) not null,
    Email varchar(255) unique not null,
    Password varchar(255) not null,
    PhoneNumber varchar(15),
    Address nvarchar(100),
    Role varchar(10) check (Role in ('user','admin'))
);
go
insert into USERS (FullName, Email, Password, PhoneNumber, Address, Role)
values 
(N'Nguyen Van A', 'nguyenvana@example.com', 'password100', '0123456789', N'Hanoi', 'admin'),
(N'Tran Thi B', 'tranthib@example.com', 'password101', '0987654321', N'HCM City', 'admin'),
(N'Le Van C', 'levanc@example.com', 'password102', '0911223344', N'Da Nang', 'user'),
(N'Pham Thi D', 'phamthid@example.com', 'password103', '0933445566', N'Hue', 'user'),
(N'Hoang Van E', 'hoangvane@example.com', 'password104', '0922334455', N'Can Tho', 'user'),
(N'Ngo Thi F', 'ngothif@example.com', 'password105', '0911332233', N'Hai Phong', 'user'),
(N'Vu Van G', 'vuvang@example.com', 'password106', '0945566778', N'Quang Ninh', 'user');
go
select * from Users
go
create table COMPANY (
    CompanyID int primary key identity(1,1), -- ID duy nhất của công ty
    CompanyName nvarchar(255) not null,       -- Tên công ty
    Address nvarchar(100),                            -- Địa chỉ công ty
    ContactNumber varchar(15),               -- Số điện thoại liên hệ
    Email varchar(255)                       -- Email công ty
);
go
insert into COMPANY (CompanyName, Address, ContactNumber, Email)
values 
(N'Company A', N'123 Street, Hanoi', '0123456789', 'contact@companya.com'),
(N'Company B', N'456 Street, HCM City', '0987654321', 'contact@companyb.com'),
(N'Company C', N'789 Street, Da Nang', '0911223344', 'contact@companyc.com'),
(N'Company D', N'321 Street, Can Tho', '0933445566', 'contact@companyd.com');
go
create table CATEGORIES (
    CategoryID int primary key identity(1,1),
    CategoryName nvarchar(255) not null,
    Description nvarchar(500)
);
go
insert into CATEGORIES (CategoryName, Description)
values 
(N'Tất cả sản phẩm',N'Tất cả sản phẩm'),
(N'Quần áo Nam', N'Tất cả quần và áo dành cho Nam'),
(N'Quần áo Nữ', N'Tất cả quần và áo dành cho Nữ'),
(N'Áo Nam', N'Tất cả áo dành cho Nam'),
(N'Áo Nữ', N'Tất cả áo dành cho Nữ'),
(N'Quần Nam', N'Tất cả quần cho Nam'),
(N'Quần Nữ', N'Tất cả quần cho Nữ'),
(N'Áo khoác', N'Tất cả áo khoác'),
(N'Đầm', N'Đầm dành cho nữ'),
(N'Đồ thể thao', N'Đồ thể thao dành cho cả Nam và Nữ'),
(N'Thời trang mùa đông', N'Thời trang dành cho mùa đông'),
(N'Thời trang mùa hè', N'Thời trang dành cho mùa hè');
go
create table PRODUCTS (
    ProductID int primary key identity(1,1),
    ProductName nvarchar(255) not null,
    Description nvarchar(500),
	Price decimal(10,2) not null,
    CreatedDate date not null,
	CompanyID int foreign key (CompanyID) references COMPANY(CompanyID) on delete cascade on update cascade
);
go
insert into PRODUCTS (ProductName, Description, Price, CreatedDate, CompanyID)
values
(N'Áo sơ mi Nam', N'Áo sơ mi nam cao cấp', 150000.00,'2025-01-01',1),
(N'Áo sơ mi Nữ', N'Áo sơ mi nữ thanh lịch', 140000.00,'2025-01-01',1),
(N'Áo khoác Nam', N'Áo khoác nam thời trang', 250000.00,'2025-01-01',1),
(N'Áo khoác Nữ', N'Áo khoác nữ đẹp', 240000.00, '2025-01-01',1),
(N'Áo len Nam', N'Áo len ấm áp cho nam', 200000.00,'2025-01-01',1),
(N'Áo len Nữ', N'Áo len dày cho nữ', 190000.00, '2025-01-01',1),
(N'Quần jeans Nam', N'Quần jeans nam thời trang', 300000.00,'2025-01-01',1),
(N'Quần jeans Nữ', N'Quần jeans nữ phong cách', 290000.00, '2025-01-01',1),
(N'Quần kaki Nam', N'Quần kaki cho nam lịch lãm', 220000.00, '2025-01-01',1),
(N'Quần kaki Nữ', N'Quần kaki nữ xinh xắn', 210000.00,'2025-01-01',1),
(N'Quần short Nam', N'Quần short cho nam trẻ trung', 180000.00, '2025-01-01',1),
(N'Quần short Nữ', N'Quần short cho nữ năng động', 170000.00, '2025-01-01',2),
(N'Áo hoodie Nam', N'Áo hoodie cho nam thoải mái', 250000.00,  '2025-01-01',2),
(N'Áo hoodie Nữ', N'Áo hoodie nữ dễ thương', 220000.00, '2025-01-01',2),
(N'Áo khoác lông Nam', N'Áo khoác lông cho nam sang trọng', 35000.00, '2025-01-01',2),
(N'Áo khoác lông Nữ', N'Áo khoác lông cho nữ ấm áp', 340000.00,  '2025-01-01',2),
(N'Áo thun dài tay Nam', N'Áo thun dài tay nam mùa đông', 160000.00, '2025-01-01',2),
(N'Áo thun dài tay Nữ', N'Áo thun dài tay nữ mùa đông', 150000.00, '2025-01-01',2),
(N'Áo sơ mi họa tiết Nam', N'Áo sơ mi họa tiết nam thời trang', 170000.00,  '2025-01-01',2),
(N'Áo sơ mi họa tiết Nữ', N'Áo sơ mi họa tiết nữ thanh lịch', 160000.00, '2025-01-01',2),
(N'Áo khoác dáng dài Nam', N'Áo khoác dáng dài cho nam', 400000.00,  '2025-01-01',2),
(N'Áo khoác dáng dài Nữ', N'Áo khoác dáng dài cho nữ', 450000.00,  '2025-01-01',2),
(N'Quần sooc thể thao Nam', N'Quần sooc thể thao nam', 120000.00,  '2025-01-01',2),
(N'Quần sooc thể thao Nữ', N'Quần sooc thể thao nữ', 110000.00, '2025-01-01',2),
(N'Áo len cổ cao Nam', N'Áo len cổ cao nam', 200000.00,  '2025-01-01',3),
(N'Áo len cổ cao Nữ', N'Áo len cổ cao nữ', 190000.00, '2025-01-01',3),
(N'Áo vest Nam', N'Áo vest nam thanh lịch', 1500000.00, '2025-01-01',3),
(N'Áo vest Nữ', N'Áo vest nữ duyên dáng', 1200000.00, '2025-01-01',3),
(N'Áo croptop Nữ', N'Áo croptop cho nữ', 800000.00,  '2025-01-01',3),
(N'Áo thun ngắn tay Nam', N'Áo thun ngắn tay cho nam', 85000.00, '2025-01-01',3),
(N'Áo thun ngắn tay Nữ', N'Áo thun ngắn tay cho nữ', 75000.00, '2025-01-01',3),
(N'Áo dài Nam', N'Áo dài nam truyền thống', 300000.00,  '2025-01-01',3),
(N'Áo dài Nữ', N'Áo dài nữ truyền thống', 280000.00, '2025-01-01',3),
(N'Đầm dạ hội Nữ', N'Đầm dạ hội nữ sang trọng', 500000.00,  '2025-01-01',3),
(N'Đầm công sở Nữ', N'Đầm công sở nữ thanh lịch', 450000.00,  '2025-01-01',3),
(N'Áo sát nách Nam', N'Áo sát nách nam', 70000.00, '2025-01-01',4),
(N'Áo sát nách Nữ', N'Áo sát nách nữ', 60000.00,  '2025-01-01',4),
(N'Áo thun thể thao Nam', N'Áo thun thể thao nam', 130000.00,  '2025-01-01',4),
(N'Áo thun thể thao Nữ', N'Áo thun thể thao nữ', 120000.00, '2025-01-01',4),
(N'Quần legging Nữ', N'Quần legging nữ', 100000.00,  '2025-01-01',4),
(N'Quần legging Nam', N'Quần legging nam', 190000.00, '2025-01-01',4),
(N'Áo sơ mi kẻ Nam', N'Áo sơ mi kẻ nam', 180000.00,  '2025-01-01',4),
(N'Áo sơ mi kẻ Nữ', N'Áo sơ mi kẻ nữ', 170000.00,  '2025-01-01',4),
(N'Áo chống nắng Nam', N'Áo chống nắng nam', 140000.00, '2025-01-01',4),
(N'Áo chống nắng Nữ', N'Áo chống nắng nữ', 330000.00, '2025-01-01',4);

create table ProductCategories (
    ProductCategoryID int primary key identity(1,1),
    ProductID int not null,
    CategoryID int not null,
    foreign key (ProductID) references PRODUCTS(ProductID) on update cascade on delete cascade,
    foreign key (CategoryID) references CATEGORIES(CategoryID) on update cascade on delete cascade
);
go
-- Chèn dữ liệu vào bảng ProductCategories
INSERT INTO ProductCategories (ProductID, CategoryID)
SELECT p.ProductID, c.CategoryID
FROM CATEGORIES c
JOIN PRODUCTS p
ON (   
	   (c.CategoryName = N'Tất cả sản phẩm' AND (p.ProductName LIKE N'Áo%' OR p.ProductName LIKE N'Quần%' OR p.ProductName LIKE N'Đầm%'))
    OR (c.CategoryName = N'Áo Nam' AND p.ProductName LIKE N'Áo%Nam') 
    OR (c.CategoryName = N'Áo Nữ' AND p.ProductName LIKE N'Áo%Nữ')
    OR (c.CategoryName = N'Quần Nam' AND p.ProductName LIKE N'Quần%Nam')
    OR (c.CategoryName = N'Quần Nữ' AND p.ProductName LIKE N'Quần%Nữ')
    OR (c.CategoryName = N'Quần áo Nam' AND (p.ProductName LIKE N'Áo%Nam' OR p.ProductName LIKE N'Quần%Nam'))
    OR (c.CategoryName = N'Quần áo Nữ' AND (p.ProductName LIKE N'Áo%Nữ' OR p.ProductName LIKE N'Quần%Nữ'))
	OR (c.CategoryName = N'Áo khoác' AND p.ProductName LIKE N'Áo%khoác%')
	OR (c.CategoryName = N'Đầm' AND p.ProductName LIKE N'Đầm%')
	OR (c.CategoryName = N'Đồ thể thao' AND (p.ProductName LIKE N'%thể thao%' OR p.ProductName LIKE N'%legging%'))
	OR (c.CategoryName = N'Thời trang mùa đông' AND (p.ProductName LIKE N'%len%' OR p.ProductName LIKE N'%hoodie%'  OR p.ProductName LIKE N'%khoác lông%' OR p.ProductName LIKE N'%jeans%' OR p.ProductName LIKE N'%dài tay%' OR p.ProductName LIKE N'%dáng dài%'))
	OR (c.CategoryName = N'Thời trang mùa hè' AND (p.ProductName LIKE N'%sơ mi%' OR p.ProductName LIKE N'%short%'  OR p.ProductName LIKE N'%croptop%' OR p.ProductName LIKE N'%ngắn tay%' OR p.ProductName LIKE N'%chống nắng%' ))
);
go
create table PRODUCTIMAGES (
    ImageID int primary key identity(1,1),
    ProductID int not null,
    ImageURL text not null,
  --  ImageType varchar(50),
  -- ImageOrder int,
    foreign key (ProductID) references PRODUCTS(ProductID) on update cascade on delete cascade
);
go
--ALTER TABLE PRODUCTIMAGES
--DROP COLUMN ImageType, ImageOrder;

insert into PRODUCTIMAGES (ProductID, ImageURL)
values 
(1, 'https://pageofme.github.io/team1_prj301/images/soMiNam.jpg'),
(1, 'https://pageofme.github.io/team1_prj301/images/aoSoMiNamXanh.jpg'),
(1, 'https://pageofme.github.io/team1_prj301/images/aoSoMiNamDen.jpg'),
(2, 'https://pageofme.github.io/team1_prj301/images/aoSoMiNu.jpg'),
(2, 'https://pageofme.github.io/team1_prj301/images/aoSoMiNuXanh.png'),
(2, 'https://pageofme.github.io/team1_prj301/images/aoSoMiNuDen.jpg'),
(3, 'https://pageofme.github.io/team1_prj301/images/aoKhoacNam.jpg'),
(3, 'https://pageofme.github.io/team1_prj301/images/aoKhoacNamDen.jpg'),
(3, 'https://pageofme.github.io/team1_prj301/images/aoKhoacNamTrang.jpg'),
(4, 'https://pageofme.github.io/team1_prj301/images/aoKhoacNu.jpg'),
(4, 'https://pageofme.github.io/team1_prj301/images/aoKhoacNuDen.jpg'),
(4, 'https://pageofme.github.io/team1_prj301/images/aoKhoacNuTrang.jpg'),
(5, 'https://pageofme.github.io/team1_prj301/images/aoLenNamTrang.jpg'),
(5, 'https://pageofme.github.io/team1_prj301/images/aoLenNamXanh.png'),
(5, 'https://pageofme.github.io/team1_prj301/images/aoLenNamDen.jpg'),
(6, 'https://pageofme.github.io/team1_prj301/images/aoLenNuDen.jpg'),
(6, 'https://pageofme.github.io/team1_prj301/images/aoLenNuXanh.jpg'),
(6, 'https://pageofme.github.io/team1_prj301/images/aoLenNuTrang.jpg'),
(7, 'https://pageofme.github.io/team1_prj301/images/quanJeanNam.jpg'),
(7, 'https://pageofme.github.io/team1_prj301/images/quanJeanNamDen.jpg'),
(7, 'https://pageofme.github.io/team1_prj301/images/quanJeanNamTrang.jpg'),
(8, 'https://pageofme.github.io/team1_prj301/images/quanJeanNuXanh.jpg'),
(8, 'https://pageofme.github.io/team1_prj301/images/quanJeanNuTrang.jpg'),
(8, 'https://pageofme.github.io/team1_prj301/images/quanJeanNuDen.jpg'),
(9, 'https://pageofme.github.io/team1_prj301/images/quanKakiNam.jpg'),
(9, 'https://pageofme.github.io/team1_prj301/images/quanKakiNamXanh.jpg'),
(9, 'https://pageofme.github.io/team1_prj301/images/quanKakiNamDen.jpg'),
(10, 'https://pageofme.github.io/team1_prj301/images/quanKakiNuXanh.jpg'),
(10, 'https://pageofme.github.io/team1_prj301/images/quanKakiNuDen.jpg'),
(10, 'https://pageofme.github.io/team1_prj301/images/quanKakiNuTrang.png'),
(11, 'https://pageofme.github.io/team1_prj301/images/quanShortNam.jpg'),
(11, 'https://pageofme.github.io/team1_prj301/images/quanShortNamDen.jpg'),
(11, 'https://pageofme.github.io/team1_prj301/images/quanShortNamXanh.jpg'),
(12, 'https://pageofme.github.io/team1_prj301/images/quanShortNu.jpg'),
(12, 'https://pageofme.github.io/team1_prj301/images/quanShortNuXanh.jpg'),
(12, 'https://pageofme.github.io/team1_prj301/images/quanShortNuTrang.jpg'),
(13, 'https://pageofme.github.io/team1_prj301/images/aoHoodieNamDen.jpg'),
(13, 'https://pageofme.github.io/team1_prj301/images/aoHoodieNamXanh.jpg'),
(13, 'https://pageofme.github.io/team1_prj301/images/aoHoodieNamTrang.jpg'),
(14, 'https://pageofme.github.io/team1_prj301/images/aoHoodieNu.jpg'),
(14, 'https://pageofme.github.io/team1_prj301/images/aoHoodieNuDen.jpg'),
(14, 'https://pageofme.github.io/team1_prj301/images/aoHoodieNuXanh.jpg'),
(15, 'https://pageofme.github.io/team1_prj301/images/aoKhoacLongNamDen.jpg'),
(15, 'https://pageofme.github.io/team1_prj301/images/aoKhoacLongNamXanh.jpg'),
(15, 'https://pageofme.github.io/team1_prj301/images/aoKhoacLongNamTrang.jpg'),
(16, 'https://pageofme.github.io/team1_prj301/images/aoKhoacLongNuXanh.jpg'),
(16, 'https://pageofme.github.io/team1_prj301/images/aoKhoacLongNuTrang.jpg'),
(16, 'https://pageofme.github.io/team1_prj301/images/aoKhoacLongNuDen.jpg'),
(17, 'https://pageofme.github.io/team1_prj301/images/aoThunDaiTayNamXanh.jpg'),
(17, 'https://pageofme.github.io/team1_prj301/images/aoThunDaiTayNamTrang.jpg'),
(17, 'https://pageofme.github.io/team1_prj301/images/aoThunDaiTayNamDen.jpg'),
(18, 'https://pageofme.github.io/team1_prj301/images/aoThunDaiTayNuDen.jpg'),
(18, 'https://pageofme.github.io/team1_prj301/images/aoThunDaiTayNuTrang.jpg'),
(18, 'https://pageofme.github.io/team1_prj301/images/aoThunDaiTayNuXanh.jpg'),
(19, 'https://pageofme.github.io/team1_prj301/images/aoSoMiHoaTietNam.jpg'),
(19, 'https://pageofme.github.io/team1_prj301/images/aoSoMiHoaTietNamDen.jpg'),
(19, 'https://pageofme.github.io/team1_prj301/images/aoSoMiHoaTietNamXanh.jpg'),
(20, 'https://pageofme.github.io/team1_prj301/images/aoSoMiHoaTietNuTrang.jpg'),
(20, 'https://pageofme.github.io/team1_prj301/images/aoSoMiHoaTietNuXanh.jpg'),
(20, 'https://pageofme.github.io/team1_prj301/images/aoSoMiHoaTietNuDen.jpg'),
(21, 'https://pageofme.github.io/team1_prj301/images/aoKhoacDangDaiNamXanh.webp'),
(21, 'https://pageofme.github.io/team1_prj301/images/aoKhoacDangDaiNamTrang.jpg'),
(21, 'https://pageofme.github.io/team1_prj301/images/aoKhoacDangDaiNamDen.jpg'),
(22, 'https://pageofme.github.io/team1_prj301/images/aoKhoacDangDaiNu.jpg'),
(22, 'https://pageofme.github.io/team1_prj301/images/aoKhoacDangDaiNuTrang.webp'),
(22, 'https://pageofme.github.io/team1_prj301/images/aoKhoacDangDaiNuXanh.webp'),
(23, 'https://pageofme.github.io/team1_prj301/images/quanSoocTheThaoNam.jpeg'),
(23, 'https://pageofme.github.io/team1_prj301/images/quanShortTheThaoNamXanh.jpg'),
(23, 'https://pageofme.github.io/team1_prj301/images/quanShortTheThaoNamTrang.jpg'),
(24, 'https://pageofme.github.io/team1_prj301/images/quanSoocTheThaoNu.jpg'),
(24, 'https://pageofme.github.io/team1_prj301/images/quanShortTheThaoNuTrang.webp'),
(24, 'https://pageofme.github.io/team1_prj301/images/quanShortTheThaoNuXanh.png'),
(25, 'https://pageofme.github.io/team1_prj301/images/aoLenCoCaoNam.jpg'),
(25, 'https://pageofme.github.io/team1_prj301/images/aoLenCoCaoNamXanh.webp'),
(25, 'https://pageofme.github.io/team1_prj301/images/aoLenCoCaoNamDen.jpg'),
(26, 'https://pageofme.github.io/team1_prj301/images/aoLenCoCaoNuTrang.jpg'),
(26, 'https://pageofme.github.io/team1_prj301/images/aoLenCoCaoNuDen.jpg'),
(26, 'https://pageofme.github.io/team1_prj301/images/aoLenCoCaoNuXanh.jpg'),
(27, 'https://pageofme.github.io/team1_prj301/images/aoVestNam.jpg'),
(27, 'https://pageofme.github.io/team1_prj301/images/aoVestNamXanh.jpg'),
(27, 'https://pageofme.github.io/team1_prj301/images/aoVestNamTrang.webp'),
(28, 'https://pageofme.github.io/team1_prj301/images/aoVestNu.jpg'),
(28, 'https://pageofme.github.io/team1_prj301/images/aoVestNuDen.jpg'),
(28, 'https://pageofme.github.io/team1_prj301/images/aoVestNuTrang.jpg'),
(29, 'https://pageofme.github.io/team1_prj301/images/aoCroptopXanh.jpg'),
(29, 'https://pageofme.github.io/team1_prj301/images/aoCroptopDen.webp'),
(29, 'https://pageofme.github.io/team1_prj301/images/aoCroptopTrang.jpg'),
(30, 'https://pageofme.github.io/team1_prj301/images/aoThunNganTayNamXanh.jpg'),
(30, 'https://pageofme.github.io/team1_prj301/images/aoThunNganTayNamTrang.webp'),
(30, 'https://pageofme.github.io/team1_prj301/images/aoThunNganTayNamDen.jpeg'),
(31, 'https://pageofme.github.io/team1_prj301/images/aoThunNganTayNuDen.jpg'),
(31, 'https://pageofme.github.io/team1_prj301/images/aoThunNganTayNuTrang.jpg'),
(31, 'https://pageofme.github.io/team1_prj301/images/aoThunNganTayNuXanh.webp'),
(32, 'https://pageofme.github.io/team1_prj301/images/aoDaiNamXanh.jpg'),
(32, 'https://pageofme.github.io/team1_prj301/images/aoDaiNamDen.jpg'),
(32, 'https://pageofme.github.io/team1_prj301/images/aoDaiNamTrang.webp'),
(33, 'https://pageofme.github.io/team1_prj301/images/aoDaiNuDen.jpg'),
(33, 'https://pageofme.github.io/team1_prj301/images/aoDaiNuTrang.jpg'),
(33, 'https://pageofme.github.io/team1_prj301/images/aoDaiNuXanh.webp'),
(34, 'https://pageofme.github.io/team1_prj301/images/damDaHoiXanh.jpg'),
(34, 'https://pageofme.github.io/team1_prj301/images/damDaHoiTrang.jpg'),
(34, 'https://pageofme.github.io/team1_prj301/images/damDaHoiDen.png'),
(35, 'https://pageofme.github.io/team1_prj301/images/damCongSoDen.jpg'),
(35, 'https://pageofme.github.io/team1_prj301/images/damCongSoTrang.jpeg'),
(35, 'https://pageofme.github.io/team1_prj301/images/damCongSoXanh.jpg'),
(36, 'https://pageofme.github.io/team1_prj301/images/aoSatNachNam.jpg'),
(36, 'https://pageofme.github.io/team1_prj301/images/aoSatNachNamDen.png'),
(36, 'https://pageofme.github.io/team1_prj301/images/aoSatNachNamXanh.jpg'),
(37, 'https://pageofme.github.io/team1_prj301/images/aoSatNachNu.jpg'),
(37, 'https://pageofme.github.io/team1_prj301/images/aoSatNachNuDen.jpg'),
(37, 'https://pageofme.github.io/team1_prj301/images/aoSatNachNuTrang.jpg'),
(38, 'https://pageofme.github.io/team1_prj301/images/aoThunTheThaoNamXanh.jpg'),
(38, 'https://pageofme.github.io/team1_prj301/images/aoThunTheThaoNamTrang.jpg'),
(38, 'https://pageofme.github.io/team1_prj301/images/aoThunTheThaoNamDen.jpg'),
(39, 'https://pageofme.github.io/team1_prj301/images/aoThunTheThaoNuDen.jpg'),
(39, 'https://pageofme.github.io/team1_prj301/images/aoThunTheThaoNuXanh.png'),
(39, 'https://pageofme.github.io/team1_prj301/images/aoThunTheThaoNuTrang.webp'),
(40, 'https://pageofme.github.io/team1_prj301/images/quanLeggingNu.jpg'),
(40, 'https://pageofme.github.io/team1_prj301/images/quanLeggingNuTrang.jpg'),
(40, 'https://pageofme.github.io/team1_prj301/images/quanLeggingNuXanh.png'),
(41, 'https://pageofme.github.io/team1_prj301/images/quanLeggingNam.jpg'),
(41, 'https://pageofme.github.io/team1_prj301/images/quanLeggingNamXanh.jpg'),
(41, 'https://pageofme.github.io/team1_prj301/images/quanLeggingNamTrang.jpg'),
(42, 'https://pageofme.github.io/team1_prj301/images/aoSoMiKeNam.jpg'),
(42, 'https://pageofme.github.io/team1_prj301/images/aoSoMiKeNamDen.jpg'),
(42, 'https://pageofme.github.io/team1_prj301/images/aoSoMiKeNamTrang.jpg'),
(43, 'https://pageofme.github.io/team1_prj301/images/aoSoMiKeNu.jpg'),
(43, 'https://pageofme.github.io/team1_prj301/images/aoSoMiKeNuXanh.jpg'),
(43, 'https://pageofme.github.io/team1_prj301/images/aoSoMiKeNuTrang.webp'),
(44, 'https://pageofme.github.io/team1_prj301/images/aoChongNangNam.jpg'),
(44, 'https://pageofme.github.io/team1_prj301/images/aoChongNangNamTrang.jpg'),
(44, 'https://pageofme.github.io/team1_prj301/images/aoChongNangNamDen.webp'),
(45, 'https://pageofme.github.io/team1_prj301/images/aoChongNangNu.jpg'),
(45, 'https://pageofme.github.io/team1_prj301/images/aoChongNangNuDen.jpg'),
(45, 'https://pageofme.github.io/team1_prj301/images/aoChongNangNuTrang.jpg');
go
create table COLORS (
    ColorID int primary key identity(1,1),
    ColorName nvarchar(50) not null,
    Description nvarchar(50)
);
go
--Xem dữ liệu ảnh của product

SELECT p.ProductID, p.ProductName, p.Description, p.Price, p.CreatedDate, p.CompanyID, pi.ImageURL 
                 FROM PRODUCTS p 
                 LEFT JOIN PRODUCTIMAGES pi ON p.ProductID = pi.ProductID
				 ;
go
insert into COLORS (ColorName, Description)
values 
(N'Đen', N'Màu đen'),
(N'Trắng', N'Màu trắng'),
(N'Xanh', N'Màu xanh');
go
create table SIZES (
    SizeID int primary key identity(1,1),
    SizeName varchar(50) not null,
    Description varchar(100)
);
go
insert into SIZES (SizeName, Description)
values 
('L', 'Size Large'),
('XL', 'Size Extra Large'),
('XXL', 'Size Double Extra Large');
go
create table PRODUCTSIZECOLOR (
    ProductSizeColorID int primary key identity(1,1),
    ProductID int not null,
    SizeID int not null,
    ColorID int not null,
	Price decimal(10,2) null,
    foreign key (ProductID) references PRODUCTS(ProductID) on update cascade on delete cascade, 
    foreign key (SizeID) references SIZES(SizeID) on update cascade on delete cascade,
    foreign key (ColorID) references COLORS(ColorID) on update cascade on delete cascade
);
go
insert into PRODUCTSIZECOLOR (ProductID, SizeID, ColorID)
select P.ProductID, S.SizeID, C.ColorID
from PRODUCTS P
cross join SIZES S
cross join COLORS C
;
go
create table CART (
    CartID int primary key identity(1,1),
    UserID int not null,
    CreatedDate date not null default getdate(),
    foreign key (UserID) references USERS(UserID) on delete cascade on update cascade
);	
go
insert into CART (UserID, CreatedDate)
values 
(1, '2025-01-01'),
(1, '2025-01-02'),
(1, '2025-01-03'),
(1, '2025-01-04'),
(2, '2025-01-01'),
(2, '2025-01-01'),
(2, '2025-01-05'),
(2, '2025-01-06'),
(3, '2025-01-07'),
(3, '2025-01-07'),
(4, '2025-01-07'),
(4, '2025-01-08'),
(5, '2025-01-01'),
(6, '2025-01-02'),
(7, '2025-01-01'),
(7, '2025-01-03');
go
create table CARTITEMS (
    CartItemID int primary key identity(1,1),
    CartID int not null,
    ProductSizeColorID int not null,
    Quantity int not null,
    AddedDate datetime not null default getdate(), --Cần check ngày thêm phải sau ngày tạo CART (CreatedDate)
    foreign key (CartID) references CART(CartID) on update cascade on delete cascade,
    foreign key (ProductSizeColorID) references PRODUCTSIZECOLOR(ProductSizeColorID) on update cascade on delete cascade
);
go
--Thêm dữ liệu bảng CartItem
INSERT INTO CARTITEMS (CartID, ProductSizeColorID, Quantity, AddedDate)
SELECT 
    C.CartID, 
    PS.ProductSizeColorID, 
    1 AS Quantity, -- hoặc số lượng bạn muốn (1 ở đây là ví dụ)
    GETDATE() AS AddedDate
FROM 
    CART C
JOIN 
    PRODUCTSIZECOLOR PS ON PS.ProductSizeColorID BETWEEN 1 AND 100
WHERE 
    C.CartID IN (1, 2, 3, 4, 5, 6, 7) -- Bạn có thể thay đổi CartID tùy vào dữ liệu của bạn
ORDER BY 
    C.CartID, PS.ProductSizeColorID;


go
create table PaymentMethods (
	PaymentMethodID int primary key identity(1,1), -- ID duy nhất của phương thức thanh toán
	MethodName varchar(255) not null,             -- Tên phương thức thanh toán (ví dụ: COD, Credit Card)
	Description text,                             -- Mô tả chi tiết (nếu cần)
	IsActive bit not null default 1               -- Trạng thái kích hoạt (1: Đang hoạt động, 0: Không hoạt động)
);
go
insert into PaymentMethods (MethodName, Description, IsActive)
values 
('COD', 'Cash on Delivery', 1),
('Credit Card', 'Payment via Credit Card', 1);
go
create table ORDERS (
	OrderID int primary key identity(1,1),
	UserID int not null,
	OrderDate date not null,
	TotalAmount decimal(10,2) null,
	PaymentMethodID int references PaymentMethods(PaymentMethodID) on update cascade on delete cascade,
	foreign key (UserID) references USERS(UserID) on update cascade on delete cascade
);
go
--Cần check để bảng này không thể nhiều dữ liệu hơn bảng Cart
INSERT INTO ORDERS (UserID, OrderDate, TotalAmount, PaymentMethodID)
VALUES
(1, '2025-01-01', NULL, 1),
(1, '2025-01-02', NULL, 1),
(1, '2025-01-03', NULL, 2),
(2, '2025-01-01', NULL, 1),
(2, '2025-01-05', NULL, 2),
(3, '2025-01-07', NULL, 1),
(3, '2025-01-07', NULL, 2),
(4, '2025-01-07', NULL, 1),
(4, '2025-01-08', NULL, 2),
(5, '2025-01-01', NULL, 1),
(6, '2025-01-02', NULL, 2),	
(7, '2025-01-01', NULL, 1),
(7, '2025-01-03', NULL, 2);
go
create table ORDERSTATUS (
    OrderID int foreign key (OrderID) references ORDERS(OrderID) on update cascade on delete cascade,
    StatusName varchar(50) not null,
	primary key(OrderID)
);
go
INSERT INTO ORDERSTATUS (OrderID, StatusName)
VALUES
(1, 'Pending'),
(2, 'Processing'),
(3, 'Shipped'),
(4, 'Pending'),
(5, 'Shipped'),
(6, 'Processing'),
(7, 'Pending'),
(8, 'Shipped'),
(9, 'Pending'),
(10, 'Processing'),
(11, 'Shipped'),
(12, 'Pending'),
(13, 'Shipped');
go
create table ORDERDETAILS (
    OrderDetailID int primary key identity(1,1),
    OrderID int not null,
    ProductSizeColorID int not null,
    Quantity int not null,
    Price decimal(10,2) not null,
    foreign key (OrderID) references ORDERS(OrderID) on update cascade on delete cascade,
    foreign key (ProductSizeColorID) references PRODUCTSIZECOLOR(ProductSizeColorID) on update cascade on delete cascade
);
go	
--Thêm dữ liệu vào ORDERDETAILS
DECLARE @OrderID INT, @ProductSizeColorID INT, @Quantity INT, @Price DECIMAL(10, 2);
SET @Quantity = 1; -- Số lượng sản phẩm (có thể thay đổi)
SET @Price = 100.00; -- Giá sản phẩm (có thể thay đổi)

-- Lặp qua từng OrderID từ 1 đến 13 và thêm 50 sản phẩm cho mỗi OrderID
DECLARE @i INT = 1;
WHILE @i <= 13
BEGIN
    SET @OrderID = @i;
    
    -- Lặp qua các ProductSizeColorID từ 1 đến 50 cho mỗi OrderID
    DECLARE @j INT = 1;
    WHILE @j <= 50
    BEGIN
        SET @ProductSizeColorID = @j;
        
        -- Thêm vào ORDERDETAILS
        INSERT INTO ORDERDETAILS (OrderID, ProductSizeColorID, Quantity, Price)
        VALUES (@OrderID, @ProductSizeColorID, @Quantity, @Price);
        
        SET @j = @j + 1;
    END

    SET @i = @i + 1;
END
go
create table REVIEWS (
    ReviewID int primary key identity(1,1),
    UserID int not null,
    ProductID int not null,
    Rating int not null,
    Comment nvarchar(500),
    ReviewDate date not null,
    foreign key (UserID) references USERS(UserID) on update cascade on delete cascade,
    foreign key (ProductID) references PRODUCTS(ProductID) on update cascade on delete cascade
);
go
INSERT INTO REVIEWS (UserID, ProductID, Rating, Comment, ReviewDate)
VALUES
(1, 1, 5, N'Sản phẩm tuyệt vời, tôi rất hài lòng!', '2025-02-20'),
(1, 2, 4, N'Chất lượng tốt, nhưng giá hơi cao.', '2025-02-20'),
(2, 3, 3, N'Sản phẩm không như mong đợi, có thể cải thiện.', '2025-02-20'),
(2, 4, 2, N'Hơi thất vọng, sản phẩm không đúng mô tả.', '2025-02-21'),
(3, 5, 4, N'Chất liệu ổn, nhưng thiết kế chưa thực sự đẹp.', '2025-02-21'),
(3, 6, 5, N'Rất thích sản phẩm này, sẽ mua lại.', '2025-02-22'),
(4, 7, 3, N'Không hợp với tôi, sẽ không mua nữa.', '2025-02-22'),
(4, 8, 4, N'Sản phẩm khá tốt, nhưng cần cải thiện độ bền.', '2025-02-22'),
(5, 9, 5, N'Mọi thứ đều tuyệt vời, sản phẩm đẹp và chất lượng tốt.', '2025-02-22'),
(5, 10, 4, N'Mua cho quà tặng, người nhận rất thích.', '2025-02-23'),
(6, 1, 2, N'Không như kỳ vọng, chất liệu kém.', '2025-02-23'),
(6, 2, 3, N'Sản phẩm ổn, nhưng có một số điểm chưa hoàn hảo.', '2025-02-23'),
(7, 3, 4, N'Sản phẩm đẹp, nhưng giao hàng chậm.', '2025-02-24'),
(7, 4, 5, N'Rất hài lòng với sản phẩm này, chất lượng tuyệt vời!', '2025-02-24');

go
--theo dõi và ghi nhận hành vi của người dùng đối với các sản phẩm cụ thể.
create table PRODUCTVIEWS (
    ViewID int primary key identity(1,1),
    ProductID int not null,
    UserID int not null,
    ViewDate date not null,
    foreign key (ProductID) references PRODUCTS(ProductID) on update cascade on delete cascade,
    foreign key (UserID) references USERS(UserID) on update cascade on delete cascade
);
go
create table CHATSESSIONS (
    SessionID int primary key identity(1,1), -- ID duy nhất cho mỗi phiên trò chuyện
    UserID int,                              -- ID người dùng tham gia trò chuyện
    StartTime datetime not null default getdate(), -- Thời điểm bắt đầu phiên
    EndTime datetime,                        -- Thời điểm kết thúc phiên (nếu có)
    foreign key (UserID) references USERS(UserID)  on update cascade on delete cascade -- Liên kết với người dùng
);
go
create table CHATMESSAGES (
    MessageID int primary key identity(1,1), -- ID duy nhất cho mỗi tin nhắn
    SessionID int not null,                  -- ID của phiên trò chuyện
    Sender varchar(50) not null,             -- Người gửi: 'User' hoặc 'AI'
    MessageText nvarchar(2000) not null,               -- Nội dung tin nhắn
    Timestamp datetime not null default getdate(), -- Thời gian gửi tin nhắn
    foreign key (SessionID) references CHATSESSIONS(SessionID) on update cascade on delete cascade -- Liên kết tới phiên trò chuyện
);
go
create table INVENTORY (
    InventoryID int primary key identity(1,1), -- ID duy nhất của tồn kho
	ProductSizeColorID int, 
    Stock int not null,              -- Số lượng sản phẩm trong kho
    LastUpdated datetime not null default getdate(), -- Thời điểm cập nhật tồn kho
    foreign key (ProductSizeColorID) references ProductSizeColor(ProductSizeColorID) on delete cascade on update cascade
);
go
INSERT INTO INVENTORY (ProductSizeColorID, Stock, LastUpdated)
SELECT ProductSizeColorID, 20 AS Stock, GETDATE() AS LastUpdated
FROM PRODUCTSIZECOLOR;
go
create table ShippingCompanies (
    ShippingCompanyID int primary key identity(1,1), -- ID duy nhất cho từng đơn vị vận chuyển
    CompanyName nvarchar(255) not null,              -- Tên đơn vị vận chuyển
    Address nvarchar(100)                                    -- Địa chỉ trụ sở chính
);
go
insert into ShippingCompanies (CompanyName, Address)
values 
(N'Bưu điện', 'Address 1'),
(N'Shopee', 'Address 2'),
(N'Grab', 'Address 3');
go
create table Shipping (
    ShippingID int primary key identity(1,1),   -- ID duy nhất cho từng mục vận chuyển
    OrderID int foreign key (OrderID) references ORDERS(OrderID) on delete cascade on update cascade,                       -- Liên kết với đơn hàng
	ShippingCompanyID int foreign key (ShippingCompanyID) references ShippingCompanies(ShippingCompanyID) on delete cascade on update cascade,
    Address nvarchar(200) not null,                      -- Địa chỉ giao hàng
    ShippingMethod nvarchar(255) not null,       -- Phương thức vận chuyển (ví dụ: Giao hàng nhanh, giao hàng thường)
    ShippingStatus nvarchar(50) not null,        -- Trạng thái giao hàng (ví dụ: Đang vận chuyển, Đã giao)
    EstimatedDeliveryDate date null,             -- Ngày giao hàng dự kiến
    ActualDeliveryDate date null,                -- Ngày giao hàng thực tế (nếu có)
    TrackingNumber varchar(255),                -- Mã theo dõi đơn hàng (từ công ty vận chuyển)
);
go
INSERT INTO Shipping (OrderID, ShippingCompanyID, Address, ShippingMethod, ShippingStatus, EstimatedDeliveryDate, ActualDeliveryDate, TrackingNumber)
VALUES
(1, 1, N'123 Đường ABC, Quận 1, TP.HCM', N'Giao hàng nhanh', N'Đang vận chuyển', '2025-02-25', NULL, 'TRACK12345'),
(2, 2, N'456 Đường XYZ, Quận 3, TP.HCM', N'Giao hàng thường', N'Đang vận chuyển', '2025-02-26', NULL, 'TRACK12346'),
(3, 1, N'789 Đường PQR, Quận 5, TP.HCM', N'Giao hàng nhanh', N'Đã giao', '2025-02-24', '2025-02-24', 'TRACK12347'),
(4, 2, N'321 Đường LMN, Quận 7, TP.HCM', N'Giao hàng thường', N'Đang vận chuyển', '2025-02-27', NULL, 'TRACK12348'),
(5, 3, N'654 Đường STU, Quận 10, TP.HCM', N'Giao hàng nhanh', N'Đã giao', '2025-02-25', '2025-02-25', 'TRACK12349'),
(6, 2, N'987 Đường WXY, Quận 2, TP.HCM', N'Giao hàng thường', N'Đang vận chuyển', '2025-02-28', NULL, 'TRACK12350'),
(7, 1, N'111 Đường ABC, Quận 4, TP.HCM', N'Giao hàng nhanh', N'Đã giao', '2025-02-22', '2025-02-22', 'TRACK12351'),
(8, 2, N'222 Đường DEF, Quận 11, TP.HCM', N'Giao hàng thường', N'Đang vận chuyển', '2025-02-28', NULL, 'TRACK12352'),
(9, 3, N'333 Đường GHI, Quận 12, TP.HCM', N'Giao hàng nhanh', N'Đã giao', '2025-02-23', '2025-02-23', 'TRACK12353'),
(10, 2, N'444 Đường JKL, Quận 8, TP.HCM', N'Giao hàng thường', N'Đang vận chuyển', '2025-03-01', NULL, 'TRACK12354'),
(11, 1, N'555 Đường MNO, Quận 6, TP.HCM', N'Giao hàng nhanh', N'Đã giao', '2025-02-24', '2025-02-24', 'TRACK12355'),
(12, 2, N'666 Đường OPQ, Quận 9, TP.HCM', N'Giao hàng thường', N'Đang vận chuyển', '2025-03-02', NULL, 'TRACK12356'),
(13, 1, N'777 Đường RST, Quận 5, TP.HCM', N'Giao hàng nhanh', N'Đang vận chuyển', '2025-02-28', NULL, 'TRACK12357');
go
create table Voucher(
	VoucherID int primary key identity(1,1),
	VoucherDay date,
	DiscountValue int
)
go 
INSERT INTO Voucher (VoucherDay, DiscountValue)
VALUES
    ('2025-02-15', 10),     -- Voucher giảm 10% 
    ('2025-02-16', 15),     -- Voucher giảm 15% 
    ('2025-02-17', 20),     -- Voucher giảm 20% 
    ('2025-02-18', 25),     -- Voucher giảm 25% 
    ('2025-02-19', 30),     -- Voucher giảm 30% 
    ('2025-02-20', 50);     -- Voucher giảm 50%


--Check dữ liệu trong ProductCategories
select ProductCategoryID,pc.ProductID,pc.CategoryID,CategoryName,ProductName
from ProductCategories pc inner join PRODUCTS p on p.ProductID=pc.ProductID
inner join CATEGORIES c on c.CategoryID=pc.CategoryID

--Tạo trigger check ngày thêm vào giỏ hàng phải lớn hơn ngày tạo giỏ
CREATE TRIGGER trg_CheckAddedDate
ON CARTITEMS
AFTER INSERT
AS
BEGIN
    DECLARE @CartID INT, @CreatedDate DATE, @AddedDate DATETIME;

    -- Lấy thông tin CartID, CreatedDate từ bảng CART và AddedDate từ bảng CARTITEMS
    SELECT @CartID = CartID FROM INSERTED;
    SELECT @AddedDate = AddedDate FROM INSERTED;
    
    -- Lấy CreatedDate từ bảng CART dựa trên CartID
    SELECT @CreatedDate = CreatedDate
    FROM CART
    WHERE CartID = @CartID;
    
    -- Kiểm tra điều kiện: nếu AddedDate không sau CreatedDate, trả về lỗi
    IF @AddedDate <= @CreatedDate
    BEGIN
        RAISERROR('Ngày thêm vào phải sau ngày tạo giỏ hàng.', 16, 1);
        ROLLBACK TRANSACTION; -- Hủy thao tác insert nếu không thỏa mãn điều kiện
    END
END;
GO


select * from PRODUCTIMAGES pm where pm.ProductID = 23