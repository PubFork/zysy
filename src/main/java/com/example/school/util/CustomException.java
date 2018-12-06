package com.example.school.util;

import lombok.*;

/**
 * @ClassName CustomException
 * @Description TODO 自定义异常
 * @Author 
 * @Date 
 * @Version 1.0
 **/

@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CustomException extends RuntimeException {

    private Integer code;
    private String message;

}
