package com.example.npeeinfo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

@WebServlet(name = "downloadServlet", value = "/downloadServlet")
public class downloadServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");

        String[] names = request.getParameterValues("names[]");
        String path = request.getServletContext().getRealPath("/file/");
        System.out.println(path);

        File zipFile = new File(path + "files.zip");
        try (ZipOutputStream zipOut = new ZipOutputStream(new FileOutputStream(zipFile))) {
            for (String name : names) {
                name = name.trim();
                System.out.println(name);

                File file = new File(path + name + ".txt");
                if (file.exists() && file.isFile()) {
                    addFileToZip(file, zipOut);
                }
            }
        }

        if (zipFile.exists()) {
            downloadFile(response, zipFile, "files.zip");
        } else {
            response.getWriter().println("No files found.");
        }
    }

    // 添加文件到 ZIP 压缩文件
    private void addFileToZip(File file, ZipOutputStream zipOut) throws IOException {
        try (FileInputStream fileIn = new FileInputStream(file)) {
            ZipEntry zipEntry = new ZipEntry(file.getName());
            zipOut.putNextEntry(zipEntry);

            byte[] buffer = new byte[1024];
            int length;
            while ((length = fileIn.read(buffer)) > 0) {
                zipOut.write(buffer, 0, length);
            }
        }
    }

    // 文件下载方法
    private void downloadFile(HttpServletResponse response, File file, String fileName) throws IOException {
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
        InputStream in = new FileInputStream(file);
        ServletOutputStream out = response.getOutputStream();
        byte[] bytes = new byte[1024];
        int len;
        while ((len = in.read(bytes)) != -1) {
            out.write(bytes, 0, len);
        }
        out.close();
        in.close();
    }
}
