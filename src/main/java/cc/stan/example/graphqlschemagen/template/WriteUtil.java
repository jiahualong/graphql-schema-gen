package cc.stan.example.graphqlschemagen.template;

import cc.stan.example.graphqlschemagen.mod.Clz;
import lombok.extern.slf4j.Slf4j;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import static java.nio.file.StandardOpenOption.CREATE;

/** 写入类 */
@Slf4j
public class WriteUtil {


    /** 写入方式 */
    public static void write(String content, String file) throws IOException {
        byte data[] = content.getBytes();
        Path dir = Paths.get("./build/gen/");
        if (Files.notExists(dir)) {
            Files.createDirectory(dir);
        }
        Path p = Paths.get("./build/gen/" + file);
        try (OutputStream out = new BufferedOutputStream(
                Files.newOutputStream(p, CREATE))) {
            out.write(data, 0, data.length);
        } catch (IOException x) {
            System.err.println(x);
        }
    }

    public static void write(String data, Clz clz, String formatString) {
        try {
            WriteUtil.write(data, String.format(formatString, clz.getClzName()));
        } catch (Exception e) {
            log.warn("写入文件失败,{}", e.getMessage());
        }
    }


}
