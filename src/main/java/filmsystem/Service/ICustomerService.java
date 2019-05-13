package filmsystem.Service;

import filmsystem.Model.Customer;

public interface ICustomerService {
    public boolean insertCustomer(Customer customer);

    public boolean updateCustomer(Customer customer);

    public boolean deleteCustomer(int id);

    public Customer findCustomerById(int id);

    public Customer findCustomerByName(String name);

    public boolean checkCustomer(String username, String password);
}
