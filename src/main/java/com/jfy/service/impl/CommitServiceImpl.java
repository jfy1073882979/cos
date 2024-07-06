package com.jfy.service.impl;

import com.jfy.dao.CommitMapper;
import com.jfy.domain.Commit;
import com.jfy.service.CommitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommitServiceImpl implements CommitService {
    @Autowired
    public CommitMapper commitMapper;
    @Override
    public Integer addCommit(Commit commit) {
        return commitMapper.addCommit(commit);
    }

    @Override
    public List<Commit> getAllCommit() {
        return commitMapper.getAllCommit();
    }

    @Override
    public List<Commit> getCommitByUserId(Integer userId) {
        return commitMapper.getCommitByUserId(userId);
    }

    @Override
    public List<Commit> getCommitByExhibitionId(Integer exhibitionId) {
        return commitMapper.getCommitByExhibitionId(exhibitionId);
    }
    @Override
    public Commit getCommitById(Integer commitId) {
        return commitMapper.getCommitById(commitId);
    }

    @Override
    public Integer updateCommitById(Commit commit) {
        return commitMapper.updateCommitById(commit);
    }

    @Override
    public Integer deleteCommitById(Integer commitId) {
        return commitMapper.deleteCommitById(commitId);
    }
}
