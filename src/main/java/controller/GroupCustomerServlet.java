package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;

@WebServlet(name = "GroupCustomerServlet")
public class GroupCustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String xml = null;
        try {
            byte[] xmlData = new byte[request.getContentLength()];

            //Start reading XML Request as a Stream of Bytes
            InputStream sis = request.getInputStream();
            BufferedInputStream bis = new BufferedInputStream(sis);

            bis.read(xmlData, 0, xmlData.length);

            if (request.getCharacterEncoding() != null) {
                xml = new String(xmlData, request.getCharacterEncoding());
            } else {
                xml = new String(xmlData);
            }
            System.out.println(xml);
            //xml and xmlData contains incomplete data
        } catch (IOException ioe) {
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
