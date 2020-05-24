package com.tao.util;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

public class VerifyCode {
    private static final long serialVersionUID = 1L;
    private static final int WIDTH=130;
    private static final int HEIGHT=40;
    public static void verify(HttpServletRequest request, HttpServletResponse response) throws IOException {
        BufferedImage img=new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
        Graphics g = img.getGraphics();
        setBackground(g);//设置背景
        setBorder(g);
        drawLine(g);
        String code=drawRandomNum((Graphics2D)g);

        request.getSession().setAttribute("verifycode", code);
        response.setContentType("image/jpeg");
        //不允许使用缓冲
        response.setDateHeader("expries", -1);
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Pragma", "no-cache");
        //g.dispose();
        ImageIO.write(img, "JPEG", response.getOutputStream());
        response.getOutputStream().flush();
        response.getOutputStream().close();

    }
    private static void setBackground(Graphics g) {
        g.setColor(Color.WHITE);
        g.fillRect(0, 0, WIDTH, HEIGHT);

    }
    private static void setBorder(Graphics g) {
        g.setColor(Color.BLUE);
        g.drawRect(0, 0, WIDTH-2, HEIGHT-2);

    }
    private static void drawLine(Graphics g) {
        g.setColor(Color.GREEN);
        for(int i=1;i<15;i++) {
            int x1=new Random().nextInt(WIDTH);
            int y1=new Random().nextInt(HEIGHT);
            int x2=new Random().nextInt(WIDTH);
            int y2=new Random().nextInt(HEIGHT);
            g.drawLine(x1, y1, x2, y2);
        }
    }


    private static String drawRandomNum(Graphics2D g) {
        g.setColor(Color.RED);
        //String base="\u7684\u4e00\u4e86\u662f\u6211\u4e0d\u5728\u4eba\u4eec\u6709\u6765\u4ed6\u8fd9\u4e0a\u7740\u4e2a\u5730\u5230\u5927\u91cc\u8bf4\u5c31\u53bb\u5b50\u5f97\u4e5f\u548c\u90a3\u8981\u4e0b\u770b\u5929\u65f6\u8fc7\u51fa\u5c0f\u4e48\u8d77\u4f60\u90fd\u628a\u597d\u8fd8\u591a\u6ca1\u4e3a\u53c8\u53ef\u5bb6\u5b66\u53ea\u4ee5\u4e3b\u4f1a\u6837\u5e74\u60f3\u751f\u540c\u8001\u4e2d\u5341\u4ece\u81ea\u9762\u524d\u5934\u9053\u5b83\u540e\u7136\u8d70\u5f88\u50cf\u89c1\u4e24\u7528\u5979\u56fd\u52a8\u8fdb\u6210\u56de\u4ec0\u8fb9\u4f5c\u5bf9\u5f00\u800c\u5df1";

        String base="0123456789qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM";
        g.setFont(new Font("宋体",Font.BOLD,30));
        int x=5;
        StringBuffer sb=new StringBuffer();
        for (int i = 1; i <=4; i++) {
            String ch=base.charAt(new Random().nextInt(base.length()))+"";
            sb.append(ch);
            int degree=new Random().nextInt()%30;
            g.rotate(degree*Math.PI/180, x, 25);
            g.drawString(ch, x, 30);
            g.rotate(-degree*Math.PI/180, x, 25);
            x+=30;
        }
        return sb.toString();
    }


    }
