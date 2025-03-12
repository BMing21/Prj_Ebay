<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    /* Styling for the parent UL */
    .dropdown {
        list-style: none;
        margin: 0;
        padding: 0;
        cursor: pointer;
    }

    .dropdown > li {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 10px;
        color: #333;
        font-weight: bold;
    }

    .dropdown > li > a {
        text-decoration: none;
        color: inherit;
        display: flex;
        align-items: center;
    }

    /* Hide sub-menu by default */
    .dropdown-content {
        display: none;
        list-style: none;
        padding-left: 20px;
    }

    /* Style for each sub-menu item */
    .dropdown-content li {
        margin: 5px 0;
    }

    .dropdown-content li a {
        color: #333;
        text-decoration: none;
        display: flex;
        align-items: center;
    }

    .dropdown-content li a .sb-nav-link-icon {
        margin-right: 8px;
    }

    /* Display sub-menu when active */
    .dropdown.active .dropdown-content {
        display: block;
    }

    /* Rotate the icon when dropdown is active */
    .dropdown .arrow {
        transition: transform 0.3s;
    }

    .dropdown.active .arrow {
        transform: rotate(90deg);
    }
</style>

<div class="col-md-2" style="border-right: 1px solid #DCDCDC;">

    <div class="title_module_arrow">
        <h2 class="margin-top-0"><span>Danh mục quản lý</span></h2>
    </div>

    <div class="aside-content aside-cate-link-cls">
        <nav class="cate_padding nav-category navbar-toggleable-md">

            <ul class="nav-ul nav navbar-pills flex-column">

                <c:if test="${sessionScope.user.getRole() eq 'admin'}">
                    <a class="nav-link ${p == 0 ? "active":""}" href="manage?p=0">        
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Thống kê
                    </a>
                    <a class="nav-link ${p == 3 ? "active":""}" href="manage-user?p=3">        
                        <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                        Quản lý người dùng
                    </a>
                </c:if>

                <c:if test="${sessionScope.user.getRole() eq 'staff'}">
                    <a class="nav-link ${p == 1 ? "active":""}" href="manage-product">        
                        <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                        Quản lý sản phẩm
                    </a>

                    <a class="nav-link ${p == 2 ? "active":""}" href="manage-order">        
                        <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                        Quản lý đơn hàng
                    </a>
                </c:if>
            </ul>
        </nav>
    </div>
</div>

<script>
    function toggleDropdown(element) {
        element.classList.toggle('active');
    }
</script>