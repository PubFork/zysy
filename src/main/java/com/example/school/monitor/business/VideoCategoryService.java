package com.example.school.monitor.business;

import com.example.school.pojo.VideoCategory;

import java.util.List;

/**
 * @ClassName VideoCategoryService
 * @Date 2018/12/23 0:09
 * @Version 1.0
 **/

public interface VideoCategoryService {

    public List<VideoCategory> queryVideoCategoryByParentId(String name);

}
