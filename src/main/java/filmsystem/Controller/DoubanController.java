package filmsystem.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import filmsystem.Service.Impi.DoubanServiceImpl;
import filmsystem.Service.Impi.FilmServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;

import filmsystem.Service.HttpClient;
import filmsystem.Model.Film;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/api")
public class DoubanController {
    @Autowired
    HttpClient httpClient;

    @Autowired
    DoubanServiceImpl doubanService;

    @Autowired
    FilmServiceImpl filmService;

    private ArrayList<String> getJSONString(String url){
        HttpMethod method = HttpMethod.GET;
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        return httpClient.client(url, method, params);
    }

//    @RequestMapping(value = "/doubanSearchByName", method = RequestMethod.GET)
//    public String searchFilmByName(@RequestParam("name") String name, Model model, HttpSession session){
//        try{
//            String url = "http://t.yushu.im/v2/movie/search?q=" + name + "&start=0";
//            ArrayList<String> result = getJSONString(url);
//            if(result.size() == 2){
//                HashMap<String, Integer> map = doubanService.getName_IDMap(result.get(1));
//                session.setAttribute("NameIdMap", map);
//                return "SUCCESS";
//            }
//            else if(result.get(0).equals("500")){
//                return "FAIL";
//            }
//            return "NETWORK_ERROR";
//        }
//        catch(Exception e){
//            e.printStackTrace();
//            return "NETWORK_ERROR";
//        }
//    }

    @RequestMapping(value = "/doubanSearchNew", method = RequestMethod.GET)
    public String searchNewFilm(@RequestParam(value = "filter", defaultValue = "") String filter,
                                Model model, HttpSession session){
        /**
         * @param: filter: 是否需要过滤器（过滤掉已在数据库中存在的电影信息）。默认有过滤器，如果不需要过滤，输入任意字符串即可。
         */
        try{
            String url = "https://douban.uieee.com/v2/movie/in_theaters&start=";
            HashMap<String, Integer> map = new HashMap<>();

            int count = 20;
            for(Integer i = 0; i < count; i+=20){
                ArrayList<String> result = getJSONString(url + i.toString());
                if(result.size() == 2){
                    count = doubanService.getTotal(result.get(1));
                    map.putAll(doubanService.getName_IDMap(result.get(1), filter.equals("") ? true : false));
                }
                else {
                    return "FAIL";
                }
            }
            session.setAttribute("NameIdMap", map);
            return "SUCCESS";
        }
        catch(Exception e){
            e.printStackTrace();
            return "NETWORK_ERROR";
        }
    }

    @RequestMapping(value = "/doubanSearchById/{id}", method = RequestMethod.GET)
    public String searchFilmById(@PathVariable Integer id, Model model, HttpSession session){
        try{
            Film film = searchFilmById(id);
            if(film != null){
                session.setAttribute("filmFound", film);
                return "SUCCESS";
            }
            return "FAIL";
        }
        catch(Exception e){
            e.printStackTrace();
            return "NETWORK_ERROR";
        }
    }

    @RequestMapping(value = "/film/{id}", method = RequestMethod.POST)
    public String addNewFilm(@PathVariable Integer id){
        try{
            Film film = searchFilmById(id);
            if(film != null){
                return filmService.insertFilm(film) ? "SUCCESS" : "FAIL";
            }
            return "FAIL";
        }
        catch(Exception e){
            e.printStackTrace();
            return "NETWORK_ERROR";
        }
    }

    public Film searchFilmById(int id) throws Exception{
            String url = "https://douban.uieee.com/v2/movie/subject/" + id;
            ArrayList<String> result = getJSONString(url);
            if(result.size() == 2){
                return doubanService.getOneFilm(result.get(1));
            }
            return null;
    }
}
