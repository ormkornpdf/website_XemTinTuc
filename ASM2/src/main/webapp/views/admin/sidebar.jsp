<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.left-sidebar {
    position: fixed;
    top: 0;
    left: 0;
    height: 100vh;
    z-index: 1000;
}

.body-wrapper {
    margin-left: 260px !important;
    width: calc(100% - 260px) !important;
}

.container-main {
    margin-left: 0;
    padding: 20px;
}
</style>

<aside class="left-sidebar">
    <!-- Sidebar scroll-->
    <div>
        <div class="brand-logo d-flex align-items-center justify-content-between">
            <a href="${pageContext.request.contextPath}/admin" class="text-nowrap logo-img">
                <img src="${pageContext.request.contextPath}/admin/assets/images/logos/ketw-remove.png" alt="" width="150"/>
            </a>
            <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                <i class="ti ti-x fs-6"></i>
            </div>
        </div>
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
            <ul id="sidebarnav">
                <li class="nav-small-cap">
                    <iconify-icon icon="solar:menu-dots-linear" class="nav-small-cap-icon fs-4"></iconify-icon>
                    <span class="hide-menu">Trang chủ</span>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/news" aria-expanded="false">
                        <i class="ti ti-atom"></i>
                        <span class="hide-menu">Quản lý tin tức</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link justify-content-between"  
                        href="${pageContext.request.contextPath}/admin/categories" aria-expanded="false">
                        <div class="d-flex align-items-center gap-3">
                            <span class="d-flex">
                                <i class="ti ti-aperture"></i>
                            </span>
                            <span class="hide-menu">Quản lý loại tin</span>
                        </div>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link justify-content-between"  
                        href="${pageContext.request.contextPath}/admin/users" aria-expanded="false">
                        <div class="d-flex align-items-center gap-3">
                            <span class="d-flex">
                                <i class="ti ti-shopping-cart"></i>
                            </span>
                            <span class="hide-menu">Quản lý tài khoản</span>
                        </div>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link justify-content-between"  
                        href="${pageContext.request.contextPath}/admin/newsletters" aria-expanded="false">
                        <div class="d-flex align-items-center gap-3">
                            <span class="d-flex">
                                <i class="ti ti-basket"></i>
                            </span>
                            <span class="hide-menu">Quản lý Newsletter</span>
                        </div>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>