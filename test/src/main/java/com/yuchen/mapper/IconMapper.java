package com.yuchen.mapper;/*
    @author yuchen
    @create -- 
*/

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

@Mapper
public interface IconMapper {
    void insertIcon(@Param("in") InputStream in,@Param("iconStatus") int iconStatus,@Param("industryId") int industryId);
    Object getIconStream(String id);

    void insertIcons(List<Map<String, Object>> list);

    int insertIconFile( @Param("industryId") String industryId, @Param("inputStream") InputStream inputStream, @Param("iconStatus") String iconStatus);

    List<Map<String, Object>> getAll();

    void testInsert(List<Map<String, Object>> list);

    Map<String, String>  select(String id);

    void insertIconDefaultPicFile(@Param("industryId") String industryId, @Param("inputStream") InputStream inputStream, @Param("i") int i);
}
