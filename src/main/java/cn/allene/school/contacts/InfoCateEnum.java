package cn.allene.school.contacts;

public enum InfoCateEnum {
    CATE_1_(-1, "温馨通知", 1),
    CATE_0(0, null, null),
    CATE_1(1, "网站首页", 0),
    CATE_2(2, "园所概况", 0),
    CATE_3(3, "园所动态", 0),
    CATE_4(4, "家园互动", 0),
    CATE_5(5, "教育科研", 0),
    CATE_6(6, "幼儿保健", 0),
    CATE_7(7, "招生招聘", 0),
    CATE_8(8, "留言板", 0),
    CATE_13(13, "园所新闻", 3),
    CATE_14(14, "园所新闻", 4),
    CATE_15(15, "科研教育", 5),
    CATE_17(17, "育儿教育", 6),
    CATE_22(22, "园所通知", 2)
    ;

    Integer id;
    String name;
    Integer firstId;

    InfoCateEnum(Integer id, String name, Integer firstId) {
        this.id = id;
        this.name = name;
        this.firstId = firstId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getFirstId(){
        return firstId;
    }
}
