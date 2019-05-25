package filmsystem.Service.Impi;

import filmsystem.Model.Film;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import filmsystem.Tools.ListToString;
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


//    public ArrayList<Film> FilmArray(String JSONString){
//        /**
//         * @param: json string
//         * @return: film array
//         */
//        ArrayList<Film> list = new ArrayList<>();
//        Map<String,Object> jsonMap = (Map) JSONObject.parse(JSONString);
//        String data = jsonMap.get("subjects").toString();
//        JSONArray resultArray = JSON.parseArray(data);
//        for (int i= 0; i < resultArray.size(); i++ ){
//            Map<String,Object> filmMap = (Map) JSONObject.parse(resultArray.get(i).toString());
//            System.out.println(filmMap.get("title") + " " + filmMap.get("id"));
//            //resultMap.put((String)filmMap.get("title"), Integer.parseInt((String)filmMap.get("id")));
//            Film film = new Film();
//            film.setId(Integer.parseInt((String)filmMap.get("id")));
//            film.setName((String)filmMap.get("title"));
//        }
//        return list;
//    }

    public Film getOneFilm(String JSONString){
        /**
         * @param: json string
         * @return: film object
         */
        Film film = new Film();
        Map<String,Object> jsonMap = (Map) JSONObject.parse(JSONString);

        film.setId(Integer.parseInt((String)jsonMap.get("id")));
        film.setName((String)jsonMap.get("title"));
        film.setYear(Integer.parseInt((String)jsonMap.get("year")));
        film.setSummary((String)jsonMap.get("summary"));

        // set image
        Map<String,Object> imgMap = (Map) JSONObject.parse(jsonMap.get("images").toString());
        film.setImg((String)imgMap.get("large"));

        // set casts
        JSONArray castsArray = JSON.parseArray(jsonMap.get("casts").toString());
        film.setCasts(ListToString.listToString(getAttributeList(castsArray, "name"), ", "));

        // set directors
        JSONArray directorsArray = JSON.parseArray(jsonMap.get("directors").toString());
        film.setDirectors(ListToString.listToString(getAttributeList(directorsArray, "name"), ", "));

        // set countries
        JSONArray countriesArray = JSON.parseArray(jsonMap.get("countries").toString());
        film.setCountries(ListToString.listToString(countriesArray, ", "));

        // set type
        JSONArray genresArray = JSON.parseArray(jsonMap.get("genres").toString());
        film.setType(ListToString.listToString(genresArray, ", "));
        return film;
    }

    private ArrayList<String> getAttributeList(JSONArray array, String attribute){
        ArrayList<String> result = new ArrayList<>();
        for (int i= 0; i < array.size(); i++ ){
            Map<String,Object> nameMap = (Map) JSONObject.parse(array.get(i).toString());
            result.add((String) nameMap.get(attribute));
        }
        return result;
    }
}
