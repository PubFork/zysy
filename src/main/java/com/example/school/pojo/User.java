package com.example.school.pojo;

import java.sql.Timestamp;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
   private Integer userId;
   private Integer memberId;//会员Id
   private String userName;//用户登录名
   private String nickName;//用户昵称
   private String sex;
  @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
   private String birthday;
   private String headportrait;//用户头像
   private String userPassWord;
   private Integer userIsLockout;//用户是否锁定:默认不锁定0
   private Timestamp userUpdateTime;//用户信息最后一次被修改时间:数据库自己维护记录的修改时间',
   private Timestamp userCreateTime;//用户账号创建时间'
   private Timestamp userLastLoginTime;//用户上一次登录时间'
   private String userLastLoginIp;//用户上一次登录实际IP地址'
   private Integer userPassWrongCout;//用户输入密码错误次数(默认为0)'
   private Timestamp userLockoutTime;//用户输入密码错误次数达到上限锁定时间'
   private String userEmail;
   private String userTelephone;
   
   private String address;
   private String marry;
   private String gold;
   
		
}

