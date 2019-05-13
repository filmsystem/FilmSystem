package filmsystem.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import filmsystem.Service.Impi.DoubanServiceImpl;
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

    private ArrayList<String> getJSONString(String url){
        HttpMethod method = HttpMethod.GET;
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        return httpClient.client(url, method, params);
    }

    @RequestMapping(value = "/doubanSearchByName", method = RequestMethod.GET)
    public String searchFilmByName(@RequestParam("name") String name, Model model, HttpSession session){
        try{
            String url = "https://api.douban.com/v2/movie/search?q=" + name + "&start=0";
            ArrayList<String> result = getJSONString(url);
            if(result.size() == 2){
                HashMap<String, Integer> map = doubanService.getName_IDMap(result.get(1));
                session.setAttribute("NameIdMap", map);
                return "SUCCESS";
            }
            else if(result.get(0).equals("500")){
                return "FAIL";
            }
            return "NETWORK_ERROR";
        }
        catch(Exception e){
            e.printStackTrace();
            return "NETWORK_ERROR";
        }
    }

    @RequestMapping(value = "/doubanSearchById/{id}", method = RequestMethod.GET)
    public String searchFilmById(@PathVariable Integer id, Model model, HttpSession session){
        try{
            String url = "https://api.douban.com/v2/movie/subject/" + id;
            ArrayList<String> result = getJSONString(url);
            if(result.size() == 2){
                Film film = doubanService.getOneFilm(result.get(1));
                session.setAttribute("filmSearch", film);
                return "SUCCESS";
            }
            else if(result.get(0).equals("500")){
                return "FAIL";
            }
            return "NETWORK_ERROR";
        }
        catch(Exception e){
            e.printStackTrace();
            return "NETWORK_ERROR";
        }
    }
}
