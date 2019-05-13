package filmsystem.Service.Impi;

import filmsystem.Model.Customer;
import org.springframework.stereotype.Service;
import filmsystem.Service.ICustomerService;

@Service("customerService")
public class CustomerServiceImpl implements ICustomerService{
    public boolean insertCustomer(Customer customer) {
        // add to database
        return true;
    }

    public boolean updateCustomer(Customer customer) {
        // add to database
        return true;
    }

    public boolean deleteCustomer(int id) {
        //delete in database
        return true;
    }

    public Customer findCustomerById(int id) {
        // find in database
        return null;
    }

    public Customer findCustomerByName(String name) {
        // find in database
        return null;
    }

    public boolean checkCustomer(String username, String password) {
        // check
        Customer customer = findCustomerByName(username);
        if (customer != null) {
            if (password.equals(customer.getPassword())) {
                return true;
            } else {   // password error
                return false;
            }
        } else {   // customer not found
            return false;
        }
    }
}
