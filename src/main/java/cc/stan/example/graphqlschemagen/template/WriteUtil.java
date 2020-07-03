package cc.stan.example.graphqlschemagen.template;

import cc.stan.example.graphqlschemagen.mod.Clz;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import static java.nio.file.StandardOpenOption.CREATE;

/** 写入类 */
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

    /** 写 Model.java */
    public static void writeModel(String content, Clz clz) throws IOException {
        WriteUtil.write(content, String.format("%s.java", clz.getClzName()));
    }

    /** 写 Ctl.java */
    public static void writeCtl(String content, Clz clz) throws IOException {
        WriteUtil.write(content, String.format("%sCtl.java", clz.getClzName()));
    }

    public static void writeDAO(String dao, Clz clz) throws IOException {
        WriteUtil.write(dao, String.format("%sDAO.java", clz.getClzName()));
    }

    public static void writeDTO(String dto, Clz clz) throws IOException {
        WriteUtil.write(dto, String.format("%sDTO.java", clz.getClzName()));
    }
}
