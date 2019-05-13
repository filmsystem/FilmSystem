package filmsystem.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import filmsystem.Model.FilmComment;
import filmsystem.Service.Impi.FilmCommentServiceImpl;

import javax.servlet.http.HttpSession;

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

    @RequestMapping(value = "/filmcomment", method = RequestMethod.GET)
    public String getFilmComment(@RequestParam Integer id, Model model, HttpSession session){
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
