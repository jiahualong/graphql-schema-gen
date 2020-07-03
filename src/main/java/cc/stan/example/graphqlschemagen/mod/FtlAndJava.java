package cc.stan.example.graphqlschemagen.mod;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@AllArgsConstructor
@ToString
public final class FtlAndJava {
    private final String ftl;
    private final String java;
}
