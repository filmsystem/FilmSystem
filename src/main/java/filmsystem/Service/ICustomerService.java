package filmsystem.Service;

import filmsystem.Model.Customer;

public interface ICustomerService {
    boolean insertCustomer(Customer customer);

    boolean updateCustomer(Customer customer);

    boolean deleteCustomer(int id);

    Customer findCustomerById(int id);

    Customer findCustomerByName(String name);
}
