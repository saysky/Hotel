package com.example.hotel.util;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.text.StrBuilder;
import com.example.hotel.exception.MyBusinessException;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * @author 言曌
 * @date 2020/3/8 5:45 下午
 */
public class FileUtil {

    /**
     * 上传文件返回URL
     *
     * @param file
     * @return
     */
    public static String upload(MultipartFile file) {
        String path = "";
        try {
            //用户目录
            final StrBuilder uploadPath = new StrBuilder(System.getProperties().getProperty("user.home"));
            uploadPath.append("/sens/upload/" + DateUtil.thisYear()).append("/").append(DateUtil.thisMonth() + 1).append("/");
            final File mediaPath = new File(uploadPath.toString());
            if (!mediaPath.exists()) {
                if (!mediaPath.mkdirs()) {
                    throw new MyBusinessException("上传失败");
                }
            }

            //不带后缀
            String nameWithOutSuffix = file.getOriginalFilename().substring(0, file.getOriginalFilename().lastIndexOf('.')).replaceAll(" ", "_").replaceAll(",", "");

            //文件后缀
            final String fileSuffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.') + 1);

            //带后缀
            String fileName = nameWithOutSuffix + "." + fileSuffix;

            //判断文件名是否已存在
            File descFile = new File(mediaPath.getAbsoluteFile(), fileName);
            int i = 1;
            while (descFile.exists()) {
                nameWithOutSuffix = nameWithOutSuffix + "(" + i + ")";
                descFile = new File(mediaPath.getAbsoluteFile(), nameWithOutSuffix + "." + fileSuffix);
                i++;
            }
            file.transferTo(descFile);

            //文件原路径
            final StrBuilder fullPath = new StrBuilder(mediaPath.getAbsolutePath());
            fullPath.append("/");
            fullPath.append(nameWithOutSuffix + "." + fileSuffix);

            //压缩文件路径
            final StrBuilder fullSmallPath = new StrBuilder(mediaPath.getAbsolutePath());
            fullSmallPath.append("/");
            fullSmallPath.append(nameWithOutSuffix);
            fullSmallPath.append("_small.");
            fullSmallPath.append(fileSuffix);

            //映射路径
            final StrBuilder filePath = new StrBuilder("/upload/");
            filePath.append(DateUtil.thisYear());
            filePath.append("/");
            filePath.append(DateUtil.thisMonth() + 1);
            filePath.append("/");
            filePath.append(nameWithOutSuffix + "." + fileSuffix);
            path = filePath.toString();

        } catch (IOException e) {
            e.printStackTrace();
        }
        return path;
    }
}
