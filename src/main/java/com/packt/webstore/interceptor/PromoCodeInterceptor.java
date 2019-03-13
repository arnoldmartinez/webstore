package com.packt.webstore.interceptor;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PromoCodeInterceptor extends HandlerInterceptorAdapter {

    @Getter @Setter private String promoCode;

    @Getter @Setter private String errorRedirect;

    @Getter @Setter private String offerRedirect;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String givenPromoCode = request.getParameterValues("promo") == null ? "" : request.getParameterValues("promo")[0];

        if(request.getRequestURI().endsWith("products/specialOffer")) {
            if(givenPromoCode.equals(promoCode)) {
                response.sendRedirect(request.getContextPath() + "/" + offerRedirect);
            } else {
                response.sendRedirect(errorRedirect);
            }

            return false;
        }

        return true;
    }
}
