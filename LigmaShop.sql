<<<<<<< HEAD
﻿create database LigmaShop
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
create table COMPANY (
    CompanyID int primary key identity(1,1), -- ID duy nhất của công ty
    CompanyName varchar(255) not null,       -- Tên công ty
    Address text,                            -- Địa chỉ công ty
    ContactNumber varchar(15),               -- Số điện thoại liên hệ
    Email varchar(255)                       -- Email công ty
);
go
create table CATEGORIES (
    CategoryID int primary key identity(1,1),
    CategoryName varchar(255) not null,
    Description text,
	CompanyID int foreign key (CompanyID) references COMPANY(CompanyID) on delete cascade on update cascade
);
go
create table PRODUCTS (
    ProductID int primary key identity(1,1),
    ProductName varchar(255) not null,
    Description text,
    Price decimal(10,2) not null,
    CategoryID int not null,
    CreatedDate date not null,
    foreign key (CategoryID) references CATEGORIES(CategoryID) on update cascade on delete cascade
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
create table COLORS (
    ColorID int primary key identity(1,1),
    ColorName varchar(50) not null,
    Description text
);
go
create table SIZES (
    SizeID int primary key identity(1,1),
    SizeName varchar(50) not null,
    Description text
);
go
create table PRODUCTSIZECOLOR (
    ProductSizeColorID int primary key identity(1,1),
    ProductID int not null,
    SizeID int not null,
    ColorID int not null,
    Stock int not null,
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
create table PaymentMethods (
    PaymentMethodID int primary key identity(1,1), -- ID duy nhất của phương thức thanh toán
    MethodName varchar(255) not null,             -- Tên phương thức thanh toán (ví dụ: COD, Credit Card)
    Description text,                             -- Mô tả chi tiết (nếu cần)
    IsActive bit not null default 1               -- Trạng thái kích hoạt (1: Đang hoạt động, 0: Không hoạt động)
);
go
create table ORDERSTATUS (
    StatusID int primary key identity(1,1),
    StatusName varchar(50) not null
);
go
create table ORDERS (
    OrderID int primary key identity(1,1),
    UserID int not null,
    OrderDate date not null,
    TotalAmount decimal(10,2) not null,
    StatusID int not null,
    PaymentMethodID int references PaymentMethods(PaymentMethodID) on update cascade on delete cascade,
    foreign key (UserID) references USERS(UserID) on update cascade on delete cascade,
    foreign key (StatusID) references ORDERSTATUS(StatusID) on update cascade on delete cascade
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
    CategoryID int not null,                   -- ID danh mục sản phẩm
    QuantityInStock int not null,              -- Số lượng sản phẩm trong kho
    LastUpdated datetime not null default getdate(), -- Thời điểm cập nhật tồn kho
    foreign key (CategoryID) references CATEGORIES(CategoryID) on delete cascade on update cascade
);
go
create table ShippingCompanies (
    ShippingCompanyID int primary key identity(1,1), -- ID duy nhất cho từng đơn vị vận chuyển
    CompanyName varchar(255) not null,              -- Tên đơn vị vận chuyển
    Address text                                    -- Địa chỉ trụ sở chính
);
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

=======
﻿create database LigmaShop
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
create table COMPANY (
    CompanyID int primary key identity(1,1), -- ID duy nhất của công ty
    CompanyName varchar(255) not null,       -- Tên công ty
    Address text,                            -- Địa chỉ công ty
    ContactNumber varchar(15),               -- Số điện thoại liên hệ
    Email varchar(255)                       -- Email công ty
);
go
create table CATEGORIES (
    CategoryID int primary key identity(1,1),
    CategoryName varchar(255) not null,
    Description text,
	CompanyID int foreign key (CompanyID) references COMPANY(CompanyID) on delete cascade on update cascade
);
go
create table PRODUCTS (
    ProductID int primary key identity(1,1),
    ProductName varchar(255) not null,
    Description text,
    Price decimal(10,2) not null,
    CategoryID int not null,
    CreatedDate date not null,
    foreign key (CategoryID) references CATEGORIES(CategoryID) on update cascade on delete cascade
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
create table COLORS (
    ColorID int primary key identity(1,1),
    ColorName varchar(50) not null,
    Description text
);
go
create table SIZES (
    SizeID int primary key identity(1,1),
    SizeName varchar(50) not null,
    Description text
);
go
create table PRODUCTSIZECOLOR (
    ProductSizeColorID int primary key identity(1,1),
    ProductID int not null,
    SizeID int not null,
    ColorID int not null,
    Stock int not null,
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
create table PaymentMethods (
    PaymentMethodID int primary key identity(1,1), -- ID duy nhất của phương thức thanh toán
    MethodName varchar(255) not null,             -- Tên phương thức thanh toán (ví dụ: COD, Credit Card)
    Description text,                             -- Mô tả chi tiết (nếu cần)
    IsActive bit not null default 1               -- Trạng thái kích hoạt (1: Đang hoạt động, 0: Không hoạt động)
);
go
create table ORDERSTATUS (
    StatusID int primary key identity(1,1),
    StatusName varchar(50) not null
);
go
create table ORDERS (
    OrderID int primary key identity(1,1),
    UserID int not null,
    OrderDate date not null,
    TotalAmount decimal(10,2) not null,
    StatusID int not null,
    PaymentMethodID int references PaymentMethods(PaymentMethodID) on update cascade on delete cascade,
    foreign key (UserID) references USERS(UserID) on update cascade on delete cascade,
    foreign key (StatusID) references ORDERSTATUS(StatusID) on update cascade on delete cascade
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
    CategoryID int not null,                   -- ID danh mục sản phẩm
    QuantityInStock int not null,              -- Số lượng sản phẩm trong kho
    LastUpdated datetime not null default getdate(), -- Thời điểm cập nhật tồn kho
    foreign key (CategoryID) references CATEGORIES(CategoryID) on delete cascade on update cascade
);
go
create table ShippingCompanies (
    ShippingCompanyID int primary key identity(1,1), -- ID duy nhất cho từng đơn vị vận chuyển
    CompanyName varchar(255) not null,              -- Tên đơn vị vận chuyển
    Address text                                    -- Địa chỉ trụ sở chính
);
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

>>>>>>> 0546a3cec472d268d602112fcd5330fdf9c76ec0
