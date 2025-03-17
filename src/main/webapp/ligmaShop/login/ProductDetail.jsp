<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="productDAO" class="productDAO.ProductDAO" scope="page"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!--Xử lí ảnh và thông sản phẩm chính ở dòng 182 đến 248-->
<!--nếu muốn thay đổi giá cả theo size thì file js tên productDetails.js
hiện tại đang để giá tăng giảm 5% cho mỗi size-->
<!--hiện đang thiếu ảnh màu sắc khác của từng sản phẩm nên là gắn đại ảnh với giá cả các thứ đọ-->

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>LigMa Shop</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/styleProductDetails.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/base.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/grid.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/main.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resource/images/logoLigma.png" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <style>
            .home-product-item__img{
                height: 20px;
                aspect-ratio: 1 / 1;
                background-size: cover;
                background-position: center;
                border-radius: 5px;
            }
        </style>
        <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
    <df-messenger
        intent="WELCOME"
        chat-title="LigmaShop"
        agent-id="42e42aa4-d213-4073-8915-61238c1db98f"
        language-code="vi">
    </df-messenger>
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
                                <div class="header__qr-apps">
                                    <a href="" class="header__qr-link">
                                        <img src="https://pageofme.github.io/team1_prj301/images/googleplay.png" alt="Google Play" class="header__qr-download-img">
                                    </a>
                                    <a href="" class="header__qr-link">
                                        <img src="https://pageofme.github.io/team1_prj301/images/appstore.png" alt="AppStore" class="header__qr-download-img">
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

                        <!--Người dùng chưa đăng kí và đăng nhập tài khoản-->

                        <li class="header__navbar-item header__navbar-item--strong header__navbar-item--separate">
                            <a href="${pageContext.request.contextPath}/ligmaShop/register.jsp" >Đăng kí</a>
                        </li>

                        <li class="header__navbar-item header__navbar-item--strong">
                            <a href="${pageContext.request.contextPath}/ligmaShop/signIn.jsp" >Đăng nhập</a>
                        </li> 

                        <!--Người dùng đã đăng nhập-->
                        <!--                        <li class="header__navbar-item header__navbar-user">
                                                    <img src="images/user.jpg" alt="" class="header__navbar-user-img">
                                                    <span class="header__navbar-user-name">LigmaShop</span>-->
                        <ul class="header__navbar-user-menu">
                            <li class="header__navbar-user-item">
                                <a href="">Hồ sơ của tôi</a>
                            </li>
                            <li class="header__navbar-user-item">
                                <a href="">Đăng Xuất</a>
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
                        <a href="${pageContext.request.contextPath}/ligmaShop/guest.jsp">
                            <img src="${pageContext.request.contextPath}/images/LIGMA SHOP WHITE ON BLACK.png" alt="" class="header__logo-img">
                        </a>
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
                                <img src="${pageContext.request.contextPath}/images/no-cart.jpg" alt="" class="header__cart-no-cart-img">

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

        <!--Body-->
        <%
            request.setAttribute("products", productDAO.selectAllProducts());
        %>
        <!-- Thông tin sản phẩm -->
        <c:set var="product" value="${singleProduct}" />
        <div class="container1">
            <div class="product-container">
                <!-- Ảnh sản phẩm -->
                <div class="image-container-box">
                    <div class="product-image-container">
                        <div class="product-image">
                            <img id="mainImage" src="${product.productimagesCollection[0].imageURL}" alt="Backrest Biotec Dental Equipment">
                        </div>
                        <div class="image-overlay">
                            <span class="close-btn">&times;</span>
                            <img class="full-image" src="" alt="Ảnh đầy đủ">
                        </div>
                        <!-- Ảnh nhỏ bên dưới -->
                        <div class="image-box">
                            <div class="additional-images">
                                <c:forEach var="image" items="${product.productimagesCollection}" varStatus="status">
                                    <image class="thumbnail" src="${image.imageURL}" >                                                                              
                                </c:forEach>

                            </div>               
                        </div>
                    </div>

                </div>

                <div class="product-info">
                    <div class="labels">
                        <span class="label-sale">SALE</span>
                        <span class="label-hot">HOT</span>
                        <span class="label-in-stock">IN STOCK</span>
                    </div>
                    <h1 var="product">${product.productName}</h1>
                    <p class="rating">★★★★★ (1k Review)</p>
                    <div class="features">
                        <ul>
                            <li>${product.description}</li>

                        </ul>
                    </div>
                    <div class="price">
                        <span>${product.price}</span>
                        <span class="original-price">${product.price+100000}</span>
                    </div>

                    <div class="size-selector">
                        <button class="size-option selected" data-size="M" data-price="${product.price}">M</button>
                        <button class="size-option" data-size="L" data-price="${product.price +50000}">L</button>
                        <button class="size-option" data-size="XL" data-price="${product.price +80000}">XL</button>

                    </div>
                    <div class="quantity-box">
                        <button class="decrease">-</button>
                        <input type="text" value="1" readonly>
                        <button class="increase">+</button>
                    </div>
                    <div class="button-container">
                        <button class="btn-add">
                            <i class="fas fa-shopping-cart"></i> Thêm Vào Giỏ
                        </button>
                        <button class="btn-add1">Mua Ngay</button>
                    </div>

                </div>
            </div>

            <hr class="separator">



            <div class="container2">
                <h2>Có thể bạn sẽ thích</h2>
                <div class="suggested-products-wrapper">
                    <button class="scroll-btn left" onclick="scrollLeft()">&#10094;</button>
                    <div class="suggested-products">
                        <c:forEach var="product" items="${products}">
                            <div class="product-card">
                                <!--Sản phẩm gợi ý-->
                                <a href="productDetail?pID=${product.productID}">
                                    <img src="${product.productimagesCollection[0].imageURL}" alt="${product.productName}">                                                 
                                    <p class="product-name">${product.productName}</p>
                                    <p class="rating">★★★★☆ (1M Review)</p>
                                    <p class="product-categories">${product.description}</p>
                                    <p class="product-price">${product.price}</p>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                    <button class="scroll-btn right" onclick="scrollRight()">&#10095;</button>
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
    <script src="${pageContext.request.contextPath}/resource/js/productDetails.js"></script>
</body>
</html>