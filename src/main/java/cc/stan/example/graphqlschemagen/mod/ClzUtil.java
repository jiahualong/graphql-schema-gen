package cc.stan.example.graphqlschemagen.mod;

import java.util.Arrays;
import java.util.List;

import static java.util.stream.Collectors.toList;

public class ClzUtil {

    /** sql 转  clz */
    public static Clz fromSql(List<String> sql) {
        List<List<String>> sqlList = sql.stream()
                .map(sqlLine -> sqlLine.split(","))
                .map(sqlLineSplit -> Arrays.asList(sqlLineSplit).stream().map(s -> s.trim()).collect(toList()))
                .collect(toList());

        return Clz.builder()
                .comment(sqlList.get(0).get(1))
                .tblName(sqlList.get(0).get(0))
                .propList(sqlList.stream().skip(1).map(line -> Prop.builder()
                        .dbProp(line.get(0))
                        .dbType(line.get(1))
                        .comm(line.get(2))
                        .build()).collect(toList()))
                .build()
                .fill();
    }
}
