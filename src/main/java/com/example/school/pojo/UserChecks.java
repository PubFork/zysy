package com.example.school.pojo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserChecks {
	 private Integer checId;
	 private Integer userId;
	 private String userName;
	 private Timestamp checkInTime;
	 private String checkState;

}
