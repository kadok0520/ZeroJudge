package tw.zerojudge.Servlets.Utils;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tw.jiangsir.Utils.Exceptions.AccessException;
import tw.jiangsir.Utils.Exceptions.DataException;
import tw.jiangsir.Utils.Exceptions.InfoException;
import tw.jiangsir.Utils.Exceptions.RoleException;
import tw.jiangsir.Utils.Interfaces.IAccessFilter;
import tw.jiangsir.Utils.Scopes.ApplicationScope;
import tw.zerojudge.Configs.AppConfig;
import tw.zerojudge.DAOs.UserDAO;
import tw.zerojudge.DAOs.UserService;
import tw.zerojudge.Tables.User;
import tw.zerojudge.Utils.Mailer;

@WebServlet(urlPatterns = {"/ForgetPassword"})
public class ForgetPasswordServlet extends HttpServlet implements IAccessFilter {

	@Override
	public void AccessFilter(HttpServletRequest request) throws AccessException {
		AppConfig appConfig = ApplicationScope.getAppConfig();
		if (!appConfig.getEnableMailer()) {
			throw new RoleException("郵件功能未開啟！");
		}
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("ForgetPassword.jsp").forward(request, response);
	}

	private String randomPassword() {
		final String code = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		StringBuffer passwd = new StringBuffer(10);
		for (int i = 0; i < 8; i++) {
			passwd.append(code.charAt((int) (Math.random() * code.length())));
		}
		return passwd.toString();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDAO userDao = new UserDAO();
		User user = new UserService().getUserByAccount(request.getParameter("account"));
		if (user != null && user.getEmail().equals(request.getParameter("email"))) {
			String newpasswd = randomPassword();
			String text = "您位於[" + ApplicationScope.getAppConfig().getTitle() + "] 的帳號: " + user.getAccount()
					+ "\n您的新密碼：" + newpasswd;
			try {
				Mailer mailer = new Mailer(user, "密碼查詢結果回報！", text);
				mailer.GmailSender();
			} catch (MessagingException e) {
				throw new DataException("很抱歉，郵件因某些原因無法寄送。" + e.getLocalizedMessage());
			}
			user.setPasswd(newpasswd, newpasswd);
			new UserService().update(user);
			userDao.updatePasswd(user);
			throw new InfoException("寄送程序完成，請即前往收信！");
		} else {
			throw new DataException("您所填寫的資料並不符合原先的註冊資料，請再次嘗試。");
		}
	}

}
