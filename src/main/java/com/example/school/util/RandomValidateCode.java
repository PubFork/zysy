package com.example.school.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * TODO: 生成验证码
 * @param:
 * @return:
 * @author: 
 * @version 1.0
 * @date: 
 */
public class RandomValidateCode {

    private static final String RANDOMCODEKEY = "RANDOMVALIDATECODEKEY";
    private Random random = new Random();
    private String randString = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final int COLOR_RAND = 255;

    private int width = 80;
    private int height = 26;


    private Font getFont(){
        return new Font("Fixedsys", Font.BOLD,18);
    }


    private Color getRandColor(int fc,int bc){
        if(fc > COLOR_RAND) {
            fc = 255;
        }
        if(bc > COLOR_RAND) {
            bc = 255;
        }
        int r = fc + random.nextInt(bc-fc-16);
        int g = fc + random.nextInt(bc-fc-14);
        int b = fc + random.nextInt(bc-fc-18);
        return new Color(r,g,b);
    }

    public void getRandcode(HttpServletRequest request,
                            HttpServletResponse response) {
        HttpSession session = request.getSession();
        //BufferedImage类是具有缓冲区的Image类,Image类是用于描述图像信息的类
        BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_BGR);
        //产生Image对象的Graphics对象,改对象可以在图像上进行各种绘制操作
        Graphics g = image.getGraphics();
        g.fillRect(0, 0, width, height);
        g.setFont(new Font("Times New Roman", Font.PLAIN,18));
        g.setColor(getRandColor(110, 133));
        //绘制干扰线
        int lineSize = 40;
        for(int i = 0; i<= lineSize; i++){
            drowLine(g);
        }
        //绘制随机字符
        String randomString = "";
        int stringNum = 4;
        for(int i = 1; i<= stringNum; i++){
            randomString=drowString(g,randomString,i);
        }

        session.removeAttribute(RANDOMCODEKEY);
        session.setAttribute(RANDOMCODEKEY, randomString);

        g.dispose();
        try {
            ImageIO.write(image, "JPEG", response.getOutputStream());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private String drowString(Graphics g,String randomString,int i){
        g.setFont(getFont());
        g.setColor(new Color(random.nextInt(101),random.nextInt(111),random.nextInt(121)));
        String rand = String.valueOf(getRandomString(random.nextInt(randString.length())));
        randomString +=rand;
        g.translate(random.nextInt(3), random.nextInt(3));
        g.drawString(rand, 13*i, 16);
        return randomString;
    }

    private void drowLine(Graphics g){
        int x = random.nextInt(width);
        int y = random.nextInt(height);
        int xl = random.nextInt(13);
        int yl = random.nextInt(15);
        g.drawLine(x, y, x+xl, y+yl);
    }

    private String getRandomString(int num){
        return String.valueOf(randString.charAt(num));
    }
}