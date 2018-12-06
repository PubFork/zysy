package com.example.school.util;

import com.github.pagehelper.PageInfo;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

/**
 * @ClassName Json
 * @Description TODO : 前段视图返回统一json数据
 * @Author 
 * @Date 
 * @Version 1.0
 **/

@Data
public class Json {
    /**
     * TODO : 200 代表成功,500代表失败
     */
    private Integer code;
    /**
     * TODO : 返回的数据个数 (通常在分页中使用)
     */
    private long count;
    /**
     * TODO : 返回的数据
     */
    private Object data;
    /**
     * TODO : 返回的消息
     */
    private String msg;

    private Integer id;

    /**
     *
     * TODO: 分页方法,解析pageInfo完成分页
     * @param: [pageInfo]
     * @return:
     * @author: 
     * @version 1.0
     * @date: 
     */
    public Json(PageInfo pageInfo) {
        this.code = 200;
        this.count = pageInfo.getTotal();
        this.msg = this.count <= 0 ? "无数据" : "正常";
        this.data = pageInfo.getList();
    }
    public Json(List list){
        if(list==null || list.size()<1){
            this.code = 500;
        }else{
            this.code=200;
        }
        this.data=list;
    }

    public Json(long count) {
        this.count = count;
        if(count>0){
            this.code = 200;
            this.msg = "成功";
        }else {
            this.code = 500;
            this.msg = "失败";
        }
    }

    public Json(long count, Object data) {
        this.count = count;
        if(count>0){
            this.code = 200;
            this.msg = "成功";
        }else {
            this.code = 500;
            this.msg = "失败";
        }
        this.data = data;
    }

    public Json(Integer code, long count, Object data, String msg) {
        this.code = code;
        this.count = count;
        this.data = data;
        this.msg = msg;
    }

}
