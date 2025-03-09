<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LigmaShop - Checkout</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/base.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/grid.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/main.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    </head>
    <body>
        <div class="app">
            <!-- Header (Reused from User/Cart Page) -->
            <header class="header">
                <div class="grid wide">
                    <nav class="header__navbar hide-on-mobile-tablet">
                        <ul class="header__navbar-list">
                            <li class="header__navbar-item header__navbar-item--hasqr header__navbar-item--separate">
                                Tải ứng dụng
                                <div class="header__qr">
                                    <img src="images/5b6e787c2e5ee052.png" alt="QR code" class="header__qr-img">
                                    <div class="header__qr-apps">
                                        <a href="" class="header__qr-link">
                                            <img src="images/1fddd5ee3e2ead84.png" alt="Google Play" class="header__qr-download-img">
                                        </a>
                                        <a href="" class="header__qr-link">
                                            <img src="images/135555214a82d8e1.png" alt="AppStore" class="header__qr-download-img">
                                        </a>
                                    </div>
                                </div>
                            </li>
                            <li class="header__navbar-item">
                                Kết nối
                                <a href="" class="header__navbar-icon-link"><i class="fa-brands fa-facebook"></i></a>
                                <a href="" class="header__navbar-icon-link"><i class="fa-brands fa-instagram"></i></a>
                            </li>
                        </ul>
                        <ul class="header__navbar-list">
                            <li class="header__navbar-item header__navbar-item-hasnotify">
                                <a href="" class="header__navbar-item-link header__navbar-icon-link">
                                    <i class="fa-regular fa-bell icon-notice-help"></i> Thông báo
                                </a>
                                <!-- Notification content omitted for brevity -->
                            </li>
                            <li class="header__navbar-item">
                                <a href="" class="header__navbar-item-link header__navbar-icon-link">
                                    <i class="fa-duotone fa-solid fa-question icon-notice-help"></i> Trợ giúp
                                </a>
                            </li>
                            <li class="header__navbar-user">
                                <img src="images/user.jpg" alt="" class="header__navbar-user-img">
                                <span class="header__navbar-user-name">LigmaShop</span>
                                <ul class="header__navbar-user-menu">
                                    <li class="header__navbar-user-item"><a href="">Hồ sơ của tôi</a></li>
                                    <li class="header__navbar-user-item"><a href="">Vip</a></li>
                                    <li class="header__navbar-user-item"><a href="">Cài Đặt</a></li>
                                    <li class="header__navbar-user-item"><a href="">Đăng Xuất</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                    <div class="header-with-search">
                        <label for="mobile-search-checkbox" class="header__mobile-search">
                            <i class="header__mobile-search-icon fas fa-search"></i>
                        </label>
                        <div class="header__logo">
                            <img src="images/LIGMA SHOP WHITE ON BLACK.png" alt="" class="header__logo-img">
                        </div>
                        <input type="checkbox" hidden id="mobile-search-checkbox" class="header__search-checkbox">
                        <div class="header__search">
                            <div class="header__search-input-wrap">
                                <input type="text" class="header__search-input" placeholder="Tìm kiếm sản phẩm">
                                <!-- Search history omitted for brevity -->
                            </div>
                            <div class="header__search-select">
                                <span class="header__search-select-label">Trong Shop</span>
                                <i class="header__search-select-icon fa-solid fa-chevron-down"></i>
                                <!-- Search options omitted for brevity -->
                            </div>
                            <button class="header__search-btn">
                                <i class="header__search-btn-icon fa-solid fa-magnifying-glass"></i>
                            </button>
                        </div>
                        <div class="header__cart">
                            <div class="header__cart-wrap">
                                <i class="header__cart-icon fa-solid fa-cart-plus"></i>
                                <span class="header__cart-notice">${cartItems.size()}</span>
                                <!-- Cart list omitted for brevity -->
                            </div>
                        </div>
                    </div>
                </div>
            </header>

            <!-- Checkout Content -->
            <div class="app__container">
                <div class="grid wide">
                    <div class="row app__content">
                        <div class="col l-8 m-12 c-12">
                            <h2 class="checkout__heading">Thanh Toán</h2>
                            <form action="processCheckout" method="post" class="checkout__form">
                                <!-- Shipping Information -->
                                <div class="checkout__section">
                                    <h3 class="checkout__section-title">Thông Tin Giao Hàng</h3>
                                    <div class="checkout__field">
                                        <label>Họ và Tên:</label>
                                        <input type="text" name="fullName" value="${user.fullName}" required>
                                    </div>
                                    <div class="checkout__field">
                                        <label>Số Điện Thoại:</label>
                                        <input type="text" name="phoneNumber" value="${user.phoneNumber}" required>
                                    </div>
                                    <div class="checkout__field">
                                        <label>Địa Chỉ:</label>
                                        <textarea name="address" required>${user.address}</textarea>
                                    </div>
                                    <div class="checkout__field">
                                        <label>Đơn Vị Vận Chuyển:</label>
                                        <select name="shippingCompanyID" required>
                                            <c:forEach var="shippingCompany" items="${shippingCompanies}">
                                                <option value="${shippingCompany.shippingCompanyID}">${shippingCompany.companyName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <!-- Payment Method -->
                                <div class="checkout__section">
                                    <h3 class="checkout__section-title">Phương Thức Thanh Toán</h3>
                                    <c:forEach var="method" items="${paymentMethods}">
                                        <div class="checkout__payment-option">
                                            <input type="radio" name="paymentMethodID" value="${method.paymentMethodID}" required>
                                            <label>${method.methodName}</label>
                                        </div>
                                    </c:forEach>
                                </div>

                                <!-- Voucher -->
                                <div class="checkout__section">
                                    <h3 class="checkout__section-title">Mã Giảm Giá</h3>
                                    <div class="checkout__field">
                                        <select name="voucherID">
                                            <option value="">Không sử dụng voucher</option>
                                            <c:forEach var="voucher" items="${vouchers}">
                                                <option value="${voucher.voucherID}">Giảm ${voucher.discountValue}% - ${voucher.voucherDay}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <!-- Order Summary -->
                        <div class="col l-4 m-12 c-12">
                            <div class="checkout__summary">
                                <h3 class="checkout__section-title">Tóm Tắt Đơn Hàng</h3>
                                <div class="checkout__items">
                                    <c:forEach var="item" items="${cartItems}">
                                        <div class="checkout__item">
                                            <img src="${item.product.imageURL}" alt="${item.product.productName}" class="checkout__item-img">
                                            <div class="checkout__item-details">
                                                <span class="checkout__item-name">${item.product.productName}</span>
                                                <span class="checkout__item-price">${item.product.price}đ x ${item.quantity}</span>
                                                <span class="checkout__item-total">${item.product.price * item.quantity}đ</span>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="checkout__total">
                                    <div class="checkout__total-row">
                                        <span>Tạm tính:</span>
                                        <span>${subTotal}đ</span>
                                    </div>
                                    <div class="checkout__total-row">
                                        <span>Giảm giá:</span>
                                        <span>-${discount}đ</span>
                                    </div>
                                    <div class="checkout__total-row checkout__total-final">
                                        <span>Tổng cộng:</span>
                                        <span>${totalAmount}đ</span>
                                    </div>
                                </div>
                                <button type="submit" form="checkout__form" class="btn btn--primary checkout__submit-btn">Đặt Hàng</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer (Reused from User/Cart Page) -->
            <footer class="footer">
                <div class="grid wide">
                    <div class="row">
                        <div class="col l-3 m-3 c-6">
                            <h3 class="footer__heading">Chăm sóc khách hàng</h3>
                            <ul class="footer__list">
                                <li class="footer__list-item"><a href="" class="footer__list-item__link">Đinh Huy Hoàng</a></li>
                                <li class="footer__list-item"><a href="" class="footer__list-item__link">Lê Xuân Hoàng</a></li>
                                <li class="footer__list-item"><a href="" class="footer__list-item__link">Nguyễn Đức Huy Hoàng</a></li>
                                <li class="footer__list-item"><a href="" class="footer__list-item__link">Lê Thành Đạt</a></li>
                                <li class="footer__list-item"><a href="" class="footer__list-item__link">Nguyễn Đình Duy</a></li>
                                <li class="footer__list-item"><a href="" class="footer__list-item__link">Nguyễn Minh Hiếu</a></li>
                            </ul>
                        </div>
                        <div class="col l-3 m-3 c-6">
                            <h3 class="footer__heading">Theo dõi chúng tôi trên</h3>
                            <ul class="footer__list">
                                <li class="footer__list-item"><a href="" class="footer__list-item__link"><i class="footer__list-item-icon fab fa-facebook"></i>Facebook</a></li>
                                <li class="footer__list-item"><a href="" class="footer__list-item__link"><i class="footer__list-item-icon fab fa-instagram"></i>Instagram</a></li>
                                <li class="footer__list-item"><a href="" class="footer__list-item__link"><i class="footer__list-item-icon fab fa-tiktok"></i>Tiktok</a></li>
                            </ul>
                        </div>
                        <div class="col l-3 m-3 c-6">
                            <h3 class="footer__heading">Vào cửa hàng</h3>
                            <div class="footer__download">
                                <img src="images/5b6e787c2e5ee052.png" alt="" class="footer__download-qr">
                                <div class="footer__download-apps">
                                    <a href="" class="footer__download-apps-link"><img src="images/1fddd5ee3e2ead84.png" alt="Google Play" class="footer__download-apps-img"></a>
                                    <a href="" class="footer__download-apps-link"><img src="images/135555214a82d8e1.png" alt="AppStore" class="footer__download-apps-img"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer__bottom">
                    <div class="grid wide">
                        <p class="footer__text">2025 - Bản quyền thuộc về Công ti Những Vì Tinh Tú LigmaShop</p>
                    </div>
                </div>
            </footer>
        </div>
    </body>
</html>