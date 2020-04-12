package com.example.hotel.exception;

import com.example.hotel.dto.JsonResult;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.http.HttpStatus;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.ui.Model;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.ValidationException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * 全局异常捕获
 */

@ControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    //错误显示页面
    public static final String viewName = "common/error/error";

    /**
     * 是否是ajax请求
     */
    public static boolean isAjax(HttpServletRequest httpRequest) {
        return (httpRequest.getHeader("X-Requested-With") != null
                && "XMLHttpRequest"
                .equals(httpRequest.getHeader("X-Requested-With").toString()));
    }


    /**
     * 400 - Bad Request
     */
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(MissingServletRequestParameterException.class)
    public String handleMissingServletRequestParameterException(MissingServletRequestParameterException e, Model model) {
        log.error("缺少请求参数", e);
        String message = "【缺少请求参数】" + e.getMessage();
        model.addAttribute("message", message);
        model.addAttribute("code", 400);
        return viewName;
    }

    /**
     * 400 - Bad Request
     */
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(HttpMessageNotReadableException.class)
    public String handleHttpMessageNotReadableException(HttpMessageNotReadableException e, Model model) {
        log.error("参数解析失败", e);
        String message = "【参数解析失败】" + e.getMessage();
        model.addAttribute("message", message);
        model.addAttribute("code", 400);
        return viewName;
    }

    /**
     * 400 - Bad Request
     */
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public String handleMethodArgumentNotValidException(MethodArgumentNotValidException e, Model model) {
        log.error("参数验证失败", e);
        BindingResult result = e.getBindingResult();
        FieldError error = result.getFieldError();
        String field = error.getField();
        String code = error.getDefaultMessage();
        String message = "【参数验证失败】" + String.format("%s:%s", field, code);
        model.addAttribute("message", message);
        model.addAttribute("code", 400);
        return viewName;
    }

    /**
     * 400 - Bad Request
     */
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(BindException.class)
    public String handleBindException(BindException e, Model model) {
        log.error("参数绑定失败", e);
        BindingResult result = e.getBindingResult();
        FieldError error = result.getFieldError();
        String field = error.getField();
        String code = error.getDefaultMessage();
        String message = "【参数绑定失败】" + String.format("%s:%s", field, code);

        model.addAttribute("message", message);
        model.addAttribute("code", 400);
        return viewName;
    }


    /**
     * 400 - Bad Request
     */
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(ConstraintViolationException.class)
    public String handleServiceException(ConstraintViolationException e, Model model) {
        log.error("参数验证失败", e);
        Set<ConstraintViolation<?>> violations = e.getConstraintViolations();
        ConstraintViolation<?> violation = violations.iterator().next();
        String message = "【参数验证失败】" + violation.getMessage();
        model.addAttribute("message", message);
        model.addAttribute("code", 400);
        return viewName;
    }

    /**
     * 400 - Bad Request
     */
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(ValidationException.class)
    public String handleValidationException(ValidationException e, Model model) {
        log.error("参数验证失败", e);
        String message = "【参数验证失败】" + e.getMessage();
        model.addAttribute("message", message);
        model.addAttribute("code", 400);
        return viewName;
    }

    /**
     * 404 - Not Found
     */
    @ResponseStatus(HttpStatus.NOT_FOUND)
    @ExceptionHandler(NoHandlerFoundException.class)
    public String noHandlerFoundException(NoHandlerFoundException e, Model model) {
        log.error("Not Found", e);
        String message = "【页面不存在】" + e.getMessage();
        model.addAttribute("message", message);
        model.addAttribute("code", 404);
        return viewName;
    }


    /**
     * 405 - Method Not Allowed
     */
    @ResponseStatus(HttpStatus.METHOD_NOT_ALLOWED)
    @ExceptionHandler(HttpRequestMethodNotSupportedException.class)
    public String handleHttpRequestMethodNotSupportedException(HttpRequestMethodNotSupportedException e, Model model) {
        log.error("不支持当前请求方法", e);
        String message = "【不支持当前请求方法】" + e.getMessage();
        model.addAttribute("message", message);
        model.addAttribute("code", 405);
        return viewName;
    }

    /**
     * 415 - Unsupported Media Type
     */
    @ResponseStatus(HttpStatus.UNSUPPORTED_MEDIA_TYPE)
    @ExceptionHandler(HttpMediaTypeNotSupportedException.class)
    public String handleHttpMediaTypeNotSupportedException(HttpMediaTypeNotSupportedException e, Model model) {
        log.error("不支持当前媒体类型", e);
        String message = "【不支持当前媒体类型】" + e.getMessage();
        model.addAttribute("message", message);
        model.addAttribute("code", 415);
        return viewName;
    }

    /**
     * 统一异常处理
     *
     * @param response
     * @param e
     * @return
     */
    @ExceptionHandler(MyBusinessException.class)
    @ResponseBody
    public JsonResult processApiException(HttpServletResponse response,
                                          MyBusinessException e) {
        JsonResult result = new JsonResult(0, e.getMessage());
        response.setStatus(200);
        response.setContentType("application/json;charset=UTF-8");
        log.error("业务异常，提示前端操作不合法", e.getMessage(), e);
        return result;
    }

    /**
     * 获取其它异常。包括500
     *
     * @param e
     * @return
     * @throws Exception
     */
    @ExceptionHandler(value = Exception.class)
    public ModelAndView defaultErrorHandler(HttpServletRequest request,
                                            HttpServletResponse response,
                                            Exception e, Model model) throws IOException {
        e.printStackTrace();

        if (isAjax(request)) {
            ModelAndView mav = new ModelAndView();
            MappingJackson2JsonView view = new MappingJackson2JsonView();
            Map<String, Object> attributes = new HashMap<String, Object>();
            if (e instanceof UnauthorizedException) {
                attributes.put("msg", "没有权限");
            } else {
                attributes.put("msg", e.getMessage());
            }
            attributes.put("code", "0");
            view.setAttributesMap(attributes);
            mav.setView(view);
            return mav;
        }

        if (e instanceof UnauthorizedException) {
            //请登录
            log.error("无权访问", e);
            return new ModelAndView("common/error/403");
        }
        //其他异常
        String message = e.getMessage();
        model.addAttribute("code", 500);
        model.addAttribute("message", message);
        return new ModelAndView("common/error/500");
    }
}
