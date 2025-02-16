create database LigmaShop
go
use LigmaShop
go
create table USERS (
    UserID int primary key identity(1,1),
    FullName varchar(255) not null,
    Email varchar(255) unique not null,
    Password varchar(255) not null,
    PhoneNumber varchar(15),
    Address text,
    Role varchar(50) check (Role in ('VIP','Thuong'))
);
go
insert into USERS (FullName, Email, Password, PhoneNumber, Address, Role)
values 
('Nguyen Van A', 'nguyenvana@example.com', 'password100', '0123456789', 'Hanoi', 'VIP'),
('Tran Thi B', 'tranthib@example.com', 'password101', '0987654321', 'HCM City', 'Thuong'),
('Le Van C', 'levanc@example.com', 'password102', '0911223344', 'Da Nang', 'VIP'),
('Pham Thi D', 'phamthid@example.com', 'password103', '0933445566', 'Hue', 'Thuong'),
('Hoang Van E', 'hoangvane@example.com', 'password104', '0922334455', 'Can Tho', 'Thuong'),
('Ngo Thi F', 'ngothif@example.com', 'password105', '0911332233', 'Hai Phong', 'VIP'),
('Vu Van G', 'vuvang@example.com', 'password106', '0945566778', 'Quang Ninh', 'Thuong');

go
create table COMPANY (
    CompanyID int primary key identity(1,1), -- ID duy nhất của công ty
    CompanyName varchar(255) not null,       -- Tên công ty
    Address text,                            -- Địa chỉ công ty
    ContactNumber varchar(15),               -- Số điện thoại liên hệ
    Email varchar(255)                       -- Email công ty
);
go
insert into COMPANY (CompanyName, Address, ContactNumber, Email)
values 
('Company A', '123 Street, Hanoi', '0123456789', 'contact@companya.com'),
('Company B', '456 Street, HCM City', '0987654321', 'contact@companyb.com'),
('Company C', '789 Street, Da Nang', '0911223344', 'contact@companyc.com'),
('Company D', '321 Street, Can Tho', '0933445566', 'contact@companyd.com');
go
create table CATEGORIES (
    CategoryID int primary key identity(1,1),
    CategoryName nvarchar(255) not null,
    Description nvarchar(500)
);
go
insert into CATEGORIES (CategoryName, Description)
values 
(N'Quần áo Nam', N'Tất cả quần và áo dành cho Nam'),
(N'Quần áo Nữ', N'Tất cả quần và áo dành cho Nữ'),
(N'Áo Nam', N'Tất cả áo dành cho Nam'),
(N'Áo Nữ', N'Tất cả áo dành cho Nữ'),
(N'Quần Nam', N'Tất cả quần cho Nam'),
(N'Quần Nữ', N'Tất cả quần cho Nữ'),
(N'Áo khoác', N'Tất cả áo khoác'),
(N'Đầm', N'Đầm dành cho nữ'),
(N'Đồ thể thao', N'Đồ thể thao dành cho cả Nam và Nữ');
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
(N'Áo sơ mi Nam', N'Áo sơ mi nam cao cấp', 150.00,'2025-01-01',1),
(N'Áo sơ mi Nữ', N'Áo sơ mi nữ thanh lịch', 140.00,'2025-01-01',1),
(N'Áo khoác Nam', N'Áo khoác nam thời trang', 250.00,'2025-01-01',1),
(N'Áo khoác Nữ', N'Áo khoác nữ đẹp', 240.00, '2025-01-01',1),
(N'Áo len Nam', N'Áo len ấm áp cho nam', 200.00,'2025-01-01',1),
(N'Áo len Nữ', N'Áo len dày cho nữ', 190.00, '2025-01-01',1),
(N'Quần jeans Nam', N'Quần jeans nam thời trang', 300.00,'2025-01-01',1),
(N'Quần jeans Nữ', N'Quần jeans nữ phong cách', 290.00, '2025-01-01',1),
(N'Quần kaki Nam', N'Quần kaki cho nam lịch lãm', 220.00, '2025-01-01',1),
(N'Quần kaki Nữ', N'Quần kaki nữ xinh xắn', 210.00,'2025-01-01',1),
(N'Quần short Nam', N'Quần short cho nam trẻ trung', 180.00, '2025-01-01',1),
(N'Quần short Nữ', N'Quần short cho nữ năng động', 170.00, '2025-01-01',2),
(N'Áo hoodie Nam', N'Áo hoodie cho nam thoải mái', 230.00,  '2025-01-01',2),
(N'Áo hoodie Nữ', N'Áo hoodie nữ dễ thương', 220.00, '2025-01-01',2),
(N'Áo khoác lông Nam', N'Áo khoác lông cho nam sang trọng', 350.00, '2025-01-01',2),
(N'Áo khoác lông Nữ', N'Áo khoác lông cho nữ ấm áp', 340.00,  '2025-01-01',2),
(N'Áo thun dài tay Nam', N'Áo thun dài tay nam mùa đông', 160.00, '2025-01-01',2),
(N'Áo thun dài tay Nữ', N'Áo thun dài tay nữ mùa đông', 150.00, '2025-01-01',2),
(N'Áo sơ mi họa tiết Nam', N'Áo sơ mi họa tiết nam thời trang', 170.00,  '2025-01-01',2),
(N'Áo sơ mi họa tiết Nữ', N'Áo sơ mi họa tiết nữ thanh lịch', 160.00, '2025-01-01',2),
(N'Áo khoác dáng dài Nam', N'Áo khoác dáng dài cho nam', 270.00,  '2025-01-01',2),
(N'Áo khoác dáng dài Nữ', N'Áo khoác dáng dài cho nữ', 260.00,  '2025-01-01',2),
(N'Quần sooc thể thao Nam', N'Quần sooc thể thao nam', 120.00,  '2025-01-01',2),
(N'Quần sooc thể thao Nữ', N'Quần sooc thể thao nữ', 110.00, '2025-01-01',2),
(N'Áo len cổ cao Nam', N'Áo len cổ cao nam', 200.00,  '2025-01-01',3),
(N'Áo len cổ cao Nữ', N'Áo len cổ cao nữ', 190.00, '2025-01-01',3),
(N'Áo vest Nam', N'Áo vest nam thanh lịch', 400.00, '2025-01-01',3),
(N'Áo vest Nữ', N'Áo vest nữ duyên dáng', 380.00, '2025-01-01',3),
(N'Áo croptop Nữ', N'Áo croptop cho nữ', 80.00,  '2025-01-01',3),
(N'Áo thun ngắn tay Nam', N'Áo thun ngắn tay cho nam', 85.00, '2025-01-01',3),
(N'Áo thun ngắn tay Nữ', N'Áo thun ngắn tay cho nữ', 75.00, '2025-01-01',3),
(N'Áo dài Nam', N'Áo dài nam truyền thống', 300.00,  '2025-01-01',3),
(N'Áo dài Nữ', N'Áo dài nữ truyền thống', 280.00, '2025-01-01',3),
(N'Đầm dạ hội Nữ', N'Đầm dạ hội nữ sang trọng', 500.00,  '2025-01-01',3),
(N'Đầm công sở Nữ', N'Đầm công sở nữ thanh lịch', 450.00,  '2025-01-01',3),
(N'Áo sát nách Nam', N'Áo sát nách nam', 70.00, '2025-01-01',4),
(N'Áo sát nách Nữ', N'Áo sát nách nữ', 60.00,  '2025-01-01',4),
(N'Áo thun thể thao Nam', N'Áo thun thể thao nam', 130.00,  '2025-01-01',4),
(N'Áo thun thể thao Nữ', N'Áo thun thể thao nữ', 120.00, '2025-01-01',4),
(N'Quần legging Nữ', N'Quần legging nữ', 100.00,  '2025-01-01',4),
(N'Quần legging Nam', N'Quần legging nam', 90.00, '2025-01-01',4),
(N'Áo sơ mi kẻ Nam', N'Áo sơ mi kẻ nam', 180.00,  '2025-01-01',4),
(N'Áo sơ mi kẻ Nữ', N'Áo sơ mi kẻ nữ', 170.00,  '2025-01-01',4),
(N'Áo chống nắng Nam', N'Áo chống nắng nam', 140.00, '2025-01-01',4),
(N'Áo chống nắng Nữ', N'Áo chống nắng nữ', 130.00, '2025-01-01',4);
go
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
    (c.CategoryName = N'Áo Nam' AND p.ProductName LIKE N'Áo%Nam') 
    OR (c.CategoryName = N'Áo Nữ' AND p.ProductName LIKE N'Áo%Nữ')
    OR (c.CategoryName = N'Quần Nam' AND p.ProductName LIKE N'Quần%Nam')
    OR (c.CategoryName = N'Quần Nữ' AND p.ProductName LIKE N'Quần%Nữ')
    OR (c.CategoryName = N'Quần áo Nam' AND (p.ProductName LIKE N'Áo%Nam' OR p.ProductName LIKE N'Quần%Nam'))
    OR (c.CategoryName = N'Quần áo Nữ' AND (p.ProductName LIKE N'Áo%Nữ' OR p.ProductName LIKE N'Quần%Nữ'))
	OR (c.CategoryName = N'Áo khoác' AND p.ProductName LIKE N'Áo%khoác%')
	OR (c.CategoryName = N'Đầm' AND p.ProductName LIKE N'Đầm%')
	OR (c.CategoryName = N'Đồ thể thao' AND (p.ProductName LIKE N'%thể thao%' OR p.ProductName LIKE N'%legging%'))
);
go
create table PRODUCTIMAGES (
    ImageID int primary key identity(1,1),
    ProductID int not null,
    ImageURL text not null,
    ImageType varchar(50),
    ImageOrder int,
    foreign key (ProductID) references PRODUCTS(ProductID) on update cascade on delete cascade
);
go
insert into PRODUCTIMAGES (ProductID, ImageURL, ImageType, ImageOrder)
values 
(1, 'https://example.com/image_1.jpg', 'Main', 1),
(2, 'https://example.com/image_2.jpg', 'Main', 1),
(3, 'https://example.com/image_3.jpg', 'Main', 1),
(4, 'https://example.com/image_4.jpg', 'Main', 1),
(5, 'https://example.com/image_5.jpg', 'Main', 1),
(6, 'https://example.com/image_6.jpg', 'Main', 1),
(7, 'https://example.com/image_7.jpg', 'Main', 1),
(8, 'https://example.com/image_8.jpg', 'Main', 1),
(9, 'https://example.com/image_1.jpg', 'Main', 1),
(10, 'https://example.com/image_2.jpg', 'Main', 1),
(11, 'https://example.com/image_3.jpg', 'Main', 1),
(12, 'https://example.com/image_4.jpg', 'Main', 1),
(13, 'https://example.com/image_5.jpg', 'Main', 1),
(14, 'https://example.com/image_6.jpg', 'Main', 1),
(15, 'https://example.com/image_7.jpg', 'Main', 1),
(16, 'https://example.com/image_8.jpg', 'Main', 1),
(17, 'https://example.com/image_1.jpg', 'Main', 1),
(18, 'https://example.com/image_2.jpg', 'Main', 1),
(19, 'https://example.com/image_3.jpg', 'Main', 1),
(20, 'https://example.com/image_4.jpg', 'Main', 1),
(21, 'https://example.com/image_5.jpg', 'Main', 1),
(22, 'https://example.com/image_6.jpg', 'Main', 1),
(23, 'https://example.com/image_7.jpg', 'Main', 1),
(24, 'https://example.com/image_8.jpg', 'Main', 1),
(25, 'https://example.com/image_1.jpg', 'Main', 1),
(26, 'https://example.com/image_2.jpg', 'Main', 1),
(27, 'https://example.com/image_3.jpg', 'Main', 1),
(28, 'https://example.com/image_4.jpg', 'Main', 1),
(29, 'https://example.com/image_5.jpg', 'Main', 1),
(30, 'https://example.com/image_6.jpg', 'Main', 1),
(31, 'https://example.com/image_7.jpg', 'Main', 1),
(32, 'https://example.com/image_8.jpg', 'Main', 1),
(33, 'https://example.com/image_1.jpg', 'Main', 1),
(34, 'https://example.com/image_2.jpg', 'Main', 1),
(35, 'https://example.com/image_3.jpg', 'Main', 1),
(36, 'https://example.com/image_4.jpg', 'Main', 1),
(37, 'https://example.com/image_5.jpg', 'Main', 1),
(38, 'https://example.com/image_6.jpg', 'Main', 1),
(39, 'https://example.com/image_7.jpg', 'Main', 1),
(40, 'https://example.com/image_8.jpg', 'Main', 1),
(41, 'https://example.com/image_1.jpg', 'Main', 1),
(42, 'https://example.com/image_2.jpg', 'Main', 1),
(43, 'https://example.com/image_3.jpg', 'Main', 1),
(44, 'https://example.com/image_4.jpg', 'Main', 1),
(45, 'https://example.com/image_5.jpg', 'Main', 1);
go
create table COLORS (
    ColorID int primary key identity(1,1),
    ColorName varchar(50) not null,
    Description text
);
go
insert into COLORS (ColorName, Description)
values 
('Đen', 'Màu đen'),
('Trắng', 'Màu trắng'),
('Xanh dương đậm', 'Màu xanh dương đậm'),
('Be', 'Màu be');
go
create table SIZES (
    SizeID int primary key identity(1,1),
    SizeName varchar(50) not null,
    Description text
);
go
insert into SIZES (SizeName, Description)
values 
('M', 'Size Medium'),
('L', 'Size Large'),
('XL', 'Size Extra Large'),
('XXL', 'Size Double Extra Large');
go
create table PRODUCTSIZECOLOR (
    ProductSizeColorID int primary key identity(1,1),
    ProductID int not null,
    SizeID int not null,
    ColorID int not null,
    foreign key (ProductID) references PRODUCTS(ProductID) on update cascade on delete cascade, 
    foreign key (SizeID) references SIZES(SizeID) on update cascade on delete cascade,
    foreign key (ColorID) references COLORS(ColorID) on update cascade on delete cascade
);
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
(2, '2025-01-01'),
(3, '2025-01-01'),
(4, '2025-01-01');
go
create table CARTITEMS (
    CartItemID int primary key identity(1,1),
    CartID int not null,
    ProductSizeColorID int not null,
    Quantity int not null,
    AddedDate datetime not null default getdate(),
    foreign key (CartID) references CART(CartID) on update cascade on delete cascade,
    foreign key (ProductSizeColorID) references PRODUCTSIZECOLOR(ProductSizeColorID) on update cascade on delete cascade
);
go
/*insert into CARTITEMS (CartID, ProductSizeColorID, Quantity, AddedDate)
values 
(1, 1, 2, '2025-01-02'),
(1, 2, 3, '2025-01-02'),
(2, 3, 1, '2025-01-02'),
(3, 4, 4, '2025-01-02'),
(4, 5, 2, '2025-01-02'),
(4, 6, 1, '2025-01-02');
*/
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
    TotalAmount decimal(10,2) not null,
    PaymentMethodID int references PaymentMethods(PaymentMethodID) on update cascade on delete cascade,
    foreign key (UserID) references USERS(UserID) on update cascade on delete cascade
);
go
create table ORDERSTATUS (
    OrderID int foreign key (OrderID) references ORDERS(OrderID) on update cascade on delete cascade,
    StatusName varchar(50) not null,
	primary key(OrderID)
);
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
create table REVIEWS (
    ReviewID int primary key identity(1,1),
    UserID int not null,
    ProductID int not null,
    Rating int not null,
    Comment text,
    ReviewDate date not null,
    foreign key (UserID) references USERS(UserID) on update cascade on delete cascade,
    foreign key (ProductID) references PRODUCTS(ProductID) on update cascade on delete cascade
);
go
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
    MessageText text not null,               -- Nội dung tin nhắn
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
create table ShippingCompanies (
    ShippingCompanyID int primary key identity(1,1), -- ID duy nhất cho từng đơn vị vận chuyển
    CompanyName varchar(255) not null,              -- Tên đơn vị vận chuyển
    Address text                                    -- Địa chỉ trụ sở chính
);
go
insert into ShippingCompanies (CompanyName, Address)
values 
('Bưu điện', 'Address 1'),
('Shopee', 'Address 2'),
('Grab', 'Address 3');
go
create table Shipping (
    ShippingID int primary key identity(1,1),   -- ID duy nhất cho từng mục vận chuyển
    OrderID int foreign key (OrderID) references ORDERS(OrderID) on delete cascade on update cascade,                       -- Liên kết với đơn hàng
	ShippingCompanyID int foreign key (ShippingCompanyID) references ShippingCompanies(ShippingCompanyID) on delete cascade on update cascade,
    Address text not null,                      -- Địa chỉ giao hàng
    ShippingMethod varchar(255) not null,       -- Phương thức vận chuyển (ví dụ: Giao hàng nhanh, giao hàng thường)
    ShippingStatus varchar(50) not null,        -- Trạng thái giao hàng (ví dụ: Đang vận chuyển, Đã giao)
    EstimatedDeliveryDate datetime,             -- Ngày giao hàng dự kiến
    ActualDeliveryDate datetime,                -- Ngày giao hàng thực tế (nếu có)
    TrackingNumber varchar(255),                -- Mã theo dõi đơn hàng (từ công ty vận chuyển)
);
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