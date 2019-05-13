package filmsystem.Service.Impi;

import filmsystem.Model.Film;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Service;
import filmsystem.Service.IDoubanService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Service("doubanService")
public class DoubanServiceImpl implements IDoubanService {

    public HashMap<String,Integer> getName_IDMap(String JSONString){
        /**
         * @param: json string
         * @return: map with filmId and film name.
         */
        HashMap<String,Integer> resultMap = new HashMap<String,Integer>();
        Map<String,Object> jsonMap = (Map) JSONObject.parse(JSONString);
        String data = jsonMap.get("subjects").toString();
        JSONArray resultArray = JSON.parseArray(data);
        for (int i= 0; i < resultArray.size(); i++ ){
            Map<String,Object> filmMap = (Map) JSONObject.parse(resultArray.get(i).toString());
            System.out.println(filmMap.get("title") + " " + filmMap.get("id"));
            resultMap.put((String)filmMap.get("title"), Integer.parseInt((String)filmMap.get("id")));
        }
        return resultMap;
    }


    public ArrayList<Film> FilmArray(String JSONString){
        /** TODO
         * @param: json string
         * @return: film array
         */
        ArrayList<Film> list = new ArrayList<>();
        Map<String,Object> jsonMap = (Map) JSONObject.parse(JSONString);
        String data = jsonMap.get("subjects").toString();
        JSONArray resultArray = JSON.parseArray(data);
        for (int i= 0; i < resultArray.size(); i++ ){
            Map<String,Object> filmMap = (Map) JSONObject.parse(resultArray.get(i).toString());
            System.out.println(filmMap.get("title") + " " + filmMap.get("id"));
            //resultMap.put((String)filmMap.get("title"), Integer.parseInt((String)filmMap.get("id")));
            Film film = new Film();
            film.setId(Integer.parseInt((String)filmMap.get("id")));
            film.setName((String)filmMap.get("title"));

        }
        return list;
    }

    public Film getOneFilm(String JSONString){
        /** TODO
         * @param: json string
         * @return: film array
         */
        Film film = new Film();
        Map<String,Object> jsonMap = (Map) JSONObject.parse(JSONString);
        String data = jsonMap.get("subjects").toString();
        JSONArray resultArray = JSON.parseArray(data);

        return film;
    }

    private ArrayList<String> getNames(JSONArray array){
        ArrayList<String> result = new ArrayList<>();
        for (int i= 0; i < array.size(); i++ ){
            Map<String,Object> nameMap = (Map) JSONObject.parse(result.get(i).toString());
            result.add((String) nameMap.get("name"));
        }
        return result;
    }
}
