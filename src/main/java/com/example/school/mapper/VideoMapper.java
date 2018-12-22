package com.example.school.mapper;

import com.example.school.pojo.Video;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface VideoMapper {

    int deleteByPrimaryKey(Integer videoId);

    int insert(Video record);

    int insertSelective(Video record);

    Video selectByPrimaryKey(Integer videoId);

    int updateByPrimaryKeySelective(Video record);

    int updateByPrimaryKey(Video record);

    /**
     * TODO : 根据视频分类名称查询视频,根据日期倒序排列
     *
     * @param name  分类名称
     * @param limit 查几条
     * @return [ LIST(VIDEO) ]
     * @author admin
     */
    public List<Video> queryVideoByCatAndLimitOrderByDateDesc(@Param("name") String name, @Param("limit") Integer limit);

    /**
     * TODO : 根据视频分类名称查询视频,根据播放次数排序
     *
     * @param name  分类名称
     * @param limit 查几条
     * @return [ LIST(VIDEO) ]
     * @author admin
     */
    public List<Video> queryVideoByCatAndLimitOrderByPlaySumDesc(@Param("name") String name, @Param("limit") Integer limit);

    public int selectCount();
}