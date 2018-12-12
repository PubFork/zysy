package com.example.school.pojo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Role {
    private Integer roleId;

    private String roleName;

    private Integer userId;

    private String mark;

  
}