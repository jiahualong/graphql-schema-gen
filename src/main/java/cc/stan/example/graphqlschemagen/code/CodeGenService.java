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
                new FtlAndJava("Model.ftl" , "%s.java"),
                new FtlAndJava("Ctl.ftl" , "%sCtl.java"),
                new FtlAndJava("DAO.ftl" , "%sDAO.java"),
                new FtlAndJava("DTO.ftl" , "%sDTO.java"),
                new FtlAndJava("FindListOutput.ftl" , "Find%sListOutput.java"),
                new FtlAndJava("FindListInput.ftl" , "Find%sListInput.java"),
                new FtlAndJava("Ictl.ftl" , "I%sCtl.java"),
                new FtlAndJava("Input.ftl" , "%sInput.java"),
                new FtlAndJava("IService.ftl" , "I%sService.java"),
                new FtlAndJava("Mapper.ftl" , "%sMapper.java"),
                new FtlAndJava("MapStruct.ftl" , "%sMapStruct.java"),
                new FtlAndJava("PropertyResolver.ftl" , "%sPropertyResolver.java"),
                new FtlAndJava("Resolver.ftl" , "%sResolver.java"),
                new FtlAndJava("Service.ftl" , "%sService.java"),
                new FtlAndJava("VO.ftl" , "%sVO.java"),
                new FtlAndJava("VOMapStruct.ftl" , "%sVOMapStruct.java"),
                new FtlAndJava("graphqls.ftl" , "%s.graphqls")
        );

        ftlAndJavaList.stream().forEach(fj -> {
            System.out.println("gen," + fj);
            String data = gen.gen(clz, program, author, create, fj.getFtl());
            WriteUtil.write(data, clz, fj.getJava());
        });
    }
}
