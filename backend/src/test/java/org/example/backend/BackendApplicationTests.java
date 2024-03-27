package org.example.backend;

import jakarta.annotation.Resource;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;


import java.util.Map;
import java.util.Objects;

@SpringBootTest
class BackendApplicationTests {
    @Resource
    JdbcTemplate tem;

    @Test
    void contextLoads() {
       Map<String, Object> stringObjectsMap= tem.queryForMap("select * from users where uid = 1");
        System.out.println(stringObjectsMap);
        System.out.println(Objects.requireNonNull(stringObjectsMap).get("username"));
    }

}
