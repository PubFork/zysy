package com.example.school.monitor.business.index;

import com.example.school.pojo.Video;

import java.util.List;

public interface InitIndexBusiness {

    /**
     * @param name  分类名称
     * @param limit 查几条
     * @return
     */
    public List<Video> queryVideoByCatAndLimitOrderByDateDesc( String name , Integer limit );

    /**
     *
     * @param name  分类名称
     * @param limit 查几条
     * @return
     */
    public List<Video> queryVideoByCatAndLimitOrderByPlaySumDesc( String name , Integer limit );

}
