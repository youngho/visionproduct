package com.visionit.product.service;

/**
 * Created by yhkim on 2016. 9. 28..
 */
public class FunctionVo {
    private String id;
    private String name;
    private String depth;
    private String level;
    private String mnu_pos;
    private String func_desc;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDepth() {
        return depth;
    }

    public void setDepth(String depth) {
        this.depth = depth;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getMnu_pos() {
        return mnu_pos;
    }

    public void setMnu_pos(String mnu_pos) {
        this.mnu_pos = mnu_pos;
    }

    public String getFunc_desc() {
        return func_desc;
    }

    public void setFunc_desc(String func_desc) {
        this.func_desc = func_desc;
    }
}
