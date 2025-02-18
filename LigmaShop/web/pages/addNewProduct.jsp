<%-- 
    Document   : addNewProduct
    Created on : Feb 14, 2025, 8:53:25 PM
    Author     : ADMIN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Product" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Jigma Shop </title>
    <!-- plugins:css -->
    <link rel="stylesheet/less" type="text/css" href="styles.less" />
    <link rel="stylesheet" href="../vendors/feather/feather.css">
    <link rel="stylesheet" href="../vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="../vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../vendors/typicons/typicons.css">
    <link rel="stylesheet" href="../vendors/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="../vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="../vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="..css/base.css">
    <link rel="stylesheet" href="../css/main.css"/>
    <link rel="stylesheet" href="../css/grid.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="../vendors/select2/select2.min.css">
    <link rel="stylesheet" href="../vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="../css/style1.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="../images/logoLigma.png" />
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:../../partials/_navbar.html -->
      <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row" ">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
          <div class="me-3">
            <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-bs-toggle="minimize">
              <span class="icon-menu"></span>
            </button>
          </div>
          <div>
            <a class="navbar-brand brand-logo" href="../ligmaShop/adminPage.jsp">
              <img img src="../images/LIGMA SHOP WHITE ON BLACK.png" alt="logo" />
            </a>
            <a class="navbar-brand brand-logo-mini" href="../ligmaShop/adminPage.jsp">
              <img src="../images/LIGMA SHOP WHITE ON BLACK.png" alt="logo" />
            </a>
          </div>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-top">
          <ul class="navbar-nav">
            <li class="nav-item fw-semibold d-none d-lg-block ms-0">
              <h1 class="welcome-text">Good Morning, <span class="text-black fw-bold">...</span></h1>
              <h3 class="welcome-sub-text">Your performance summary this week </h3>
            </li>
          </ul>
          <ul class="navbar-nav ms-auto">
            
            <li class="nav-item d-none d-lg-block">
              <div id="datepicker-popup" class="input-group date datepicker navbar-date-picker">
                <span class="input-group-addon input-group-prepend border-right">
                  <span class="icon-calendar input-group-text calendar-icon"></span>
                </span>
                <input type="text" class="form-control">
              </div>
            </li>
            <li class="nav-item">
              <form class="search-form" action="#">
                <i class="icon-search"></i>
                <input type="search" class="form-control" placeholder="Search Here" title="Search here">
              </form>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link count-indicator" id="notificationDropdown" href="#" data-bs-toggle="dropdown">
                <i class="icon-bell"></i>
                <span class="count"></span>
              </a>
              <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0" aria-labelledby="notificationDropdown">
                <a class="dropdown-item py-3 border-bottom">
                  <p class="mb-0 fw-medium float-start">You have 4 new notifications </p>
                  <span class="badge badge-pill badge-primary float-end">View all</span>
                </a>
                <a class="dropdown-item preview-item py-3">
                  <div class="preview-thumbnail">
                    <i class="mdi mdi-alert m-auto text-primary"></i>
                  </div>
                  <div class="preview-item-content">
                    <h6 class="preview-subject fw-normal text-dark mb-1">Application Error</h6>
                    <p class="fw-light small-text mb-0"> Just now </p>
                  </div>
                </a>
                <a class="dropdown-item preview-item py-3">
                  <div class="preview-thumbnail">
                    <i class="mdi mdi-lock-outline m-auto text-primary"></i>
                  </div>
                  <div class="preview-item-content">
                    <h6 class="preview-subject fw-normal text-dark mb-1">Settings</h6>
                    <p class="fw-light small-text mb-0"> Private message </p>
                  </div>
                </a>
                <a class="dropdown-item preview-item py-3">
                  <div class="preview-thumbnail">
                    <i class="mdi mdi-airballoon m-auto text-primary"></i>
                  </div>
                  <div class="preview-item-content">
                    <h6 class="preview-subject fw-normal text-dark mb-1">New user registration</h6>
                    <p class="fw-light small-text mb-0"> 2 days ago </p>
                  </div>
                </a>
              </div>
            </li>

            <li class="nav-item dropdown d-none d-lg-block user-dropdown">
              <a class="nav-link" id="UserDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                <img class="img-xs rounded-circle" src="../images/user.jpg" alt="Profile image"> </a>
              <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
                <div class="dropdown-header text-center">
                  <img class="img-md rounded-circle" src="../images/user.jpg" alt="Profile image">
                  <p class="mb-1 mt-3 fw-semibold">ok</p>
                  <p class="fw-light text-muted mb-0">...@gmail.com</p>
                </div>
                <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-account-outline text-primary me-2"></i> My Profile <span class="badge badge-pill badge-danger">1</span></a>
                <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-message-text-outline text-primary me-2"></i> Messages</a>
                <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-calendar-check-outline text-primary me-2"></i> Activity</a>
                <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-help-circle-outline text-primary me-2"></i> FAQ</a>
                <a class="dropdown-item" href="../ligmaShop/guest.jsp"><i class="dropdown-item-icon mdi mdi-power text-primary me-2"></i>Sign Out</a>
              </div>
            </li>
          </ul>
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-bs-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
          </button>
        </div>
      </nav>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            <li class="nav-item">
              <a class="nav-link" href="../ligmaShop/adminPage.jsp">
                <i class="mdi mdi-grid-large menu-icon"></i>
                <span class="menu-title">Trang Chủ</span>
              </a>
            </li>
            <li class="nav-item nav-category">Công Cụ</li>
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
                <i class="menu-icon mdi mdi-card-text-outline"></i>
                <span class="menu-title">Quản Lý Sản Phẩm</span>
                <i class="menu-arrow"></i>
              </a>
<!--<div class="collapse" id="form-elements">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"><a class="nav-link" href="../pages/addNewProduct.jsp">Thêm Sản Phẩm</a></li>
                </ul>
              </div>-->
              <div class="collapse" id="form-elements">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"><a class="nav-link" href="../pages/deleteProduct.jsp">Xóa Sản Phẩm</a></li>
                </ul>
              </div>
              <div class="collapse" id="form-elements">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"><a class="nav-link" href="../pages/..">Edit Product</a></li>
                </ul>
              </div>       
            </li>
            
               
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                <i class="menu-icon mdi mdi-account-circle-outline"></i>
                <span class="menu-title">Trang Sản Phẩm</span>
                <i class="menu-arrow"></i>
              </a>
              <div class="collapse" id="auth">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="../ligmaShop/user.jsp"> Xem Trang Sản Phẩm </a></li>

                </ul>
              </div>
            </li>  
          </ul>
        </nav>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="row"> 
             
              <div class="col-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Thêm Sản Phẩm</h4>
                    <form class="forms-sample"> <!--/*thêm servlet ở đây*/-->
                      <div class="form-group">
                        <label for="exampleInputName1">Tên Sản Phẩm</label>
                        <input type="text" class="form-control" id="exampleInputName1" placeholder="Tên Sản Phẩm">
                      </div>
                      <div class="form-group">
                        <label for="exampleInputEmail3">Mô tả</label>
                        <input type="email" class="form-control" id="exampleInputEmail3" placeholder="Mô tả">
                      </div>
                      <div class="form-group">
                        <label for="exampleInputPassword4">Giá tiền</label>
                        <input type="password" class="form-control" id="exampleInputPassword4" placeholder="Giá tiền">
                      </div>
                      <div class="form-group">
                        <label for="exampleSelectGender">Giới tính</label>
                        <select class="form-select" id="exampleSelectGender">
                          <option>Nam</option>
                          <option>Nữ</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputEmail3">Loại Sản Phẩm</label>
                        <input type="email" class="form-control" id="exampleInputEmail3" placeholder="Loại Sản Phẩm">
                      </div>
                      <div class="form-group">
                        <label>Tải Ảnh Lên</label>
                        <input type="file" name="img[]" class="file-upload-default">
                        <div class="input-group col-xs-12">
                          <input type="text" class="form-control file-upload-info" disabled placeholder="Thêm Ảnh">
                          <span class="input-group-append">
                            <button class="file-upload-browse btn btn-primary" type="button">Tải Lên</button>
                          </span>
                        </div>
                      </div>
                      <button type="submit" class="btn btn-primary me-2">Lưu Sản Phẩm</button>
                      <button class="btn btn-light">Hủy Bỏ</button>
                    </form>
                  </div>
                </div>
              </div>            
          <!-- content-wrapper ends -->
          <!-- footer -->
          <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Premium <a href="#" target="_blank">Link</a> OK</span>
                <span class="float-none float-sm-end d-block mt-1 mt-sm-0 text-center">Copyright © 2023. All rights reserved.</span>
            </div>
          </footer>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>

    <!-- plugins:js -->
    <script src="../vendors/js/vendor.bundle.base.js"></script>
    <script src="../vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>

    <!-- Plugin js for this page -->
    <script src="../vendors/typeahead.js/typeahead.bundle.min.js"></script>
    <script src="../vendors/select2/select2.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="../js/off-canvas.js"></script>
    <script src="../js/template.js"></script>
    <script src="../js/settings.js"></script>
    <script src="../js/hoverable-collapse.js"></script>
    <script src="../js/todolist.js"></script>
    <!-- Custom js for this page-->
    <script src="../js/file-upload.js"></script>
    <script src="../js/typeahead.js"></script>
    <script src="../js/select2.js"></script>
    <!-- End custom js for this page-->
  </body>
</html>
