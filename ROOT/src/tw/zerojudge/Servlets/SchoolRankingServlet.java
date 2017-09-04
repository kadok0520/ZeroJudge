package tw.zerojudge.Servlets;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import tw.jiangsir.Utils.Tools.StringTool;
import tw.zerojudge.DAOs.SchoolDAO;
import tw.zerojudge.Model.Ranking;
import tw.zerojudge.Objects.Parameter;

@WebServlet(urlPatterns = { "/SchoolRanking" })
public class SchoolRankingServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Ranking ranking = new Ranking();
		int PageNum = Parameter.parsePage(request.getParameter("page"));
		String querystring = StringTool.querystingMerge(request
				.getQueryString());
		request.setAttribute("querystring", querystring);
		request.setAttribute("pagenum", PageNum);
		request.setAttribute("SchoolRanking",
				new SchoolDAO().getRankingbySchool(PageNum));
		request.setAttribute("lastpage", ranking.getLastpage());
		request.getRequestDispatcher("SchoolRanking.jsp").forward(request,
				response);
	}
}
