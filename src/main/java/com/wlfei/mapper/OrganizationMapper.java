package com.wlfei.mapper;

import com.wlfei.pojo.Organization;
import com.wlfei.pojo.OrganizationExample;
import java.util.List;

public interface OrganizationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Organization record);

    int insertSelective(Organization record);

    List<Organization> selectByExample(OrganizationExample example);
    List<Organization> fuzzySelectByKeyword(String keyword);

    Organization selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Organization record);

    int updateByPrimaryKey(Organization record);
}