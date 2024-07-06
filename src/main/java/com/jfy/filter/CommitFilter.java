package com.jfy.filter;

import com.jfy.domain.Commit;
import com.jfy.service.CommitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import javax.servlet.*;
import java.io.IOException;
import java.util.List;

@Configuration("commitFilter")
public class CommitFilter implements Filter {

    @Autowired
    public CommitService commitService;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        List<Commit> commitList = commitService.getAllCommit();
        request.setAttribute("commitList", commitList);
        chain.doFilter(request, response);

    }

    @Override
    public void destroy() {

    }
}
