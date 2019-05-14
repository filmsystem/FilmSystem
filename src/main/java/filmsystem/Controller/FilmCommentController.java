package filmsystem.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import filmsystem.Model.FilmComment;
import filmsystem.Service.Impi.FilmCommentServiceImpl;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@RestController
@RequestMapping("/api")
public class FilmCommentController {
    //public static Logger log = LoggerFactory.getLogger(FilmOfficeController.class);
    @Autowired
    FilmCommentServiceImpl filmCommentService;

    @RequestMapping(value = "/filmcomment", method = RequestMethod.POST)
    public String insertFilmComment(@RequestParam("userId") Integer userId,
                                  @RequestParam("filmId") Integer filmId,
                                  @RequestParam("filmStar") Integer filmStar,
                                  @RequestParam("comment") String comment){
        // log.info("cinemaId = " + cinemaId + ", officeId = " + officeId + ", row = " + row + ", col = " + col);
        try{
            FilmComment Comment = new FilmComment();
            Comment.setUserId(userId);
            Comment.setFilmId(filmId);
            Comment.setFilmStar(filmStar);
            Comment.setComment(comment);
            return filmCommentService.insertComment(Comment) ? "SUCCESS" : "FAIL";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }

    @RequestMapping(value = "/filmcomment/{id}", method = RequestMethod.GET)
    public String getFilmComment(@PathVariable Integer id, Model model, HttpSession session){
        try{
            FilmComment comment = filmCommentService.findFilmCommentById(id);
            if(comment != null){
                session.setAttribute("filmCommentFound", comment);
                return "SUCCESS";
            }
            return "NOT_FOUND";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }

    @RequestMapping(value = "/filmcomment", method = RequestMethod.GET)
    public String getFilmComment(@RequestParam(value = "userId", defaultValue = "0") Integer userId,
                                 @RequestParam(value = "filmId", defaultValue = "0") Integer filmId,
                                 Model model, HttpSession session){
        try{
            ArrayList<FilmComment> list = null;
            if(userId != 0){
                list = filmCommentService.findFilmCommentByUserId(userId);
            }
            else if(filmId != 0){
                list = filmCommentService.findFilmCommentByFilmId(filmId);
            }
            session.setAttribute("filmCommentList", list);
            return "SUCCESS";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }
    }

    @RequestMapping(value = "/filmcomment", method = RequestMethod.PUT)
    public String updateFilmComment(@RequestParam("id") Integer id,
                                     @RequestParam("filmStar") Integer filmStar,
                                     @RequestParam("comment") String comment){
        try{
            FilmComment Comment = filmCommentService.findFilmCommentById(id);
            if(comment != null){
                Comment.setFilmStar(filmStar);
                Comment.setComment(comment);
                return filmCommentService.updateComment(Comment) ? "SUCCESS" : "FAIL";
            }
            return "NOT_FOUND";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }

    }

    @RequestMapping(value = "/filmcomment", method = RequestMethod.DELETE)
    public String deleteFilmComment(@RequestParam Integer id){
        try{
            return filmCommentService.deleteComment(id) ? "SUCCESS" : "NOT_FOUND";
        }
        catch(Exception e){
            e.printStackTrace();
            return "DB_ERROR";
        }

    }
}
