package com.example.school.monitor.business;

import com.example.school.pojo.Video;

import java.util.List;

public interface InitIndexBusiness {

    /**
     * TODO : 根据视频分类名称查询视频,根据日期倒序排列
     * @param name  分类名称
     * @param limit 查几条
     * @return [ LIST(VIDEO) ]
     * @author admin
     */
    public List<Video> queryVideoByCatAndLimitOrderByDateAsc( String name , Integer limit );

    /**
     * TODO : 根据视频分类名称查询视频,根据播放次数倒序排序
     * @param name  分类名称
     * @param limit 查几条
     * @return [ LIST(VIDEO) ]
     * @author admin
     */
    public List<Video> queryVideoByCatAndLimitOrderByPlaySumDesc( String name , Integer limit );

}
