<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="productDAO" class="productDAO.ProductDAO" scope="page"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LigmaShop</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/grid.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/logoLigma.png" />
        <script>
            function previewAvatar(event) {
                var reader = new FileReader();
                reader.onload = function () {
                    var output = document.getElementById('avatarPreview');
                    output.style.backgroundImage = "url('" + reader.result + "')";
                };
                reader.readAsDataURL(event.target.files[0]);
            }
        </script>
    </head>


    <body>
        <div class="app">
            <header class="header">
                <div class="grid wide">
                    <nav class="header__navbar hide-on-mobile-tablet">
                        <ul class="header__navbar-list">
                            <li class="header__navbar-item header__navbar-item--hasqr header__navbar-item--separate">
                                Tải ứng dụng
                                <!--Header QR Code-->
                                <div class="header__qr">
                                    <img src="${pageContext.request.contextPath}/images/qr.png" alt="QR code" class="header__qr-img">
                                    <div class="header__qr-apps">
                                        <a href="" class="header__qr-link">
                                            <img src="${pageContext.request.contextPath}/images/1fddd5ee3e2ead84.png" alt="Google Play" class="header__qr-download-img">
                                        </a>
                                        <a href="" class="header__qr-link">
                                            <img src="${pageContext.request.contextPath}/images/135555214a82d8e1.png" alt="AppStore" class="header__qr-download-img">
                                        </a>
                                    </div>
                                </div>
                            </li>
                            <li class="header__navbar-item">
                                Kết nối
                                <a href="" class="header__navbar-icon-link">
                                    <i class="fa-brands fa-facebook"></i>
                                </a>

                                <a href="" class="header__navbar-icon-link">
                                    <i class="fa-brands fa-instagram"></i>
                                </a>
                            </li>
                        </ul>
                        <ul class="header__navbar-list">
                            <li class="header__navbar-item header__navbar-item-hasnotify">
                                <a href="" class="header__navbar-item-link header__navbar-icon-link">
                                    <i class="fa-regular fa-bell icon-notice-help"></i>
                                    Thông báo
                                </a>

                            </li>
                            <li class="header__navbar-item">
                                <a href="" class="header__navbar-item-link header__navbar-icon-link">
                                    <i class="fa-duotone fa-solid fa-question icon-notice-help"></i>
                                    Trợ giúp
                                </a>
                            </li>


                            <!--Người dùng đã đăng nhập-->
                            <!--                        <li class="header__navbar-item header__navbar-user">
                                                        <img src="images/user.jpg" alt="" class="header__navbar-user-img">
                                                        <span class="header__navbar-user-name">LigmaShop</span>-->
                            <li class="header__navbar-item header__navbar-user">
                                <img src="${pageContext.request.contextPath}/images/user.jpg" alt="hello" class="header__navbar-user-img">
                                <span class="header__navbar-user-name">LigmaShop</span>
                                <ul class="header__navbar-user-menu">
                                    <li class="header__navbar-user-item">
                                        <a href="${pageContext.request.contextPath}/ligmaShop/adminPage.jsp">Quản lý sản phẩm</a>
                                    </li>
                                    <li class="header__navbar-user-item">
                                        <a href="">Hồ sơ của tôi</a>
                                    </li>
                                    <li class="header__navbar-user-item">
                                        <a href="">Vip</a>
                                    </li>
                                    <li class="header__navbar-user-item">
                                        <a href="">Cài Đặt</a>
                                    </li>
                                    <li class="header__navbar-user-item">
                                        <a href="${pageContext.request.contextPath}/ligmaShop/guest.jsp">Đăng Xuất</a>
                                    </li>
                                </ul>
                            </li>

                        </ul>
                    </nav>
                    <!--LoGo Search Cart-->
                    <div class="header-with-search">
                        <label for="mobile-search-checkbox" class="header__mobile-search">
                            <i class="header__mobile-search-icon fas fa-search"></i>
                        </label>
                        <div class="header__logo">
                            <a href="${pageContext.request.contextPath}/ligmaShop/user.jsp" ><img src="${pageContext.request.contextPath}/images/LIGMA SHOP WHITE ON BLACK.png" alt="" class="header__logo-img"></a>
                        </div>

                        <input type="checkbox" hidden id="mobile-search-checkbox" class="header__search-checkbox">

                        <div class="header__search">
                            <div class="header__search-input-wrap">

                                <input type="text" class="header__search-input" placeholder="Tìm kiếm sản phẩm" id="searchQuery">


                            </div>
                            <div class="header__search-select">
                                <span class="header__search-select-label">Trong Shop</span>
                                <i class="header__search-select-icon fa-solid fa-chevron-down"></i>

                                <ul class="header__search-option">
                                    <li class="header__search-option-item header__search-option-item--active">
                                        <span>Trong Shop</span> 
                                        <i class="fa-solid fa-check"></i>
                                    </li>
                                    <li class="header__search-option-item">
                                        <span>Ngoài Shop</span> 
                                        <i class="fa-solid fa-check"></i>
                                    </li>
                                </ul>


                            </div>
                            <form action="search" method="POST" id="submitSearch">
                                <input hidden name="query" id="hiddenQuery"/>
                                <button type="submit" class="header__search-btn" onClick="submitSearch()">
                                    <i class="header__search-btn-icon fa-solid fa-magnifying-glass"></i>
                                </button>
                            </form>
                            <script>
                                function submitSearch() {
                                    document.getElementById('hiddenQuery').value = document.getElementById('searchQuery').value;
                                }
                            </script>

                        </div>
                        <!--Shopping Cart-->
                        <div class="header__cart">
                            <div class="header__cart-wrap">
                                <i class="header__cart-icon fa-solid fa-cart-plus"></i>

                                <!--                            No cart: header__cart--no-cart-->
                                <div class="header__cart-list header__cart--no-cart">
                                    <img src="images/no-cart.jpg" alt="" class="header__cart-no-cart-img">

                                </div>
                            </div>
                        </div>

                    </div>

                </div>
                <ul class="header__sort-bar">
                    <li class="header__sort-item">
                        <a href="" class="header__sort-link">Liên quan</a>
                    </li>    
                    <li class="header__sort-item header__sort-item--active">
                        <a href="" class="header__sort-link">Mới Nhất</a>
                    </li>    
                    <li class="header__sort-item">
                        <a href="" class="header__sort-link">Bán chạy</a>
                    </li>    
                    <li class="header__sort-item">
                        <a href="" class="header__sort-link">Giá</a>
                    </li>    
                </ul>
            </header>
            <div class="app__container">
                <div class="grid wide">
                    <div class="row sm-gutter app__content">
                        <div class="col l-2 m-0 c-0">
                            <nav class="category">
                                <h3 class="category__heading">
                                    <i class="category__heading-icon fa-solid fa-list"></i>
                                    Tài Khoản Của Tôi
                                </h3>
                                <ul class="category-list">
                                    <li class="category-item category-item--active">
                                        <a href="${pageContext.request.contextPath}/ligmaShop/profilePage.jsp" class="category-item__link">Hồ Sơ Cá Nhân</a>
                                    </li>
                                    <li class="category-item">
                                        <a href="" class="category-item__link">Sản Phẩm Đã Mua</a>
                                    </li>
                                    <li class="category-item">
                                        <a href="${pageContext.request.contextPath}/ligmaShop/changePassPage.jsp" class="category-item__link">Đổi Mật Khẩu</a>
                                    </li>

                                </ul>
                            </nav>
                        </div>
                        <script>
                            document.addEventListener("DOMContentLoaded", function () {
                                // Lấy đường dẫn hiện tại, chỉ lấy phần pathname để tránh lỗi so khớp URL đầy đủ
                                let currentPath = window.location.pathname;

                                // Lấy tất cả các thẻ <a> trong menu
                                let links = document.querySelectorAll(".category-item__link");

                                links.forEach(link => {
                                    // Lấy đường dẫn của link (chỉ phần pathname)
                                    let linkPath = new URL(link.href, window.location.origin).pathname;

                                    // Kiểm tra nếu đường dẫn trang hiện tại khớp với đường dẫn của link
                                    if (currentPath === linkPath) {
                                        // Xóa class active của tất cả
                                        document.querySelectorAll(".category-item").forEach(item => {
                                            item.classList.remove("category-item--active");
                                        });

                                        // Thêm class active vào <li> chứa link hiện tại
                                        link.parentElement.classList.add("category-item--active");
                                    }
                                });
                            });

                        </script>
                        <!--                    </div>-->

                        <!--                                <div class="row sm-gutter">
                                                                    Product item
                                                                    <div class="col l-2-4 m-4 c-6">-->
                        <!--<div class="row sm-gutter">
                        <div class="col l-2-4 m-4 c-6">-->
                        <!--<div class="profile-container">-->
                        <div class="container-profile">
                            <div class="form-container">
                                <!-- Phần nội dung form -->
                                <div class="form-content">
                                    <form action="profile" method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label class="text-form" for="username">Tên đăng nhập</label>
                                            <input type="text" id="username" name="username" value="${username}" readonly>
                                        </div>

                                        <div class="form-group">
                                            <label class="text-form" for="name">Tên</label>
                                            <input type="text" id="name" name="name" value="${name}" required>
                                        </div>

                                        <div class="form-group">
                                            <label class="text-form" for="email">Email</label>
                                            <input type="email" id="email" name="email" value="${email}" required>
                                        </div>

                                        <div class="form-group">
                                            <label class="text-form" for="phone">Số điện thoại</label>
                                            <input type="text" id="phone" name="phone" value="${phone}" required>
                                        </div>

                                        <div class="form-group">
                                            <label class="text-form">Giới tính</label>
                                            <div class="gender-group">
                                                <label><input type="radio" name="gender" value="Nam" ${gender == 'Nam' ? 'checked' : ''}> Nam</label>
                                                <label><input type="radio" name="gender" value="Nữ" ${gender == 'Nữ' ? 'checked' : ''}> Nữ</label>
                                                <label><input type="radio" name="gender" value="Khác" ${gender == 'Khác' ? 'checked' : ''}> Khác</label>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="text-form" for="dateOfBirth">Ngày sinh</label>
                                            <input type="date" id="dateOfBirth" name="dateOfBirth" value="${dateOfBirth}" required>
                                        </div>

                                        <!-- Thêm mục địa chỉ -->
                                        <div class="form-group">
                                            <label class="text-form">Địa chỉ</label>
                                            <div class="address-group">
                                                <input type="text" id="detail" name="detail" value="${detail}" placeholder="Số nhà, tên đường..." required>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <button type="submit">Lưu</button>
                                        </div>
                                    </form>

                                    <% if (request.getAttribute("message") != null) { %>
                                    <p class="success"><%= request.getAttribute("message") %></p>
                                    <% } %>
                                    <% if (request.getAttribute("error") != null) { %>
                                    <p class="error"><%= request.getAttribute("error") %></p>
                                    <% } %>
                                </div>

                                <!-- Phần chọn ảnh avatar -->
                                <div class="avatar-container">
                                    <div id="avatarPreview" class="avatar" style="background-image: url('${avatarUrl != null ? avatarUrl : "https://via.placeholder.com/150"}');"></div>
                                    <label for="avatar">Chọn ảnh đại diện:</label>
                                    <input type="file" id="avatar" name="avatar" accept=".jpg, .jpeg, .png" onchange="previewAvatar(event)">
                                    <p style="font-size: 12px; color: #666;">Dung lượng tối đa 1MB, định dạng .JPEG, .PNG</p>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


            <footer class="footer">
                <div class="grid wide">
                    <div class="row">
                        <div class="col l-3 m-3 c-6">
                            <h3 class="footer__heading">Chăm sóc khách hàng</h3>
                            <ul class="footer__list">
                                <li class="footer__list-item">
                                    <a href="" class="footer__list-item__link">Đinh Huy Hoàng</a>
                                </li>
                                <li class="footer__list-item">
                                    <a href="" class="footer__list-item__link">Lê Xuân Hoàng</a>
                                </li>
                                <li class="footer__list-item">
                                    <a href="" class="footer__list-item__link">Nguyễn Đức Huy Hoàng</a>
                                </li>
                                <li class="footer__list-item">
                                    <a href="" class="footer__list-item__link">Lê Thành Đạt</a>
                                </li>
                                <li class="footer__list-item">
                                    <a href="" class="footer__list-item__link">Nguyễn Đình Duy</a>
                                </li>
                                <li class="footer__list-item">
                                    <a href="" class="footer__list-item__link">Nguyễn Minh Hiếu</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col l-3 m-3 c-6">
                            <h3 class="footer__heading">Theo dõi chúng tôi trên</h3>
                            <ul class="footer__list">
                                <li class="footer__list-item">
                                    <a href="" class="footer__list-item__link">
                                        <i class="footer__list-item-icon fab fa-facebook"></i>
                                        Facebook
                                    </a>
                                </li>
                                <li class="footer__list-item">
                                    <a href="" class="footer__list-item__link">
                                        <i class="footer__list-item-icon fab fa-instagram"></i>
                                        Instagram
                                    </a>
                                </li>
                                <li class="footer__list-item">
                                    <a href="" class="footer__list-item__link">
                                        <i class="footer__list-item-icon fab fa-tiktok"></i>
                                        Tiktok
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col l-3 m-3 c-6">
                            <h3 class="footer__heading">Vào cửa hàng</h3>
                            <div class="footer__download">
                                <img src="${pageContext.request.contextPath}/images/qr.png" alt="" class="footer__download-qr">                            
                                <div class="footer__download-apps">
                                    <a href="" class="footer__download-apps-link">
                                        <img src="${pageContext.request.contextPath}/images/1fddd5ee3e2ead84.png" alt="Goggle play" class="footer__download-apps-img">
                                    </a>
                                    <a href="" class="footer__download-apps-link">
                                        <img src="${pageContext.request.contextPath}/images/135555214a82d8e1.png" alt="AppStore" class="footer__download-apps-img">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer__bottom">
                    <div class="grid wide">
                        <p class="footer__text">2025 - Bản quyền thuộc về Công ti Những vì Tinh Tú LigmaShop</p>
                    </div>
                </div>
            </footer>
        </div>
    </body>
</html>
