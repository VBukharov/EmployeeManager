package ru.bukharov.employeemanager.service;

import java.util.List;

import ru.bukharov.employeemanager.domain.Employee;

public interface EmployeeService{
    public void addEmployee(Employee employee);
    public List<Employee> listEmployee();
    public void changeEmployee(Employee employee);
    public void removeEmployee(int id);
    public Employee findEmployee(int id);
    public List<Employee> findEmployeeByName(String firstName, String secondName, String lastName);
}