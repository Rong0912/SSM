package ssm.service;

import org.springframework.web.multipart.MultipartFile;
import ssm.pojo.User;

import java.util.List;
import java.util.Map;


public interface UserService {

	//用户登录
	boolean isRightUser(String uEmail, String uPassword);
	User getUserByuEmail(String uEmail);
	//注册用户
	User registUser(User user);
	//根据uId获取用户信息
	User getUserById(int uId);
	//更新用户信息
	User updateUserInfo(User user);
	//更新用户密码
	int updateUserPassword(User user);
	int deleteUser(Integer uId);
	//获取用户权限
	int getUserAuthority(User user);
	//批量删除
	int batchDelete(String[] ids);
	List<User> listUser();
    int queryIsLockByEmail(String uEmail);
    int updateIsLock(Integer isLock,Integer uId);
	//通过关键字查询用户
	List<User> getUsersByKeyWords(String keywords);

	boolean updatePhoto(User user, String smgPho);


}
