package com.example.school.mapper;

import com.example.school.pojo.VideoCategory;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface VideoCategoryMapper {
    int deleteByPrimaryKey(Integer videocategoryId);

    int insert(VideoCategory record);

    int insertSelective(VideoCategory record);

    VideoCategory selectByPrimaryKey(Integer videocategoryId);

    int updateByPrimaryKeySelective(VideoCategory record);

    int updateByPrimaryKey(VideoCategory record);

}