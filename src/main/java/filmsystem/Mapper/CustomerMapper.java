package filmsystem.Mapper;

import filmsystem.Model.Customer;
import java.util.ArrayList;

public interface CustomerMapper {
    int insertCustomer(Customer customer);
    int deleteCustomer(int id);
    Customer selectCustomerById(int id);
    Customer selectCustomerByName(String name);
    int updateCustomer(Customer customer);
}
