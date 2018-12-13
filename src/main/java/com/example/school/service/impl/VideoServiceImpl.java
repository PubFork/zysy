package com.example.school.service.impl;

import com.example.school.mapper.VideoMapper;
import com.example.school.pojo.Video;
import com.example.school.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ClassName VideoServiceImpl
 * @Description TODO
 * @Author zjw
 * @Date 2018/12/13 21:40
 * @Version 1.0
 **/
@Service
public class VideoServiceImpl implements VideoService {

    @Autowired
    private VideoMapper videoMapper;

    @Override
    public boolean insertVideo(Video video) {
        try {
            videoMapper.insertSelective(video);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
}
