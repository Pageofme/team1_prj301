<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="productDAO" class="productDAO.ProductDAO" scope="page"/> <!-- Kept as is, assumes ProductDAO is correctly implemented -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LigmaShop</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/base.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/grid.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/main.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    </head>
    <body>
        <c:set var="pageSize" value="10"/> <!-- Kept as is, defines the number of products per page -->
        <c:set var="currentPage" value="${param.page != null ? param.page : 1}"/> <!-- Kept as is, sets current page from param or defaults to 1 -->
        <c:set var="start" value="${(currentPage - 1) * pageSize}"/> <!-- Kept as is, calculates the start index for pagination -->
        <c:set var="end" value="${start + pageSize}"/> <!-- Kept as is, calculates the end index for pagination -->
        <!-- Changed from ${fn:length(list)} to ${fn:length(products)} to match the attribute name set by GuestServlet -->
        <c:set var="totalProducts" value="${fn:length(products)}"/>
        <!-- Changed to handle case where totalProducts is 0, avoiding division by zero; defaults to 1 page if no products -->
        <c:set var="totalPages" value="${totalProducts > 0 ? Math.ceil(totalProducts / pageSize) : 1}"/>
        <div class="app">
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
                            <li class="header__navbar-item header__navbar-item--strong header__navbar-item--separate">
                                <a href="ligmaShop/login/register.jsp">Đăng kí</a>
                            </li>
                            <li class="header__navbar-item header__navbar-item--strong">
                                <a href="ligmaShop/login/signIn.jsp">Đăng nhập</a>
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
                        <div class="header__cart">
                            <div class="header__cart-wrap">
                                <i class="header__cart-icon fa-solid fa-cart-plus"></i>
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
                                    Danh mục
                                </h3>
                                <!--category option list -->
                                <ul class="category-list">
                                    <c:forEach items="${category}" var="o">
                                        <li class="category-item">
                                            <a href="category?cID=${o.categoryID}" class="category-item__link">${o.categoryName}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </nav>
                        </div>
                        <div class="col l-10 m-12 c-12">
                            <div class="home-filter hide-on-mobile-tablet">
                                <span class="home-filter__label">Sắp xếp theo</span>
                                <button class="home-filter__btn btn">Phổ biến</button>
                                <button class="home-filter__btn btn">Mới nhất</button>
                                <button class="home-filter__btn btn">Bán chạy</button>
                                <div class="select-input">
                                    <span class="select-input__label">Giá</span>
                                    <i class="select-input__icon fas fa-angle-down"></i>
                                    <ul class="select-input__list">
                                        <li class="select-input__item">
                                            <a href="" class="select-input__link">Giá thấp đến cao</a>
                                        </li>
                                        <li class="select-input__item">
                                            <a href="" class="select-input__link">Giá cao đến thấp</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="home-filter__page">
                                    <span class="home-filter__page-num">
                                        <span class="home-filter__page-current">${currentPage}</span>
                                        /${totalPages}
                                    </span>
                                    <div class="home-filter__page-control">
                                        <a href="" class="home-filter__page-btn home-filter__page-btn-disable">
                                            <i class="home-filter__page-icon fas fa-angle-left"></i>
                                        </a>
                                        <a href="" class="home-filter__page-btn">
                                            <i class="home-filter__page-icon fas fa-angle-right"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="home-product">
                                <div class="row sm-gutter">
                                    <!-- Added check for empty products to display a message if no data -->
                                    <c:if test="${empty products}">
                                        <p style="text-align: center; color: red;">No products available.</p>
                                    </c:if>
                                    <c:forEach var="product" items="${products}" varStatus="status">
                                        <!-- Changed test to use end instead of start + pageSize for consistency -->
                                        <c:if test="${status.index >= start && status.index < end}">
                                            <div class="col l-2-4 m-4 c-6">
                                                <a class="home-product-item" href="#">
                                                    <!-- Changed to productimagesCollection to match the Products class property -->
                                                    <c:forEach var="image" items="${product.productimagesCollection}">
                                                        <div class="home-product-item__img" style="background-image: url('${image.imageURL}');"></div>  
                                                    </c:forEach>
                                                    <!-- Added fallback image if productimagesCollection is empty -->
                                                    <c:if test="${empty product.productimagesCollection}">
                                                        <div class="home-product-item__img" style="background-image: url('images/user.jpg');"></div>
                                                    </c:if>
                                                    <h4 class="home-product-item__name">${product.productName}</h4>
                                                    <div class="home-product-item__price">
                                                        <span class="home-product-item__price-old">${product.price + 200000}</span>
                                                        <span class="home-product-item__price-current">${product.price}</span>
                                                    </div>
                                                    <div class="home-product-item__action">
                                                        <span class="home-product-item__like home-product-item__like--liked">
                                                            <i class="home-product-item__like-icon-empty fa-regular fa-heart"></i>
                                                            <i class="home-product-item__like-icon-fill fa-solid fa-heart"></i>
                                                        </span>
                                                        <div class="home-product-item__rating">
                                                            <i class="home-product-item__star-gold fas fa-star"></i>
                                                            <i class="home-product-item__star-gold fas fa-star"></i>
                                                            <i class="home-product-item__star-gold fas fa-star"></i>
                                                            <i class="home-product-item__star-gold fas fa-star"></i>
                                                            <i class="fa-regular fa-star"></i>
                                                        </div>
                                                        <span class="home-product-item__sold">102 Đã bán</span>
                                                    </div>
                                                    <div class="home-product-item__origin">
                                                        <span class="home-product-item__brand">${product.companyID.companyName}</span>
                                                        <span class="home-product-item__origin-name">America</span>
                                                    </div>
                                                    <div class="home-product-item__favourite">
                                                        <i class="fa-solid fa-check"></i> Yêu thích
                                                    </div>
                                                    <div class="home-product-item__sale-off">
                                                        <span class="home-product-item__sale-off-percent">10%</span>
                                                        <span class="home-product-item__sale-off-label">GIẢM</span>
                                                    </div>
                                                </a>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                    <ul class="pagination home-product__pagination">
                                        <li class="pagination-item pagination-item--active">
                                            <c:if test="${currentPage > 1}">
                                                <!-- Changed to /guest?page=... to match the servlet mapping -->
                                                <a href="guest?page=${currentPage - 1}" class="pagination-item__link">
                                                    <i class="pagination-item__icon fas fa-angle-left"></i>
                                                </a>
                                            </c:if>
                                        </li>
                                        <li class="pagination-item">
                                            <c:forEach var="i" begin="1" end="${totalPages}">
                                                <a href="guest?page=${i}" class="pagination-item__link">${i}</a>
                                            </c:forEach>
                                        </li>
                                        <li class="pagination-item">
                                            <c:if test="${currentPage < totalPages}">
                                                <a href="guest?page=${currentPage + 1}" class="pagination-item__link">
                                                    <i class="pagination-item__icon fas fa-angle-right"></i>
                                                </a>
                                            </c:if>
                                        </li>
                                    </ul>
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
                                    <img src="${pageContext.request.contextPath}/resource/images/5b6e787c2e5ee052.png" alt="" class="footer__download-qr">                            
                                    <div class="footer__download-apps">
                                        <a href="" class="footer__download-apps-link">
                                            <img src="${pageContext.request.contextPath}/resource/images/1fddd5ee3e2ead84.png" alt="Google Play" class="footer__download-apps-img">
                                        </a>
                                        <a href="" class="footer__download-apps-link">
                                            <img src="${pageContext.request.contextPath}/resource/images/135555214a82d8e1.png" alt="AppStore" class="footer__download-apps-img">
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