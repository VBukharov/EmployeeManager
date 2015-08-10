package ru.bukharov.employeemanager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import ru.bukharov.employeemanager.dao.EmployeeDAO;
import ru.bukharov.employeemanager.domain.Employee;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
    private EmployeeDAO employeeDAO;

    @Override
    @Transactional
    public void addEmployee(Employee employee) {
        employeeDAO.addEmployee(employee);
    }

    @Override
    @Transactional
    public List<Employee> listEmployee() {
        return employeeDAO.listEmployee();
    }

    @Override
    @Transactional
    public void changeEmployee(Employee employee) {
        employeeDAO.changeEmployee(employee);
    }

    @Override
    @Transactional
    public void removeEmployee(int id) {
        employeeDAO.removeEmployee(id);
    }

    @Override
    @Transactional
    public Employee findEmployee(int id) {
        return employeeDAO.findEmployee(id);
    }

	@Override
	@Transactional
	public List<Employee> findEmployeeByName(String firstName, String secondName, String lastName) {
		return employeeDAO.findEmployeeByName(firstName, secondName, lastName);
	}
    
}
