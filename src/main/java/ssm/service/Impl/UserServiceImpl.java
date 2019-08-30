package ssm.service.Impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.web.multipart.MultipartFile;
import ssm.mapper.UserMapper;
import ssm.pojo.User;
import ssm.service.UserService;
import ssm.util.Security;


@Service
public class UserServiceImpl implements UserService {

	@Autowired
	//实现对User的数据库操作
	private UserMapper userMapper;

	private Security security = Security.getInstance();

	@Override
	public List<User> listUser() {
		// TODO Auto-generated method stub
		return userMapper.listUser();
	}

    @Override
    public int queryIsLockByEmail(String uEmail) {
        return userMapper.queryIsLockByEmail(uEmail);
    }

    @Override
    public int updateIsLock(Integer isLock, Integer uId) {
        return userMapper.updateIsLock(isLock,uId);
    }


    @Override
	//登录校验，根据uEmail获取加密后的密码，再判断用户密码是否符合.
	//再加上下面一个方法，合起来返回已登录用户
	public boolean isRightUser(String uEmail,String uPassword) {
		// TODO Auto-generated method stub
		String encodeuPassword = userMapper.queryUserPasswordByuEmail(uEmail);
		if(encodeuPassword != null && security.match(uPassword,encodeuPassword)) {
			return true;
		}
		return false;
	}
	@Override
	public User getUserByuEmail(String uEmail) {
		return userMapper.queryUserByuEmail(uEmail);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED,rollbackForClassName="Exception")
	//注册用户
	public User registUser(User user) {
		//判断邮箱是否被使用
		User isHasUser = userMapper.queryUserByuEmail(user.getuEmail());
		if(null != isHasUser ) {
			return null;
		}
		/*SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ");
		String time=sdf.format(new Date());*/
		//因为实体类的中的时间为util.date  而数据库存储的时sql.date,故需要转化
		//读取出来的是sql.date,是Util的子类，可以直接存入对象，不需要转化
		Date time=new Date(new java.util.Date().getTime());
		//保存原密码，并设置加密密码后往数据库新增用户
		String rawPassword = user.getuPassword();
		user.setuPassword(security.encrypt(rawPassword));
		user.setuRegistDate(time);
		int isSuccess = userMapper.createUser(user);
		//确定增加成功后，返回注册后的用户
		if(isSuccess == 1) {
			User newUser = userMapper.queryUserByuEmail(user.getuEmail());
			return newUser;
		}
		return null;
	}

	@Override
	//获取用户信息
	public User getUserById(int uId) {
		// TODO Auto-generated method stub
		User user = userMapper.queryUserById(uId);
		return user;
	}

	@Override
	//更新用户信息
	public User updateUserInfo(User user) {
		// TODO Auto-generated method stub
		int isSuccess = userMapper.updateUser(user);
		if(isSuccess == 1) {
			User afterUpadteUser = userMapper.queryUserById(user.getuId());
			return afterUpadteUser;
		}
		return null;
	}

	@Override
	//更新用户密码
	public int updateUserPassword(User user) {
		String rawPassword = user.getuPassword();
		user.setuPassword(security.encrypt(rawPassword));
		int isSuccess = userMapper.updateUserPassword(user);
		return isSuccess;
	}

	@Override
	public int deleteUser(Integer uId) {
		int result=userMapper.deleteUser(uId);
		return result;
	}


	@Override
	public int getUserAuthority(User user) {
		int authority = userMapper.queryUserAuthority(user);
		return authority;
	}

	@Override
	public int batchDelete(String[] ids) {
		return  userMapper.batchDelete(ids);
	}


	@Override
	public List<User> getUsersByKeyWords(String keywords) {
		return userMapper.queryUserByKeywords(keywords);
	}

	@Override
	public boolean updatePhoto(User user, String smPho) {
		int flag = userMapper.updatePhoto(user.getuId(),smPho);
		if(flag == 1) return true;
		else  return false;
	}

}
