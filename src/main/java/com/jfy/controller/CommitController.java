package com.jfy.controller;

import com.jfy.domain.Commit;
import com.jfy.domain.Exhibition;
import com.jfy.domain.User;
import com.jfy.service.CommitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/commit")
public class CommitController {
    @Autowired
    public CommitService commitService;

    @RequestMapping("/addCommit")
    public String addCommit(@RequestParam("comment") String comment,
                            @RequestParam("rating") Integer rating,
                            HttpSession session) {

        Exhibition exhibition= (Exhibition) session.getAttribute("exhibition");
        User user = (User) session.getAttribute("user");
        Integer userId = user.getUserId();
        Integer exhibitionId = exhibition.getExhibitionId();

        Commit commit = new Commit();
        commit.setExhibitionId(exhibitionId);
        commit.setUserId(userId);
        commit.setCommitContent(comment);
        commit.setRating(rating);
        commit.setCommitTime(new Date());

        commitService.addCommit(commit);

        return "exhibition";
    }

    @RequestMapping("/getCommitByUserId")
    public String getCommitByUserId(@RequestParam("id") Integer userId, HttpSession session) {
        System.out.println("getCommitByUserId");
        List<Commit> list = commitService.getCommitByUserId(userId);
        System.out.println(userId);
        System.out.println(list);
        session.setAttribute("commits", list);
        return "commitList";
    }

    @RequestMapping("/jumpToEditCommit")
    public String jumpToEditCommit(@RequestParam("commitId") Integer commitId, HttpSession session) {
        System.out.println("jumpToEditCommit");
        Commit commit = commitService.getCommitById(commitId);
        System.out.println(commit);
        session.setAttribute("commit", commit);
        return "editCommit";
    }

    @RequestMapping("/updateCommitById")
    public String updateCommitById(
                                   @RequestParam("commit") String comment,
                                   @RequestParam("rating") Integer rating,
                                   HttpSession session) {
        System.out.println("updateCommitById");
        Commit commit = (Commit) session.getAttribute("commit");
        commit.setCommitContent(comment);
        commit.setRating(rating);
        commit.setCommitTime(new Date());


        commitService.updateCommitById(commit);
        return "redirect:/commit/getCommitByUserId?id=" + commit.getUserId();
    }

    @RequestMapping("/deleteCommitById")    
    public String deleteCommitById(@RequestParam("commitId") Integer commitId, HttpSession session) {
        Commit commit = commitService.getCommitById(commitId);
        commitService.deleteCommitById(commitId);

        return "redirect:/commit/getCommitByUserId?id=" + commit.getUserId();
    }


}
