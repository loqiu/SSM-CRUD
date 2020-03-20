import com.github.pagehelper.PageInfo;
import com.wcj.bean.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * @author loqiu
 * @date 2020-03-16-14:48
 */
@RunWith(SpringJUnit4ClassRunner.class)
//这个注解能让spring自己调用自己
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "file:target/classes/springmvc.xml"})
public class MvcTest {
    //传入spring的ioc容器
    @Autowired
    WebApplicationContext webApplicationContext;

    //虚拟的mvc 模拟请求
    MockMvc mockMvc;

    @Before
    public void initMock() {
        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
    }

    @Test
    public void testPage() throws Exception {
        //拿到返回值
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.
                get("/emps").param("pageNumber", "5")).andReturn();
        //请求成功之后，请求域中会有pageInfo
        MockHttpServletRequest request = result.getRequest();
        PageInfo info = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码 = " + info.getPageNum());
        System.out.println("总页码 = " + info.getPages());
        System.out.println("总记录数 = " + info.getTotal());
        System.out.println("连续显示页码：");
        int[] nums = info.getNavigatepageNums();
        for (int i : nums) {
            System.out.println(" " + i);
        }
        //获取员工数据
        List<Employee> list = info.getList();
        for (Employee emp : list) {
            System.out.println("ID = " + emp.getId() + "--- Name = " + emp.getLastName());
        }
    }


}
