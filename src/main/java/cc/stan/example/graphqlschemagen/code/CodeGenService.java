package cc.stan.example.graphqlschemagen.code;

import cc.stan.example.graphqlschemagen.mod.Clz;
import cc.stan.example.graphqlschemagen.mod.FtlAndJava;
import cc.stan.example.graphqlschemagen.template.FreemarkerGen;
import cc.stan.example.graphqlschemagen.template.WriteUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;

import static cc.stan.example.graphqlschemagen.mod.ClzUtil.fromSql;

/**
 * 生成代码类
 */
@Service
public class CodeGenService implements ICodeGenService {

    @Autowired
    private FreemarkerGen gen;

    @Override
    public void genCodes(CodeInfo codeInfo) {

        String program = codeInfo.getProgram();
        String author = codeInfo.getAuthor();
        String create = LocalDate.now().format(DateTimeFormatter.ISO_DATE);
        List<String> sql = codeInfo.getPropList();
        Clz clz = fromSql(sql);
        List<FtlAndJava> ftlAndJavaList = Arrays.asList(
                new FtlAndJava("convert.ftl" , "%sConvert.java"),
                new FtlAndJava("DTO.ftl" , "%sDTO.java"),
                new FtlAndJava("graphqls.ftl" , "%s.graphqls"),
                new FtlAndJava("IDAO.ftl" , "I%sDAO.java"),
                new FtlAndJava("IDAOImpl.ftl" , "%sDAOImpl.java"),
                new FtlAndJava("IService.ftl" , "I%sService.java"),
                new FtlAndJava("Mapper.ftl" , "%sMapper.java"),
                new FtlAndJava("model.ftl" , "%s.java"),
                new FtlAndJava("PageInput.ftl" , "Page%sInput.java"),
                new FtlAndJava("Resolver.ftl" , "%sResolver.java"),
                new FtlAndJava("SaveInput.ftl" , "Save%sInput.java"),
                new FtlAndJava("Service.ftl" , "%sServiceImpl.java"),
                new FtlAndJava("VO.ftl" , "%sVO.java")
        );

        ftlAndJavaList.stream().forEach(fj -> {
            System.out.println("gen," + fj);
            String data = gen.gen(clz, program, author, create, fj.getFtl());
            WriteUtil.write(data, clz, fj.getJava());
        });
    }
}
