<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <!-- Hero Section -->
    <section id="hero" class="hero section light-background">

      <div class="container">
        <div class="row gy-4 justify-content-center justify-content-lg-between">
          <div class="col-lg-5 order-2 order-lg-1 d-flex flex-column justify-content-center">
            <h1 data-aos="fade-up">Thưởng thức món ăn ngon lành mạnh của bạn</h1>
		</div>
          <div class="col-lg-5 order-1 order-lg-2 hero-img" data-aos="zoom-out">
            <img src="${pageContext.request.contextPath}/client/assets/img/menu/food1.jpg" class="img-fluid animated" alt="">
          </div>
        </div>
      </div>

    </section><!-- /Hero Section -->


    <!-- Menu Section -->
    <section id="menu" class="menu section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Thực đơn của chúng tôi</h2>
        <p><span>Kiểm tra của chúng tôi</span> <span class="description-title">owly1ketw</span></p>
      </div><!-- End Section Title -->

      <div class="container">

        <ul class="nav nav-tabs d-flex justify-content-center" data-aos="fade-up" data-aos-delay="100">

          <li class="nav-item">
            <a class="nav-link active show" data-bs-toggle="tab" data-bs-target="#menu-starters">
              <h4>Đồ uống</h4>
            </a>
          </li><!-- End tab nav item -->

          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-breakfast">
              <h4>Bữa sáng</h4>
            </a><!-- End tab nav item -->

          </li>
          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-lunch">
              <h4>Bữa trưa</h4>
            </a>
          </li><!-- End tab nav item -->

          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-dinner">
              <h4>Bữa tối</h4>
            </a>
          </li><!-- End tab nav item -->

        </ul>

        <div class="tab-content" data-aos="fade-up" data-aos-delay="200">

          <div class="tab-pane fade active show" id="menu-starters">

            <div class="tab-header text-center">
              <p>Thực đơn</p>
              <h3>Đồ uống</h3>
            </div>

            <div class="row gy-5">

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/client/assets/img/menu/drink1.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/client/assets/img/menu/drink1.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Trà vải cam rosemary</h4>
                
                <p class="price">
                 35.000VNĐ
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/client/assets/img/menu/drink2.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/client/assets/img/menu/drink2.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Trà tắc mật ong</h4>
               
                <p class="price">
                35.000VNĐ
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/client/assets/img/menu/drink3.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/client/assets/img/menu/drink3.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Mattcha Latte</h4>
                
                <p class="price">
                 35.000VNĐ
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/client/assets/img/menu/drink4.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/client/assets/img/menu/drink4.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Cà phê sữa đá</h4>
             
                <p class="price">
                 25.000VNĐ
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/client/assets/img/menu/drink5.jpg/client/assets/img/menu/menu-item-5.png" class="glightbox"><img src="${pageContext.request.contextPath}/client/assets/img/menu/drink5.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>trà olong kem cheese</h4>
             
                <p class="price">
                   35.000VNĐ
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/client/assets/img/menu/drink6.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/client/assets/img/menu/drink6.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Khoai môn sữa trân châu</h4>
           
                <p class="price">
                 35.000VNĐ
                </p>
              </div><!-- Menu Item -->

            </div>
          </div><!-- End Starter Menu Content -->

          <div class="tab-pane fade" id="menu-breakfast">

            <div class="tab-header text-center">
              <p>Menu</p>
              <h3>Bữa sáng</h3>
            </div>

            <div class="row gy-5">

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/client/assets/img/menu/food1.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/client/assets/img/menu/food1.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Bún bò huế</h4>
               
                <p class="price">
                  40.000VNĐ
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/client/assets/img/menu/food2.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/client/assets/img/menu/food2.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Xôi mặn</h4>
               
                <p class="price">
                 20.000VNĐ
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/client/assets/img/menu/food3.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/client/assets/img/menu/food3.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Thịt kho hột vịt</h4>
              
                <p class="price">
                 	45.000VNĐ
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/client/assets/img/menu/food4.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/client/assets/img/menu/food4.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Thịt luộc</h4>
                
                <p class="price">
                  30.000VNĐ
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/client/assets/img/menu/food5.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/client/assets/img/menu/food5.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Nem rán</h4>
                
                <p class="price">
                 40.000VNĐ
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/client/assets/img/menu/food6.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/client/assets/img/menu/food6.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Phở gà</h4>
               
                <p class="price">
                35.000VNĐ
                </p>
              </div><!-- Menu Item -->

            </div>
          </div><!-- End Breakfast Menu Content -->

          <div class="tab-pane fade" id="menu-lunch">

            <div class="tab-header text-center">
              <p>Menu</p>
              <h3>Bữa trưa</h3>
            </div>

             <div class="row gy-5">

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/client/assets/img/menu/food1.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/client/assets/img/menu/food1.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Bún bò huế</h4>
               
                <p class="price">
                  40.000VNĐ
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/client/assets/img/menu/food2.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/client/assets/img/menu/food2.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Xôi mặn</h4>
               
                <p class="price">
                 20.000VNĐ
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/client/assets/img/menu/food3.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/client/assets/img/menu/food3.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Thịt kho hột vịt</h4>
              
                <p class="price">
                 	45.000VNĐ
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/client/assets/img/menu/food4.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/client/assets/img/menu/food4.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Thịt luộc</h4>
                
                <p class="price">
                  30.000VNĐ
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/client/assets/img/menu/food5.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/client/assets/img/menu/food5.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Nem rán</h4>
                
                <p class="price">
                 40.000VNĐ
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/client/assets/img/menu/food6.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/client/assets/img/menu/food6.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Phở gà</h4>
               
                <p class="price">
                35.000VNĐ
                </p>
              </div><!-- Menu Item -->

            </div>
          </div><!-- End Lunch Menu Content -->

          <div class="tab-pane fade" id="menu-dinner">

            <div class="tab-header text-center">
              <p>Thực đơn</p>
              <h3>Bữa tối</h3>
            </div>

             <div class="row gy-5">

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/client/assets/img/menu/food1.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/client/assets/img/menu/food1.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Bún bò huế</h4>
               
                <p class="price">
                  40.000VNĐ
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/client/assets/img/menu/food2.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/client/assets/img/menu/food2.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Xôi mặn</h4>
               
                <p class="price">
                 20.000VNĐ
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/client/assets/img/menu/food3.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/client/assets/img/menu/food3.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Thịt kho hột vịt</h4>
              
                <p class="price">
                 	45.000VNĐ
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/client/assets/img/menu/food4.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/client/assets/img/menu/food4.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Thịt luộc</h4>
                
                <p class="price">
                  30.000VNĐ
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/client/assets/img/menu/food5.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/client/assets/img/menu/food5.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Nem rán</h4>
                
                <p class="price">
                 40.000VNĐ
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="${pageContext.request.contextPath}/client/assets/img/menu/food6.jpg" class="glightbox"><img src="${pageContext.request.contextPath}/client/assets/img/menu/food6.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Phở gà</h4>
               
                <p class="price">
                35.000VNĐ
                </p>
              </div><!-- Menu Item -->

            </div>
          </div><!-- End Dinner Menu Content -->

        </div>

      </div>

    <!-- Events Section -->
    <section id="events" class="events section">
    <style>
.container-fluid {
    width: 100%;
    max-width: 100%;
    padding: 0;
    margin: 0;
}

.bg-light.rounded.p-4.pt-0 {
    width: 100%;
}

.img-fluid {
    max-width: 100%;
    height: auto;
}

.swiper {
    width: 100%;
}
</style>

<div class="container-fluid" data-aos="fade-up" data-aos-delay="100">
    <div class="swiper init-swiper">
        <script type="application/json" class="swiper-config">
            {
                "loop": true,
                "speed": 600,
                "autoplay": {
                    "delay": 5000
                },
                "slidesPerView": "auto",
                "pagination": {
                    "el": ".swiper-pagination",
                    "type": "bullets",
                    "clickable": true
                },
                "breakpoints": {
                    "320": {
                        "slidesPerView": 1,
                        "spaceBetween": 40
                    },
                    "1200": {
                        "slidesPerView": 3,
                        "spaceBetween": 1
                    }
                }
            }
        </script>
             <div class="col-lg-5 col-xl-4">
                       <div class="bg-light rounded p-4 pt-0">
                            <div class="row g-4">
                              <c:forEach var="news" items="${list}" varStatus="status">
    <div class="col-12">
        <div class="row g-4 align-items-center">
            <div class="col-5">
                <div class="overflow-hidden rounded">
                    <img src="${pageContext.request.contextPath}/images/${news.image}" 
                         class="img-zoomin img-fluid rounded w-100" 
                         alt="${news.title}">
                </div>
            </div>
            <div class="col-7">
                <div class="features-content d-flex flex-column">
                    <a href="news-detail?id=${news.id}" class="h6">${news.title}</a>
                    <small><i class="fa fa-clock"></i> 
                        <c:set var="wordCount" value="${fn:length(fn:split(news.content, ' '))}" />
                        <c:set var="readTime" value="${(wordCount / 200) + 1}" />
                        <fmt:formatNumber value="${readTime}" maxFractionDigits="0" /> minute read
                    </small>
                    <small><i class="fa fa-eye"></i> 
                        <c:choose>
                            <c:when test="${news.viewcout >= 1000}">
                                <fmt:formatNumber value="${news.viewcout / 1000}" maxFractionDigits="1" />k Views
                            </c:when>
                            <c:otherwise>
                                ${news.viewcout} Views
                            </c:otherwise>
                        </c:choose>
                    </small>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
 </div>
            </div>
            
   
     

           <div class="swiper-pagination"></div>
         </div>
            </div>
            
    </section><!-- /Events Section -->
 
   


  
