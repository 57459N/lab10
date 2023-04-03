package bsu.rfe.java.teacher.tag;

import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class captchaCheck extends SimpleTagSupport {
    String response;

    public void setResponse(String resp) {
        this.response = resp;
    }

    public void doTag() throws IOException {
        URL obj = new URL("https://www.google.com/recaptcha/api/siteverify");
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setRequestMethod("POST");

        byte[] postData = ("secret=6LdiWUglAAAAAOxq5Xg1z0qHJbnuUvnubjDVlO31&response=" + response)
                .getBytes(StandardCharsets.UTF_8);

        con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        con.setRequestProperty("charset", "utf-8");
        con.setRequestProperty("Content-Length", Integer.toString(postData.length));
        con.setRequestProperty("Accept", "application/json");
        con.setUseCaches(false);

        con.setDoOutput(true);

        try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
            wr.write(postData);
        }

        StringBuilder api_response = new StringBuilder();
        try (BufferedReader br = new BufferedReader(
                new InputStreamReader(con.getInputStream(), "utf-8"))) {
            String api_responseLine = null;
            while ((api_responseLine = br.readLine()) != null) {
                api_response.append(api_responseLine.trim());
            }
        }
        if (!api_response.toString().equals("")) {
            JSONObject jo = new JSONObject(api_response.toString());
            getJspContext().setAttribute("recaptcha-success", jo.get("success"));
        }
    }
}
