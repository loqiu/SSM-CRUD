package com.wcj.Controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wcj.bean.Employee;
import com.wcj.bean.Msg;
import com.wcj.service.EmployeeService;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author loqiu
 * @date 2020-03-16-14:07
 */
@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    /**
     * 查询员工数据
     *
     * @return
     */
    @RequestMapping("/emps")
    public String allEmps(@RequestParam(value = "pageNumber", defaultValue = "1") Integer pageNumber, Model model) {
        PageHelper.startPage(pageNumber, 5);
        List<Employee> emps = employeeService.getAllEmps();
        PageInfo<Employee> info = new PageInfo<>(emps, 5);
        model.addAttribute("pageInfo", info);
        return "list";
    }

    /**
     * 使用json传递数据
     */
    @RequestMapping("/empsWithJson")
    @ResponseBody
    public Msg allEmpsWithJson(@RequestParam(value = "pageNumber", defaultValue = "1") Integer pageNumber) {
        PageHelper.startPage(pageNumber, 5);
        List<Employee> emps = employeeService.getAllEmps();
        PageInfo<Employee> info = new PageInfo<>(emps, 5);
        return Msg.success().add("pageInfo", info);
    }

    /**
     * 保存新增的emp数据，并添加数据库
     * 用restful风格的url
     * get - select
     * post insert
     * put update
     * delete delete
     */
    @RequestMapping(value = "/saveEmp", method = RequestMethod.POST)
    @ResponseBody
    /**
     * 还要进行JS303的数据校验
     */
    public Msg saveEmps(@Valid Employee employee, BindingResult result) {
        if (result.hasErrors()) {
            //校验失败,在模态框也要显示错误信息
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError error : errors) {
                System.out.println("错误字段=" + error.getField());
                System.out.println("错误信息=" + error.getDefaultMessage());
                map.put(error.getField(), error.getDefaultMessage());
            }
            return Msg.fail().add("errorFileds", map);
        } else {

        }
        employeeService.saveEmp(employee);
        return Msg.success();
    }

    /**
     * chekcEmpEmail 是否重复
     *
     * @param empEmail
     * @return
     */
    @RequestMapping("/checkEmpEmail")
    @ResponseBody
    public Msg checkEmpEmail(@RequestParam("empEmail") String empEmail) {
        //先判断是否合法，再判断是否重复
        String regx = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$";
        if (!empEmail.matches(regx)) {
            return Msg.fail().add("va_msg", "邮箱格式不对");
        }
        boolean flag = employeeService.CheckEmpEmail(empEmail);
        if (flag) {
            return Msg.success();
        }
        return Msg.fail().add("va_msg", "邮箱不可用");
    }

    @RequestMapping("/checkEmpName")
    @ResponseBody
    public Msg checkEmpName(@RequestParam("empName") String empName) {
        //先判断是否合法，再判断是否重复
        String regx = "(^[a-zA-Z0-9_-]{4,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if (!empName.matches(regx)) {
            return Msg.fail().add("va_msg", "姓名格式不对");
        }
        boolean flag = employeeService.CheckEmpName(empName);
        if (flag) {
            return Msg.success();
        }
        //不可用是姓名重复
        return Msg.fail().add("va_msg", "姓名不可用");
    }

    /**
     * 修改模态款查询员工信息
     * GET -- select
     */
    @RequestMapping(value = "/getEmp/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmpById(@PathVariable("id") Integer id) {
        Employee emp = employeeService.getEmpsById(id);
        System.out.println("emp = " + emp);
        return Msg.success().add("emp", emp);
    }

    /**
     * 更新emp
     */
    @RequestMapping(value = "/UpdateEmp/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg UpdateEmp(Employee employee) {
        System.out.println("UpdateEmp：employee = " + employee);
        employeeService.UpdateEmp(employee);
        return Msg.success();
    }

    /**
     * 支持批量删除emp
     * 定义 ids：1-2-3-4
     * 单个id；1
     */
    @RequestMapping(value = "/delEmp/{ids}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmp(@PathVariable("ids") String ids) {
        if (ids.contains("-")) {
            //多个id
            List<Integer> del_ids = new ArrayList<>();
            String[] str_ids = ids.split("-");
            for (String str : str_ids) {
                del_ids.add(Integer.parseInt(str));
            }
            employeeService.deleteBatch(del_ids);
        } else {
            //单个id
            Integer id = Integer.parseInt(ids);
            employeeService.deleteEmp(id);
        }
        return Msg.success();
    }
}
