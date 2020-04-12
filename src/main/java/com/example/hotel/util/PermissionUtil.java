package com.example.hotel.util;

import com.example.hotel.entity.Permission;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * 拼装菜单
 */
public class PermissionUtil {

    /**
     * 获取组装好的菜单
     * 以树的形式显示
     *
     * @param permissionsRoot permissionsRoot
     * @return List
     */
    public static List<Permission> getPermissionTree(List<Permission> permissionsRoot) {
        List<Permission> permissionsResult = new ArrayList<>();

        for (Permission permission : permissionsRoot) {
            if (permission.getPid() == 0) {
                permissionsResult.add(permission);
            }
        }

        for (Permission permission : permissionsResult) {
            permission.setChildPermissions(getChildTree(permission.getId(), permissionsRoot));
        }
        return permissionsResult;
    }

    /**
     * 获取菜单的子菜单
     *
     * @param id              菜单编号
     * @param permissionsRoot permissionsRoot
     * @return List
     */
    private static List<Permission> getChildTree(Long id, List<Permission> permissionsRoot) {
        List<Permission> permissionsChild = new ArrayList<>();
        for (Permission permission : permissionsRoot) {
            if (permission.getPid() != 0) {
                if (permission.getPid().equals(id)) {
                    permissionsChild.add(permission);
                }
            }
        }
        for (Permission permission : permissionsChild) {
            if (permission.getPid() != 0) {
                permission.setChildPermissions(getChildTree(permission.getId(), permissionsRoot));
            }
        }
        if (permissionsChild.size() == 0) {
            return null;
        }
        return permissionsChild;
    }

    /**
     * 获取组装好的菜单,
     *
     * @param permissionsRoot permissionsRoot
     * @return List
     */
    public static List<Permission> getPermissionList(List<Permission> permissionsRoot) {
        List<Permission> permissionsResult = new ArrayList<>();

        for (Permission permission : permissionsRoot) {
            if (permission.getPid() == 0) {
                permission.setLevel(1);
                permissionsResult.add(permission);
                permissionsResult.addAll(getChildList(permission, permissionsRoot));
            }
        }
        return permissionsResult;
    }

    /**
     * 获取菜单的子菜单
     *
     * @param parentPermission 菜单编号
     * @param permissionsRoot  permissionsRoot
     * @return List
     */
    private static List<Permission> getChildList(Permission parentPermission, List<Permission> permissionsRoot) {
        List<Permission> permissionsChild = new ArrayList<>();
        for (Permission permission : permissionsRoot) {
            if (permission.getPid() != 0) {
                if (permission.getPid().equals(parentPermission.getId())) {
                    permission.setLevel(parentPermission.getLevel() + 1);
                    permissionsChild.add(permission);
                    List<Permission> tempList = getChildList(permission, permissionsRoot);
                    tempList.sort((a, b) -> (int) (b.getSort() - a.getSort()));
                    permissionsChild.addAll(tempList);
                }
            }
        }
        if (permissionsChild.size() == 0) {
            return Collections.emptyList();
        }
        return permissionsChild;
    }

}
