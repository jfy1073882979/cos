package com.jfy;

import com.jfy.domain.Exhibition;
import com.jfy.service.ExhibitionService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.math.BigDecimal;
import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class) // 使用junit4进行测试
@ContextConfiguration("classpath:spring_config.xml")
public class TestExhMapper {
    @Autowired
    public ExhibitionService exhibitionService;
    @Test
    public void testGetAllExhibition() {
        System.out.println("testGetAllExhibition");
        System.out.println(exhibitionService.getAllExhibition());
    }

    @Test
    public void testGetExhibitionById() {
        System.out.println("testGetExhibitionById");
        System.out.println(exhibitionService.getExhibitionById(1));
    }

    @Test
    public void testUpdateExhibitionRating() {
        System.out.println("testUpdateExhibitionRating");
        exhibitionService.updateExhibitionRating(1, BigDecimal.valueOf(5));
    }

    @Test
    public void testSearchExhibitions() {
        System.out.println("testSearchExhibitions");
        System.out.println(exhibitionService.searchExhibitions("展会"));
    }

    @Test
    public void testAddExhibition() {
        System.out.println("testAddExhibition");
        Exhibition exhibition= new Exhibition();
        exhibition.setExhibitionName("test");
        exhibition.setReleaseTime(new Date());
        exhibition.setContent("for test");
        exhibitionService.addExhibition(exhibition);

    }


}
