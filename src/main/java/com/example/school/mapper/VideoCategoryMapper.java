package com.example.school.mapper;

import com.example.school.pojo.VideoCategory;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface VideoCategoryMapper {
    int deleteByPrimaryKey(Integer videocategoryId);

    int insert(VideoCategory record);

    int insertSelective(VideoCategory record);

    VideoCategory selectByPrimaryKey(Integer videocategoryId);

    int updateByPrimaryKeySelective(VideoCategory record);

    int updateByPrimaryKey(VideoCategory record);

    List<VideoCategory> queryVideoCategoryByParentId( @Param("name") String name);
}