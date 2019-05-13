package filmsystem.Service;

import org.springframework.http.*;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service("httpClient")
public class HttpClient {
    public ArrayList<String> client(String url, HttpMethod method, MultiValueMap<String ,String> params){
        RestTemplate template = new RestTemplate();
        ResponseEntity<String> responseEntity = template.getForEntity(url, String.class);
        ArrayList<String> result = new ArrayList<>();
        System.out.println(responseEntity.getStatusCode());
        result.add(responseEntity.getStatusCode().toString());
        if(responseEntity.getStatusCode().toString().equals("200")){
            result.add(responseEntity.getBody());
        }
        return result;
    }
}
