package com.example.school.util;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @ClassName LayuiEdit
 * @Description TODO
 * @Author 
 * @Date 
 * @Version 1.0
 **/

@NoArgsConstructor
@Data
public class LayuiEdit {


    /**
     * code : 0
     * msg :
     * data : {"src":"图片路径","title":"图片名称"}
     */

    private int code;
    private String msg;
    private ImgMsg data;

    @NoArgsConstructor
    @Data
    public static class ImgMsg {
        /**
         * src : 图片路径
         * title : 图片名称
         */

        private String src;
        private String title;
    }
}
