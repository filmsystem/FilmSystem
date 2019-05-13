package filmsystem.Service;

public interface ILoginService {
    boolean checkAdministrator(String username, String password);

    boolean checkCinema(String username, String password);

    boolean checkCustomer(String username, String password);
}
