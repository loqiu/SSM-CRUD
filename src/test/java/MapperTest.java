import com.wcj.bean.Department;
import com.wcj.bean.Employee;
import com.wcj.dao.DepartmentMapper;
import com.wcj.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * @author loqiu
 * @date 2020-03-15-18:24
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;

    @Test
    public void testCURD() {
//        ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
//        DepartmentMapper mapper = ioc.getBean(DepartmentMapper.class);
        System.out.println("departmentMapper = " + departmentMapper);

        Department department = new Department(null, "ssmTest");
//        departmentMapper.insertSelective(department);
//        employeeMapper.insertSelective(new Employee
//                (null, "atguigu", "男", "atguigu@ssm.com", 2));
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 1; i <= 1000; i++) {
            String uid = UUID.randomUUID().toString().substring(0, 5) + i;
            mapper.insertSelective(new Employee(null, uid, "男", uid + "atguigu@163.com", 1));
        }
        System.out.println("batch is ok!");
    }

}
