package com.example.controller;

import com.example.common.Result;
import com.example.entity.User;
import com.example.service.UserService;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 用户控制器类，处理与用户相关的RESTful API请求
 */
@RestController
@RequestMapping("/user")
public class UserController {

    /**
     * 注入用户服务层接口，用于执行用户相关的业务逻辑
     */
    @Resource
    UserService userService;

    /**
     * 添加新用户
     *
     * @param user 待添加的用户对象，通过请求体接收
     * @return 返回添加操作的结果
     */
    @PostMapping("/add")
    public Result add(@RequestBody User user) {
        userService.add(user);
        return Result.success();
    }

    /**
     * 更新用户信息
     *
     * @param user 待更新的用户对象，通过请求体接收
     * @return 返回更新操作的结果
     */
    @PutMapping("/update")
    public Result update(@RequestBody User user) {
        userService.update(user);
        return Result.success();
    }

    /**
     * 根据用户ID删除用户
     *
     * @param id 用户ID，通过URL参数接收
     * @return 返回删除操作的结果
     */
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        userService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除用户
     *
     * @param list 待删除的用户列表，通过请求体接收
     * @return 返回批量删除操作的结果
     */
    @DeleteMapping("/deleteBatch")
    public Result deleteBatch(@RequestBody List<User> list) {
        userService.deleteBatch(list);
        return Result.success();
    }

    /**
     * 查询所有用户信息
     *
     * @return 返回所有用户信息列表
     */
    @GetMapping("/selectAll")
    public Result selectAll() {
        List<User> userList = userService.selectAll();
        return Result.success(userList);
    }

    /**
     * 分页查询用户信息
     *
     * @param pageNum 页码，默认值为1
     * @param pageSize 每页记录数，默认值为10
     * @param user 用户对象，用于模糊查询
     * @return 返回分页查询结果，包含用户信息
     */
    @GetMapping("/selectPage")
    public Result selectPage(@RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize,
                             User user) {
        PageInfo<User> pageInfo = userService.selectPage(pageNum, pageSize, user);
        return Result.success(pageInfo);  // 返回的是分页的对象
    }

}
