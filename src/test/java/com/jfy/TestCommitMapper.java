package com.jfy;

import com.jfy.domain.Commit;
import com.jfy.service.CommitService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class) // 使用junit4进行测试
@ContextConfiguration("classpath:spring_config.xml")
public class TestCommitMapper {
    @Autowired
    public CommitService commitService;

    @Test
    public void testAddCommit() {
        System.out.println("testAddCommit");
        Commit commit = new Commit();
        commit.setUserId(1);
        commit.setExhibitionId(2);
        commit.setCommitContent("User1-Exh2-test");
        commit.setRating(5);
        commit.setCommitTime(new Date());
        System.out.println(commitService.addCommit(commit));
    }

    @Test
    public void testGetAllCommit() {
        System.out.println("testGetAllCommit");
        List<Commit> list = commitService.getAllCommit();
        for (Commit commit : list) {
            System.out.println(commit);
        }
    }

    @Test
    public void testGetCommitByUserId() {
        System.out.println("testGetCommitByUserId");
        List<Commit> list = commitService.getCommitByUserId(3);
        for (Commit commit : list) {
            System.out.println(commit);
        }
    }

    @Test
    public void testUpdateCommitById(){
        System.out.println("testUpdateCommitById");
        Commit commit = new Commit();
        commit.setCommitId(4);
        commit.setCommitContent("5555555555555");
        commit.setRating(5);
        commit.setCommitTime(new Date());
        commitService.updateCommitById(commit);
    }

    @Test
    public void testGetCommitByExhibitionId(){
        System.out.println("testGetCommitByExhibitionId");
        List<Commit> list = commitService.getCommitByExhibitionId(2);
        for (Commit commit : list) {
            System.out.println(commit);
        }
    }

}
