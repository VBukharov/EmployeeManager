package ru.bukharov.employeemanager.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ru.bukharov.employeemanager.domain.Employee;

@Repository
public class EmployeeDAOImpl implements EmployeeDAO {

	 	@Autowired
	    private SessionFactory sessionFactory;

	    @Override
	    public void addEmployee(Employee employee) {
	        sessionFactory.getCurrentSession().save(employee);
	    }

	    @Override
	    @SuppressWarnings("unchecked")
	    public List<Employee> listEmployee() {
	        return sessionFactory.getCurrentSession().createQuery("from Employee").list();
	    }

	    @Override
	    public void changeEmployee(Employee employee) {
	    	Employee editedEmployee = (Employee)sessionFactory.getCurrentSession().get(Employee.class, employee.getId());
	    	editedEmployee.setAge(employee.getAge());
	    	editedEmployee.setDescription(employee.getDescription());
	    	editedEmployee.setExperience(employee.getExperience());
	    	editedEmployee.setFirstName(employee.getFirstName());
	    	editedEmployee.setSecondName(employee.getSecondName());
	    	editedEmployee.setLastName(employee.getLastName());
	    	sessionFactory.getCurrentSession().save(editedEmployee);
	    }

	    @Override
	    public void removeEmployee(int id) {
	        Employee employee = (Employee)sessionFactory.getCurrentSession().load(Employee.class, id);
	        if(employee != null){
	            sessionFactory.getCurrentSession().delete(employee);
	        }
	    }

	    @Override
	    public Employee findEmployee(int id) {
	        return (Employee)sessionFactory.getCurrentSession().get(Employee.class, id);
	    }

		@Override
		public List<Employee> findEmployeeByName(String firstName, String secondName, String lastName) {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createSQLQuery("select * from Employee where firstname = :fname and secondname = :sname and lastname = :lname")
					.addEntity(Employee.class)
					.setString("fname", firstName)
					.setString("sname",secondName)
					.setString("lname", lastName);
			List list = query.list();
			return list;
		}

	    
}
