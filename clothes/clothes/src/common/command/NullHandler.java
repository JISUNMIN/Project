package common.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NullHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, Exception {
		response.sendError(HttpServletResponse.SC_NOT_FOUND); //없는 URL(404 Not found)
		return null;
	}

}
