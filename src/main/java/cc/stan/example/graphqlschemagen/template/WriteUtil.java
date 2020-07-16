package cc.stan.example.graphqlschemagen.template;

import cc.stan.example.graphqlschemagen.mod.Clz;
import lombok.extern.slf4j.Slf4j;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/** 写入类 */
@Slf4j
public class WriteUtil {


    /** 写入方式 */
    public static void write(String content, String file) throws IOException {
        Path dir = Paths.get("./build/gen/");
        if (Files.notExists(dir)) {
            Files.createDirectory(dir);
        }
        try (OutputStream out = new FileOutputStream("./build/gen/" + file);
             Writer writer = new OutputStreamWriter(out, "UTF-8")) {
            writer.write(content);
        }
    }

    /** 写入文件 */
    public static void write(String data, Clz clz, String formatString) {
        try {
            WriteUtil.write(data, String.format(formatString, clz.getClzName()));
        } catch (Exception e) {
            log.warn("写入文件失败,{}", e.getMessage());
        }
    }


}
