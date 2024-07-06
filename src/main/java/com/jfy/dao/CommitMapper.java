package com.jfy.dao;

import com.jfy.domain.Commit;

import java.util.List;

public interface CommitMapper {
    public Integer addCommit(Commit commit);
    public List<Commit> getAllCommit();
    public List<Commit> getCommitByUserId(Integer userId);
    public Commit getCommitById(Integer commitId);

    public List<Commit> getCommitByExhibitionId(Integer exhibitionId);

    public Integer updateCommitById(Commit commit);
    public Integer deleteCommitById(Integer commitId);


}
