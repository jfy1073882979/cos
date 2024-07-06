package com.jfy.service.impl;

import com.jfy.dao.ExhibitionMapper;
import com.jfy.domain.Exhibition;
import com.jfy.service.ExhibitionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class ExhibitionServiceImpl implements ExhibitionService {

    @Autowired
    public ExhibitionMapper exhibitionMapper;

    public List<Exhibition> getAllExhibition() {
        return exhibitionMapper.getAllExhibition();
    }

    @Override
    public Exhibition getExhibitionById(Integer exhibitionId) {
        return exhibitionMapper.getExhibitionById(exhibitionId);
    }

    @Override
    public Integer updateExhibitionRating(Integer exhibitionId, BigDecimal rating) {
        return exhibitionMapper.updateExhibitionRating(exhibitionId, rating);
    }

    @Override
    public List<Exhibition> searchExhibitions(String exhibitionName) {
        return exhibitionMapper.searchExhibitions(exhibitionName);
    }

    @Override
    public Integer addExhibition(Exhibition exhibition) {
        return exhibitionMapper.addExhibition(exhibition);
    }

    @Override
    public Integer deleteExhibitionById(Integer exhibitionId) {
        return exhibitionMapper.deleteExhibitionById(exhibitionId);
    }

    @Override
    public Integer updateExhibitionInfo(Exhibition exhibition) {
        return exhibitionMapper.updateExhibitionInfo(exhibition);
    }

    @Override
    public Integer updateExhibitionPic(Integer exhibitionId, String cover) {
        return exhibitionMapper.updateExhibitionPic(exhibitionId, cover);
    }
}
