package com.jfy.controller;

import com.jfy.domain.Commit;
import com.jfy.domain.Exhibition;
import com.jfy.service.CommitService;
import com.jfy.service.ExhibitionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/exh")
public class ExhController {
    @Autowired
    public ExhibitionService exhibitionService;
    @Autowired
    public CommitService commitService;

    @RequestMapping("/getExhibitionById")
    public String getExhibitionById(Integer exhibitionId, HttpSession session) {
        Exhibition exhibition= exhibitionService.getExhibitionById(exhibitionId);
        session.setAttribute("exhibition", exhibition);
        return "exhibition";
    }

    @RequestMapping("/getExhibitionRating")
    public BigDecimal getExhibitionRating(@RequestParam int exhibitionId) {
        List<Commit> commitList= commitService.getCommitByExhibitionId(exhibitionId);
        BigDecimal rating= new BigDecimal(0);
        for (Commit commit: commitList) {
            rating= rating.add(BigDecimal.valueOf(commit.getRating()));
        }
        if (!commitList.isEmpty()) {
            rating= rating.divide(BigDecimal.valueOf(commitList.size()), 1, BigDecimal.ROUND_HALF_UP);
        }
        exhibitionService.updateExhibitionRating(exhibitionId, rating);
        //System.out.println("rating: "+ rating);

        return rating;
    }

    @RequestMapping("/searchExhibitions")
    @ResponseBody
    public List<Exhibition> searchExhibitions(@RequestParam("exhibitionName") String exhibitionName) {
        List<Exhibition> exhibitions = exhibitionService.searchExhibitions(exhibitionName);
        //System.out.println(exhibitions);
        return exhibitions;
    }

    @RequestMapping("/getAllExhibition")
    public String getAllExhibition(HttpSession session) {
        List<Exhibition> exhibitionList = exhibitionService.getAllExhibition();
        session.setAttribute("exhibitionList", exhibitionList);
        return "exhibitionList";
    }


}
