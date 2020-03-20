package com.wcj.service;

import com.wcj.bean.Employee;
import com.wcj.bean.EmployeeExample;
import com.wcj.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author loqiu
 * @date 2020-03-16-14:10
 */
@Service
public class EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;

    public List<Employee> getAllEmps(){
        return employeeMapper.selectByExampleWithDept(null);
    }
    public void saveEmp(Employee emp){
        employeeMapper.insertSelective(emp);
    }
    public boolean CheckEmpEmail(String empEmail){
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andEmailEqualTo(empEmail);
        long count = employeeMapper.countByExample(employeeExample);
        return count==0;
    }
    public boolean CheckEmpName(String empName){
        EmployeeExample employeeExample = new EmployeeExample();
        EmployeeExample.Criteria criteria = employeeExample.createCriteria();
        criteria.andLastNameEqualTo(empName);
        long count = employeeMapper.countByExample(employeeExample);
        return count==0;
    }
    public Employee getEmpsById(int id){
        return employeeMapper.selectByPrimaryKeyWithDept(id);
    }
    public void UpdateEmp(Employee employee){
       employeeMapper.updateByPrimaryKeySelective(employee);
    }
    public void deleteEmp(int id){
        employeeMapper.deleteByPrimaryKey(id);
    }
    public void deleteBatch(List<Integer> ids){
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        //在sql语句中加上in范围--》 delete from xxx where id in(1,2,3);
        criteria.andIdIn(ids);
        employeeMapper.deleteByExample(example);
    }
}
