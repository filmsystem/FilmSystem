package filmsystem.Service.Impi;

import filmsystem.DAO.FilmShowDAO;
import filmsystem.Model.FilmOffice;
import filmsystem.Model.FilmShow;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import filmsystem.Service.IFilmShowService;

import java.util.ArrayList;
import java.util.HashMap;

@Service("filmShowService")
public class FilmShowServiceImpl implements IFilmShowService {
    @Autowired
    FilmServiceImpl filmService;

    @Autowired
    FilmOfficeServiceImpl filmOfficeService;

    private FilmShowDAO filmShowDAO = new FilmShowDAO();
    public boolean createShow (FilmShow show){
        StringBuffer buffer = new StringBuffer();
        FilmOffice office = new FilmOfficeServiceImpl().findOfficeById(show.getOfficeId());
        int len = office.getRowNum() * office.getCol();
        for (int i = 0; i < len; i++) {
            buffer.append("0");
        }
        show.setSeat(buffer.toString());
        return filmShowDAO.insertShow(show);
    }

    public boolean updateShow(FilmShow show){
        return filmShowDAO.updateShow(show);
    }

    public boolean updateSeat(FilmShow show, int row, int col, int status){
        FilmOffice office = new FilmOfficeServiceImpl().findOfficeById(show.getOfficeId());
        int seatNum = (row - 1) * office.getCol() + (col - 1);
        if(status == 0){    // 取消订单
            StringBuilder buffer = new StringBuilder(show.getSeat());
            buffer.replace(seatNum, seatNum+1, "0");
            show.setSeat(buffer.toString());
            return updateShow(show);
        }
        else{               // 订票
            StringBuilder buffer = new StringBuilder(show.getSeat());
            if(buffer.substring(seatNum, seatNum+1).equals("0")){
                buffer.replace(seatNum, seatNum+1, "1");
                show.setSeat(buffer.toString());
                return updateShow(show);
            }
            else{
                return false;
            }
        }
    }

    public int getRemainSeatNum(int filmShowId){
        /**
         * 获取剩余座位数
         * @param： filmShowId
         * @return: count: 剩余座位数； -1：找不到
         */
        FilmShow show = findShowById(filmShowId);
        if(show != null){
            String seat = show.getSeat();
            int count = 0;
            for(int i = 0; i < seat.length(); i++){
                if(String.valueOf(seat.charAt(i)).equals("0"))
                    count++;
            }
            return count;
        }
        else{
            return -1;      // not found
        }
    }

    public boolean deleteShow(int id){
        return filmShowDAO.deleteShow(id);
    }

    public FilmShow findShowById(int id){
        return filmShowDAO.selectShowById(id);
    }

    public ArrayList<FilmShow> findShowByCinemaId(int cinemaId, boolean timeFlag){
        return filmShowDAO.selectShowByCinemaId(cinemaId, timeFlag ? "" : null);
    }

    public ArrayList<FilmShow> findShowByFilmId(int filmId, boolean timeFlag){
        return filmShowDAO.selectShowByFilmId(filmId, timeFlag ? "" : null);
    }

    @Override
    public ArrayList<FilmShow> findShowByCinemaAndFilmId(int cinemaId, int filmId, boolean timeFlag) {
        return filmShowDAO.selectShowByCinemaAndFilmId(cinemaId, filmId, timeFlag ? "" : null);
    }

    @Override
    public HashMap<String, Object> getRelatedInfo(FilmShow show) {
        if(show == null)
            return null;

        HashMap<String, Object> resultMap = filmOfficeService.getRelatedInfo(filmOfficeService.findOfficeById(show.getOfficeId()));
        resultMap.put("film", filmService.findFilmById(show.getFilmId()));
        resultMap.put("filmShow", show);
        return resultMap;
    }
}
