package com.pmy.util;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import com.pmy.pojo.Result;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

public class LoadUtil {

    public static String upLoadHeadPic(MultipartFile file){
        String path = "E:/projectPractice/GymManageSystem/src/main/webapp/img";
        File f=new File(path);
        //如果不存在，直接创建
        if(!f.exists()){
            f.mkdirs();
        }

        String originalFilename = file.getOriginalFilename();
        originalFilename = originalFilename.substring(originalFilename.lastIndexOf('.'),originalFilename.length());

        String id = IdUtil.fastUUID();//设置文件名唯一
        String rootFileName = id+originalFilename;

        String rootPath = path+"/"+rootFileName;

        try {
            FileUtil.writeBytes(file.getBytes(),rootPath);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return rootPath;
    }

    //上传图片
    public static String uploadPhoto(MultipartFile multipartFile){
        //获取绝对路径
        String path ="D:/img";
        File f=new File(path);
        //如果不存在，直接创建
        if(!f.exists()){
            f.mkdirs();
        }
        //获取图片名称
        String filename = multipartFile.getOriginalFilename();
        //拼接的图片路径
        String filepath=path+"/"+filename;
        File file = new File(filepath);
        //上传图片
        try {
            multipartFile.transferTo(file);
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return filepath;
    }

    //回显图片
    public static void showPhoto(String photo,HttpServletResponse response){
        //获取图片的当前路径  放入读
        FileInputStream fis=null;
        //用response  获取一个写对象的流
        ServletOutputStream os=null;
        try {
            fis = new FileInputStream(photo);
            os = response.getOutputStream();
            //提高读写的速度
            byte[] b=new byte[1024];
            //边读边写
            while(fis.read(b)!=-1){
                os.write(b);
            }
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            try {
                if(os!=null){
                    os.close();
                }
                if(fis!=null){
                    fis.close();
                }
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        }

    }
    //下载
    public static void downLoad(String filepath, HttpServletRequest request, HttpServletResponse response) {
        //设置文件的MiMe类型
        response.setContentType(request.getSession().getServletContext().getMimeType(filepath));
        //设置content-dispsition
        response.setHeader("Content-Disposition", "attachment;filename=" + filepath);
        //读取目标文件，通过response将目标文件写到客户
        try {
            //读取文件
            InputStream in = new FileInputStream(filepath);
            OutputStream out = response.getOutputStream();
            //写文件
            byte[] b = new byte[1024];
            while (in.read(b) != -1) {
                out.write(b);
            }
            in.close();
            out.close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
