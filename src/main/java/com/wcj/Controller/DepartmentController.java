package com.wcj.Controller;

import com.wcj.bean.Department;
import com.wcj.bean.Msg;
import com.wcj.dao.DepartmentMapper;
import com.wcj.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author loqiu
 * @date 2020-03-17-22:59
 */
@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/depts")
    @ResponseBody
    public Msg getDept(){
        List<Department> list = departmentService.getDepts();
        return Msg.success().add("deptList", list);
    }
}
