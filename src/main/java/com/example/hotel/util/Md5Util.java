package com.example.hotel.util;

import cn.hutool.core.text.StrBuilder;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.security.MessageDigest;

/**
 * 获取文件hash
 */
public class Md5Util {


    /**
     * shiro的md5加密
     *
     * @param pwd  密码
     * @param salt 盐
     * @param i    加密次数
     * @return 加密后字符串
     */
    public static String toMd5(String pwd, String salt, int i) {
        Md5Hash toMd5 = new Md5Hash(pwd, salt, i);
        return toMd5.toString();
    }

    /**
     * 计算文件MD5编码
     *
     * @param file file
     * @return byte
     * @throws Exception Exception
     */
    private static byte[] createChecksum(MultipartFile file) throws Exception {
        final InputStream fis = file.getInputStream();

        final byte[] buffer = new byte[1024];
        final MessageDigest complete = MessageDigest.getInstance("MD5");
        int numRead;

        do {
            numRead = fis.read(buffer);
            if (numRead > 0) {
                complete.update(buffer, 0, numRead);
            }
        } while (numRead != -1);

        fis.close();
        return complete.digest();
    }

    /**
     * 生成文件hash值
     *
     * @param file file
     * @return String
     * @throws Exception Exception
     */
    public static String getMD5Checksum(MultipartFile file) throws Exception {
        final byte[] b = createChecksum(file);
        StrBuilder result = new StrBuilder();

        for (int i = 0; i < b.length; i++) {
            result.append(Integer.toString((b[i] & 0xff) + 0x100, 16).substring(1));
        }
        return result.toString();
    }

    public static void main(String args[]) {

    }
}
