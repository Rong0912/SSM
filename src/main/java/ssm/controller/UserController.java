package ssm.controller;


import java.io.File;
import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ssm.pojo.*;
import ssm.service.*;
import ssm.util.CaptchaUtil;
import ssm.util.Msg;
import ssm.util.StatusCode;
import ssm.util.UserRelation;

@Controller
@RequestMapping("")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private QuestionService questionService;
	@Autowired
	private AnswerService answerService;
	@Autowired
	private EssayService essayService;
	@Autowired
	private TopicService topicService;
	@Autowired
	private UserRelationService userRelationService;
	@Autowired
	private JsonService jsonService;



//此处使用rest风格的URL
	@RequestMapping("login")
	//跳转进入登录页面
	public ModelAndView tryLogin() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("loginMessage","请输入邮箱和密码！");
		mav.setViewName("login");
		return mav;
	}
    @RequestMapping("/delete")
    @ResponseBody
    public Msg deleteUserById(Integer id){
        int result=userService.deleteUser(id);
        if(result==1){
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }

    @RequestMapping("/edit")
    @ResponseBody
    public String isLock(Integer uId){
	    int isLock=userService.getUserById(uId).getIsLock();
	    if(isLock==1){
	        userService.updateIsLock(0,uId);
	        return "0";  //封号

        }
	    if(isLock==0) {
	        userService.updateIsLock(1,uId);
	        return "1";//解封

        }else {
	        return "-1";//操作失败

        }
    }

    //管理员批量删除
	@RequestMapping("/batchDelete")
	@ResponseBody
	public Msg batchDelete(String ids){
		System.out.println(ids);
		String[] list=ids.split(",");
        /*for(int i=0;i<list.length;i++){
            userService.deleteUserById(Integer.parseInt(list[i]));
        }*/

		if (userService.batchDelete(list)>0) {
			return Msg.success();
		} else {
			return Msg.fail();
		}

	}
	//关键字查询
	/*@RequestMapping("searchUserMessage")*/

	//遍历所有的
	@RequestMapping("userManage")
    @ResponseBody
    public Msg listUsers(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
	    //引入pagehelper分页插件在分页查询之前只需调用，传入页码和每页的大小
        PageHelper.startPage(pn,4);
        List<User> users=userService.listUser();
        PageInfo page =new PageInfo(users,3);
        System.out.println("page   "+page);
        return Msg.success().add("pageInfo",page);

    }
	@RequestMapping("aboutUs")
	public String aboutUs(){
		return "aboutUs";
	}
	@RequestMapping("manage")
	public String manage(){
		return "/manage/userManage";
	}
	@RequestMapping("connectUs")
	public String connectUs(){
		return "connectUs";
	}

	//增加登录验证码功能
	@RequestMapping(value = "/captcha", method = RequestMethod.GET)
	public @ResponseBody void captcha(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		CaptchaUtil.outputCaptcha(request, response);
		String randomString = (String) request.getSession().getAttribute("randomString");
		System.out.println("randomString : " + randomString);
	}


	@RequestMapping(value = "userSetting/{uId}")
	//校验是否有权限设置当前用户的信息
	public ModelAndView userSetting(@PathVariable("uId") int uId, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User currentUser = (User) session.getAttribute("currentUser");
		if (null != currentUser) {
			if (uId == currentUser.getuId()) {
				mav.addObject("settingUser", currentUser);
				mav.setViewName("User/userSetting");
			} else {
				mav.addObject("wrongInfoMessage", "你似乎进入未知页面...");
				mav.setViewName("wrongInfo");
			}
		} else {
			mav.setViewName("User/login");
		}
		return mav;
	}

	@RequestMapping("user/{uId}")
	//进入用户个人信息
	public ModelAndView showUser(@PathVariable("uId") int uId,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//获取目标用户的信息
		User pointUser = userService.getUserById(uId);
		if(pointUser == null) {
			mav.addObject("wrongInfoMessage", "你似乎进入未知页面...");
			mav.setViewName("wrongInfo");
			return mav;
		} else {
			//此处为一次性查出所有记录，可拓展为一次查询最近多少条记录
			List<Question> pointUsersQuestion = questionService.getQuestionsByUserId(uId);
			List<Answer> pointUsersAnswer = answerService.getAnswersByUserId(uId);
			List<Essay> pointUserEssay = essayService.getEssayByUserId(uId);
			session.setAttribute("pointUser", pointUser);
			//mav.addObject("pointUser", pointUser);
			mav.addObject("pointUsersQuestion", pointUsersQuestion);
			mav.addObject("pointUsersAnswer", pointUsersAnswer);
			mav.addObject("pointUserEssay", pointUserEssay);
			mav.setViewName("User/showUser");
			return mav;
		}
	}

//用户相关API
	@RequestMapping(value = "api/userLogin", method = RequestMethod.POST ,produces = "application/json;charset=UTF-8" )
	//实现用户登录,用currentUser存储登录成功的用户信息，用loginMessage存储登录信息 VerificationCode
	public @ResponseBody
	String userLogin(@RequestParam("uEmail") String uEmail, @RequestParam("uPassword") String uPassword, HttpSession
			session) {

		boolean canLogin = userService.isRightUser(uEmail, uPassword);
		String rs ;
		/*被封号的情况*/


        if (canLogin ) {
            int isLock=userService.queryIsLockByEmail(uEmail);
            //System.out.println(isLock);
            if (isLock == 1) {
                User currentUser = userService.getUserByuEmail(uEmail);
                session.setAttribute("currentUser", currentUser);
                rs = jsonService.toJsonString(currentUser, StatusCode.CODE_SUCCESS, StatusCode.REASON_SUCCESS);
            } else {
                //System.out.println("lock");

                rs = jsonService.toJsonString(null, StatusCode.CODE_LOCK, StatusCode.REASON_FAILURE);
            }
        }else {
            rs = jsonService.toJsonString(null, StatusCode.CODE_FAILURE, StatusCode.REASON_FAILURE);

    }
		return rs;	//返回JSON字符串，包含登录的结果信息
	}


	@RequestMapping(value = "api/userLogout", method = RequestMethod.POST , produces = "application/json;charset=UTF-8")
	//实现用户退出登录
	public @ResponseBody
	String userLogout(HttpSession session) {
		String rs;
		if (session.getAttribute("currentUser") != null) {
			session.removeAttribute("currentUser");
			rs = jsonService.toJsonString(null,StatusCode.CODE_SUCCESS,StatusCode.REASON_SUCCESS);
		} else {
			rs = jsonService.toJsonString(null,StatusCode.CODE_FAILURE,StatusCode.REASON_FAILURE);
		}
		return rs;
	}

	@RequestMapping(value = "api/user", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	//实现用户注册功能
	public @ResponseBody
	String userRegister(User user, HttpSession session) {
		User newUser = userService.registUser(user);
		String rs;
		if (newUser != null) {
			session.setAttribute("currentUser", newUser);
			rs = jsonService.toJsonString(newUser,StatusCode.CODE_SUCCESS,StatusCode.REASON_SUCCESS);
		} else {
			rs = jsonService.toJsonString(null,StatusCode.CODE_FAILURE,StatusCode.REASON_FAILURE);
		}
		return rs;
	}

	@RequestMapping(value = "api/isLogin", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	//是否登录
	public @ResponseBody
	String isLogin(HttpSession session) {
		//获取目标用户的信息
		User user = (User) session.getAttribute("currentUser");
		String rs;
		if (user != null) {
			rs = jsonService.toJsonString(user,StatusCode.CODE_SUCCESS,StatusCode.REASON_SUCCESS);
		} else {
			rs = jsonService.toJsonString(null,StatusCode.CODE_FAILURE,StatusCode.REASON_FAILURE);
		}
		return rs;
	}


	@RequestMapping(value = "api/userSetting", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	//实现用户信息的更新
	public @ResponseBody String updateUserSetting(User user, HttpSession session) {
		//System.out.println(user);
		User currentUser = (User) session.getAttribute("currentUser");
		String rs;
		if (currentUser != null && user.getuId() == currentUser.getuId()) {

			User afterUpadteUser = userService.updateUserInfo(user);
			System.out.println(afterUpadteUser);
			if (afterUpadteUser != null) {
				session.setAttribute("currentUser", afterUpadteUser);
				rs = jsonService.toJsonString(afterUpadteUser,StatusCode.CODE_SUCCESS,StatusCode.REASON_SUCCESS);
				return rs;
			}
		}
		rs = jsonService.toJsonString(null,StatusCode.CODE_FAILURE,StatusCode.REASON_FAILURE);
		return rs;
	}

	@RequestMapping(value = "api/userPwd",method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	//实现用户密码修改
	public @ResponseBody String updateUserSecurity(User user, @RequestParam("uNewPassword1") String uNewPassword1, HttpSession
			session) {
		User currentUser = (User) session.getAttribute("currentUser");
		String rs;
		if( currentUser != null && user != null && user.getuId() == currentUser.getuId()
				&& user.getuEmail().equals(currentUser.getuEmail())) {
			//校验是否为当前用户
			boolean canRightLogin = userService.isRightUser(currentUser.getuEmail(),user.getuPassword());
			if(canRightLogin) {
				user.setuPassword(uNewPassword1);
				int isSuccess = userService.updateUserPassword(user);
				if(isSuccess == 1) {
					rs = jsonService.toJsonString(null,StatusCode.CODE_SUCCESS,StatusCode.REASON_SUCCESS);
					return rs;
				}
			}
		}
		rs = jsonService.toJsonString(null,StatusCode.CODE_FAILURE,StatusCode.REASON_FAILURE);
		return rs;
	}

	@RequestMapping(value = "UserRelation/{pointUserId}",method = RequestMethod.POST)
	//用户关注功能，前端使用Ajax发出Post请求，进入此方法。方法最后返回一个关系值给前台。
	public @ResponseBody
	byte setUserRelation(@PathVariable("pointUserId")int pointUserId, HttpSession session) {
		User currentUser = (User) session.getAttribute("currentUser");
		if(currentUser == null) {
			return UserRelation.RELATION_UNLOAD;	//-5
		} else if(currentUser.getuId()==pointUserId) {
			return UserRelation.RELATION_ISSELF;	//-1
		} else {
			int fromUserId = currentUser.getuId();
			byte userRelationType = userRelationService.getRelationType(fromUserId,pointUserId);
			boolean flag;
			if(userRelationType == UserRelation.RELATION_NONE) {	//web.xml文件判断如果未发生关系返回-10
				flag = userRelationService.follow(fromUserId, pointUserId);
				if(flag) return UserRelation.RELATION_FOLLOW;
				else return UserRelation.RELATION_NONE;
			} else if(userRelationType == UserRelation.RELATION_FOLLOW) {	//10
				flag = userRelationService.changeRelation(fromUserId, pointUserId,UserRelation.RELATION_UNFOLLOW);
				if(flag) return UserRelation.RELATION_UNFOLLOW;
				else return UserRelation.RELATION_FOLLOW;
			} else if(userRelationType == UserRelation.RELATION_UNFOLLOW) {	//00
				flag = userRelationService.changeRelation(fromUserId, pointUserId,UserRelation.RELATION_FOLLOW);
				if(flag) return UserRelation.RELATION_FOLLOW;
				else return UserRelation.RELATION_UNFOLLOW;
			}
			return UserRelation.RELATION_NONE;
		}
	}

	@RequestMapping(value = "UserRelation/{pointUserId}" ,method = RequestMethod.GET)
	//@Pathvariable传的是路径上的值，@RequestParam传的是data数据里的值
	//打开个人信息页面后，Ajax自动发出GET请求，进入此方法。方法最后返回该用户的关注数、被关注数，以及和当前用户的关系值给前台。
	public @ResponseBody
	Map<String ,Integer> getUserRelation(@PathVariable("pointUserId")int pointUserId, HttpSession session) {

		User currentUser = (User) session.getAttribute("currentUser");
		int following = userRelationService.getFollowing(pointUserId,UserRelation.RELATION_FOLLOW);
		int followed = userRelationService.getFollowed(pointUserId,UserRelation.RELATION_FOLLOW);
		Map<String ,Integer> map = new HashMap<>();
		if(currentUser == null) {
			map.put("userRelationType",(int)UserRelation.RELATION_NONE);
			map.put("following",following);
			map.put("followed",followed);
			return map;
		} else {
			int fromUserId = currentUser.getuId();
			if(fromUserId == pointUserId) {
				map.put("userRelationType",(int)UserRelation.RELATION_ISSELF);
				map.put("following",following);
				map.put("followed",followed);
				return map;
			}
			byte userRelationType = userRelationService.getRelationType(fromUserId, pointUserId);
			map.put("userRelationType",(int)userRelationType);
			map.put("following",following);
			map.put("followed",followed);
			return map;
		}
	}

	@RequestMapping(value = "api/user/{pointUserId}/Following" ,method = RequestMethod.GET, produces =
			"application/json;charset=UTF-8")
	public @ResponseBody String getUserFollowing(@PathVariable("pointUserId")int pointUserId) {
		List<User> users = userRelationService.getFollowingUsers(pointUserId , UserRelation.RELATION_FOLLOW);
		String rs;
		if(users == null) {
			rs = jsonService.toJsonString(users,StatusCode.CODE_FAILURE,StatusCode.REASON_FAILURE);
		} else {
			rs = jsonService.toJsonString(users,StatusCode.CODE_SUCCESS,StatusCode.REASON_SUCCESS);
		}
		return rs;
	}

	@RequestMapping(value = "api/user/{pointUserId}/Followed" ,method = RequestMethod.GET, produces =
			"application/json;charset=UTF-8")
	public @ResponseBody String getUserFollowed(@PathVariable("pointUserId")int pointUserId) {
		List<User> users = userRelationService.getFollowedUsers(pointUserId , UserRelation.RELATION_FOLLOW);
		String rs;
		if(users == null) {
			rs = jsonService.toJsonString(users,StatusCode.CODE_FAILURE,StatusCode.REASON_FAILURE);
		} else {
			rs = jsonService.toJsonString(users,StatusCode.CODE_SUCCESS,StatusCode.REASON_SUCCESS);
		}
		return rs;
	}

	@RequestMapping("userOpt/{uId}")
	//显示用户动态
	public @ResponseBody
	Map<String, ? > showUserOpt(@PathVariable("uId") int uId) {
		Map<String, List<Question>> map = new LinkedHashMap<>();
		List<Question> pointUsersQuestion = questionService.getQuestionsByUserId(uId);
		map.put("pointUsersQuestion",pointUsersQuestion);
		return map;
	}

	//获取用户关注的话题的API
	@RequestMapping(value = "api/User/{uId}/FollowingTopics", method = RequestMethod.GET, produces =
			"application/json;" + "charset=UTF-8")
	public @ResponseBody String getTopicByuId(@PathVariable("uId")  int uId) {
		List<Topic> topics = topicService.getRelatedTopic(uId,UserRelation.RELATION_FOLLOW);
		String rs;
		if(topics == null) {
			rs = jsonService.toJsonString(null,StatusCode.CODE_FAILURE,StatusCode.REASON_FAILURE);
		} else {
			rs = jsonService.toJsonString(topics,StatusCode.CODE_SUCCESS, StatusCode.REASON_SUCCESS);
		}
		return rs;
	}
	//获取当前用户关注的话题
	@RequestMapping(value = "api/User/FollowingTopics", method = RequestMethod.GET, produces =
			"application/json;" + "charset=UTF-8")
	public @ResponseBody String getTopicBySession(HttpSession session) {
		User currentUser = (User)session.getAttribute("currentUser");
		String rs;
		if(currentUser == null) {
			rs = jsonService.toJsonString(null,StatusCode.CODE_FAILURE,StatusCode.REASON_FAILURE);
		} else {
			int uId = currentUser.getuId();
			List<Topic> topics = topicService.getRelatedTopic(uId, UserRelation.RELATION_FOLLOW);
			rs = jsonService.toJsonString(topics, StatusCode.CODE_SUCCESS, StatusCode.REASON_SUCCESS);
		}
		return rs;
	}


//上传图片API
	@RequestMapping("/changePhoto")
	public @ResponseBody Map<String,String> uploadAvatar(@RequestParam("avatarInput") MultipartFile filePhoto,HttpSession session,HttpServletRequest httpServletRequest) {
		Map<String,String> map = new HashMap<>(2);
		User user = (User) session.getAttribute("currentUser");
		if( user == null || filePhoto == null) {
			map.put("flag","FAILED");
			return map;
		}
		String filePath=session.getServletContext().getRealPath("/imgs/userPho/");
		//获取图片原始名称、及图片扩展名
		String originalFilename=filePhoto.getOriginalFilename();
		String types=originalFilename.substring(originalFilename.lastIndexOf(".")+1).toLowerCase();
		if(!types.equals("jpg")) {
			map.put("flag","FAILED");
			return map;
		}
		try {

			String newFileName=UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf("."));
			String endFileName = filePath+newFileName;
			File file=new File(endFileName);
			if(!file.exists()) {
				file.createNewFile();
			}
			//上传
			filePhoto.transferTo(file);

			userService.updatePhoto(user,newFileName);
			/*session.invalidate();
			HttpSession session1=httpServletRequest.getSession();*/
            User newUser=userService.getUserById(user.getuId());
            //    跟换了头像  得覆盖原先的currentUser对象和pointUser对象
            session.setAttribute("pointUser",newUser);

            session.setAttribute("currentUser",newUser);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}


}
