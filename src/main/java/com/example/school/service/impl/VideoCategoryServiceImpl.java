package com.example.school.service.impl;

import com.example.school.mapper.VideoCategoryMapper;
import com.example.school.monitor.business.VideoCategoryService;
import com.example.school.pojo.VideoCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName VideoCategoryServiceImpl
 * @Version 1.0
 **/

@Service
public class VideoCategoryServiceImpl implements VideoCategoryService {

    @Autowired
    private VideoCategoryMapper videoCategoryMapper;

    @Override
    public List<VideoCategory> queryVideoCategoryByParentId(String name) {
        return videoCategoryMapper.queryVideoCategoryByParentId(name);
    }
}
