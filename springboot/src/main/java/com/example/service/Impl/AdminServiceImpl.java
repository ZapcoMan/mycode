package com.example.service.Impl;

import cn.hutool.core.util.StrUtil;
import com.example.entity.Account;
import com.example.entity.Admin;
import com.example.exception.CustomerException;
import com.example.mapper.AdminMapper;
import com.example.service.AdminService;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import cn.hutool.crypto.digest.DigestUtil;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Resource AdminMapper adminMapper;
    // 日志对象，用于记录系统日志
    private static final Log log = LogFactory.getLog(AdminServiceImpl.class);
    public void add(Admin admin) {
        // 根据新的账号查询数据库  是否存在同样账号的数据
        Admin dbAdmin = adminMapper.selectByUsername(admin.getUsername());
        if (dbAdmin != null) {
            throw new CustomerException("账号重复");
        }
        // 默认密码
        if (StrUtil.isBlank(admin.getPassword())) {
            admin.setPassword("123456");
        }
        admin.setRole("ADMIN");
        adminMapper.insert(admin);
    }

    public void update(Admin admin) {
        adminMapper.updateById(admin);
    }

    public void deleteById(Integer id) {
        adminMapper.deleteById(id);
    }

    public void deleteBatch(List<Admin> list) {
        for (Admin admin : list) {
            this.deleteById(admin.getId());
        }
    }

    public Admin selectById(String id) {
        return adminMapper.selectById(id);
    }

    public List<Admin> selectAll() {
        return adminMapper.selectAll(null);
    }

    public PageInfo<Admin> selectPage(Integer pageNum, Integer pageSize, Admin admin) {
        // 开启分页查询
        PageHelper.startPage(pageNum, pageSize);
        List<Admin> list = adminMapper.selectAll(admin);
        return PageInfo.of(list);
    }

    /**
     * 管理员登录方法
     *
     * @param account 包含用户名和密码的账户信息
     * @return 登录成功的管理员对象
     * @throws CustomerException 如果账号不存在或密码错误，则抛出此异常
     */
    public Admin login(Account account) {
        // 验证账号是否存在
        Admin dbAdmin = adminMapper.selectByUsername(account.getUsername());
        if (dbAdmin == null) {
            throw new CustomerException("账号不存在");
        }

        // 获取输入的密码和数据库中的密码
        String InputPassWord = account.getPassword();
        String dbAdminPassword = dbAdmin.getPassword();

        // 生成输入密码的摘要
        String inputHash = DigestUtil.md5Hex(InputPassWord);
        // 验证密码是否匹配
        boolean isValid = dbAdminPassword.equals(inputHash);
        log.info("密码验证"+isValid+"一致");

        // 如果密码不正确，抛出异常
        if (!isValid) {
            throw new CustomerException("账号或密码错误");
        }

        // 创建token并返回给前端
        String token = TokenUtils.createToken(dbAdmin.getId() + "-" + "ADMIN", dbAdmin.getPassword());
        dbAdmin.setToken(token);

        // 返回登录成功的管理员对象
        return dbAdmin;
    }

    /**
     * 更新用户密码
     * 此方法首先检查用户输入的新密码和确认密码是否一致，然后验证当前输入的原密码是否正确，
     * 最后在验证通过后更新数据库中的密码信息
     *
     * @param account 包含用户输入的原密码、新密码和确认密码的账户对象
     * @throws CustomerException 如果新密码和确认密码不一致，或者原密码错误，抛出自定义异常
     */
    public void updatePassword(Account account) {
        //判断新密码和旧密码是否相等
        if(!account.getNewpassword().equals(account.getNew2password())){
            throw  new CustomerException("500","你两次输入的密码不一致");
        }
        //判断原密码是否正确
        Account currentUser = TokenUtils.getCurrentUser();
        if(!account.getPassword().equals(currentUser.getPassword())){
            throw new CustomerException("500", "原密码输入错误");
        }
        //开始更新密码
        //MD5 加密
        account.setNewpassword(DigestUtil.md5Hex(account.getNewpassword()));
        Admin admin = adminMapper.selectById(currentUser.getId().toString());
        admin.setPassword(account.getNewpassword());
        adminMapper.updateById(admin);
    }


}