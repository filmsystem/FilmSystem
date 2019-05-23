package filmsystem.Service;

import java.util.HashMap;

public interface IStatisticsService {
    HashMap<String, Integer> customerFilmStatistics(int userId);

}
