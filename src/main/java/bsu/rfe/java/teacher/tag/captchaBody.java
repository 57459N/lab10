package bsu.rfe.java.teacher.tag;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import net.tanesha.recaptcha.ReCaptcha;
import net.tanesha.recaptcha.ReCaptchaFactory;

import java.io.IOException;

public class captchaBody extends SimpleTagSupport {
    public void doTag() throws IOException {
        getJspContext().getOut().println("<div class=\"g-recaptcha\" data-sitekey=\"6LdiWUglAAAAACnc-AdGXfochHM-gNZyZMq7tmIW\"></div>");
    }
}
