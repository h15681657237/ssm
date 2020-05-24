package com.tao.util;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;
import java.util.Properties;

public class MyMappingException extends SimpleMappingExceptionResolver {
    public MyMappingException() {
        super();
    }

    @Override
    public void setExceptionMappings(Properties mappings) {
        super.setExceptionMappings(mappings);
    }

    @Override
    public void setExcludedExceptions(Class<?>... excludedExceptions) {
        super.setExcludedExceptions(excludedExceptions);
    }

    @Override
    public void setDefaultErrorView(String defaultErrorView) {
        super.setDefaultErrorView(defaultErrorView);
    }

    @Override
    public void setStatusCodes(Properties statusCodes) {
        super.setStatusCodes(statusCodes);
    }

    @Override
    public void addStatusCode(String viewName, int statusCode) {
        super.addStatusCode(viewName, statusCode);
    }

    @Override
    public Map<String, Integer> getStatusCodesAsMap() {
        return super.getStatusCodesAsMap();
    }

    @Override
    public void setDefaultStatusCode(int defaultStatusCode) {
        super.setDefaultStatusCode(defaultStatusCode);
    }

    @Override
    public void setExceptionAttribute(String exceptionAttribute) {
        super.setExceptionAttribute(exceptionAttribute);
    }

    @Override
    protected ModelAndView doResolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        ex.printStackTrace();
        return super.doResolveException(request, response, handler, ex);
    }

    @Override
    protected String determineViewName(Exception ex, HttpServletRequest request) {
        return super.determineViewName(ex, request);
    }

    @Override
    protected String findMatchingViewName(Properties exceptionMappings, Exception ex) {
        return super.findMatchingViewName(exceptionMappings, ex);
    }

    @Override
    protected int getDepth(String exceptionMapping, Exception ex) {
        return super.getDepth(exceptionMapping, ex);
    }

    @Override
    protected Integer determineStatusCode(HttpServletRequest request, String viewName) {
        return super.determineStatusCode(request, viewName);
    }

    @Override
    protected void applyStatusCodeIfPossible(HttpServletRequest request, HttpServletResponse response, int statusCode) {
        super.applyStatusCodeIfPossible(request, response, statusCode);
    }

    @Override
    protected ModelAndView getModelAndView(String viewName, Exception ex, HttpServletRequest request) {
        return super.getModelAndView(viewName, ex, request);
    }

    @Override
    protected ModelAndView getModelAndView(String viewName, Exception ex) {
        return super.getModelAndView(viewName, ex);
    }
}
