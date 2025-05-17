package org.example.exception;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(Exception.class)
    public ModelAndView handleException(Exception ex, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("error");
        mav.addObject("errorCode", HttpStatus.INTERNAL_SERVER_ERROR.value());
        mav.addObject("errorTitle", "Server Error");
        mav.addObject("errorMessage", "An unexpected error occurred. Please try again later.");
        return mav;
    }

    @ExceptionHandler(ResourceNotFoundException.class)
    public ModelAndView handleResourceNotFoundException(ResourceNotFoundException ex, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("error");
        mav.addObject("errorCode", HttpStatus.NOT_FOUND.value());
        mav.addObject("errorTitle", "Resource Not Found");
        mav.addObject("errorMessage", ex.getMessage());
        return mav;
    }

    @ExceptionHandler(org.example.exception.AccessDeniedException.class)
    public ModelAndView handleAccessDeniedException(org.example.exception.AccessDeniedException ex, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("error");
        mav.addObject("errorCode", HttpStatus.FORBIDDEN.value());
        mav.addObject("errorTitle", "Access Denied");
        mav.addObject("errorMessage", ex.getMessage());
        return mav;
    }
}