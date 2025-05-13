package com.example.controller;

import com.example.common.Result;
import com.example.entity.Admin;
import com.example.service.AdminService;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.ApiOperation;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Admin控制器类，负责处理与管理员相关的RESTful API请求
 */
@RestController
@RequestMapping("/admin")
public class AdminController {

    /**
     * 注入Admin服务类，用于处理管理员相关的业务逻辑
     */
    @Resource
    AdminService adminService;

    /**
     * 添加管理员
     * @param admin 前端传入的管理员对象，通过JSON格式传递
     * @return 返回结果对象，表示添加操作是否成功
     */
    @ApiOperation("添加管理员")
    @PostMapping("/add")
    public Result add(@RequestBody Admin admin) {  // @RequestBody 接收前端传来的 json参数
        adminService.add(admin);
        return Result.success();
    }

    /**
     * 更新管理员信息
     * @param admin 前端传入的管理员对象，通过JSON格式传递
     * @return 返回结果对象，表示更新操作是否成功
     */
    @ApiOperation("更新管理员信息")
    @PutMapping("/update")
    public Result update(@RequestBody Admin admin) {  // @RequestBody 接收前端传来的 json参数
        adminService.update(admin);
        return Result.success();
    }

    /**
     * 根据ID删除管理员
     * @param id 要删除的管理员的ID，通过URL路径参数传递
     * @return 返回结果对象，表示删除操作是否成功
     */
    @ApiOperation("根据ID删除管理员")
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {  // @PathVariable 接收前端传来的路径参数
        adminService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除管理员
     * @param list 前端传入的管理员对象列表，通过JSON数组格式传递
     * @return 返回结果对象，表示批量删除操作是否成功
     */
    @ApiOperation("批量删除管理员")
    @DeleteMapping("/deleteBatch")
    public Result deleteBatch(@RequestBody List<Admin> list) {  //  @RequestBody 接收前端传来的 json数组
        adminService.deleteBatch(list);
        return Result.success();
    }

    /**
     * 查询所有管理员
     * @return 返回结果对象，包含所有管理员信息的列表
     */
    @ApiOperation("查询所有管理员")
    @GetMapping("/selectAll")  //   完整的请求路径：http://ip:port/user/selectAll
    public Result selectAll() {
        List<Admin> adminList = adminService.selectAll();
        return Result.success(adminList);
    }

    /**
     * 分页查询管理员
     * @param pageNum 当前的页码，默认值为1
     * @param pageSize 每页的个数，默认值为10
     * @param admin 管理员对象，可以包含查询条件
     * @return 返回结果对象，包含分页查询结果的PageInfo对象
     */
    @ApiOperation("分页查询管理员")
    @GetMapping("/selectPage")
    public Result selectPage(@RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize,
                             Admin admin) {
        PageInfo<Admin> pageInfo = adminService.selectPage(pageNum, pageSize, admin);
        return Result.success(pageInfo);  // 返回的是分页的对象
    }

}
