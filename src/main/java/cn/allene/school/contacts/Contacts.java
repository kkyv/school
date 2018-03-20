package cn.allene.school.contacts;

public interface Contacts {
    interface InfoCateCatacts{
        Integer CATE_0 = 0;
        Integer CATE_1 = 1;
        Integer CATE_2 = 2;
        Integer CATE_3 = 3;
        Integer CATE_4 = 4;
        Integer CATE_5 = 5;
        Integer CATE_6 = 6;
        Integer CATE_7 = 7;
        Integer CATE_8 = 8;

    }

    interface Session{
        String ADMIN = "adminLogin";
        String CHILD = "childLogin";
    }

    interface Admin{
        Integer Frozen = 0;
        Integer Active = 1;
    }
}
