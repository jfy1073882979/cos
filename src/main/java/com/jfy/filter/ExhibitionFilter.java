package com.jfy.filter;

import com.jfy.dao.ExhibitionMapper;
import com.jfy.domain.Exhibition;
import com.jfy.service.ExhibitionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import javax.servlet.*;
import java.io.IOException;
import java.util.List;

@Configuration("exhibitionFilter")
public class ExhibitionFilter implements Filter {

    @Autowired
    public ExhibitionService exhibitionService;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        List<Exhibition> exhibitionList = exhibitionService.getAllExhibition();
        request.setAttribute("exhibitionList", exhibitionList);
        chain.doFilter(request, response);

    }

    @Override
    public void destroy() {

    }
}
