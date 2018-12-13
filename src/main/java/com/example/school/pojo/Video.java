package com.example.school.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class Video {

    private Integer videoId;

    private String videoName;

    private String videoInfo;

    private Integer userId;

    private Date videoUpTime;

    private Integer videoCategoryId;

    private Integer playSum;

    private Integer commentSum;

    private Integer collectSum;

    private Integer supportSum;

    private Integer opposeSum;

    private Integer state;

    private Integer weight;

    private Integer price;

    private String videoPicture;


}