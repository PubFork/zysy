package com.example.school.pojo;

import lombok.Data;

@Data
public class VideoCategory {
    private Integer videoCategoryId;

    private String videoCategoryName;

    private Integer videoCategoryParentId;

    private String videoCategoryParentName;
}