package filmsystem.Service;

import java.util.HashMap;

public interface IStatisticsService {
    HashMap<String, Integer> countTimesByFilm(int userId);

    HashMap<String, Integer> countTimesByMonth(int userId);

    HashMap<String,Float> countTurnoverByDayInAWeek(int cinemaId);
}
