package com.visionit.product;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.visionit.product.service.FunctionVo;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}


//	@RequestMapping(value = "/test", method = RequestMethod.GET)
//	public String test(Locale locale, Model model) {
//		return "test";
//	}
//
//	@RequestMapping(value = "/cal1", method = RequestMethod.GET)
//	public ModelAndView home2(Locale locale, ModelMap model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		// Î©îÏãúÏß? Î™®Îç∏?óê Ï∂îÍ?.
//		String sMessage = "?ä§?îÑÎß?+?ïÑ?ù¥Î∞îÌã∞?ä§ Ï≤´Îßå?Ç®. I Love Spring Framework!";
//		model.addAttribute("sMessage", sMessage);
//
//		// ?Ç†Ïß? Î∂?Î∂? Ï∂úÎ†• Î∞? Î™®Îç∏?óê Ï∂îÍ?
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		String formattedDate = dateFormat.format(date);
//		model.addAttribute("serverTime", formattedDate);
//
//		// mybatisÎ•? ?ôú?ö© dbÏ°∞Ìöå Î™®Îç∏?óê Ï∂îÍ?
//		HashMap<String, String> executeQuery = new HashMap<String, String>();
//		executeQuery.put("name", "shin");
//		List<HashMap<String, String>> resultSet = sqlSession.selectList("userControlMapper.selectMoneyOneMonth", executeQuery);
//		model.addAttribute("resultSet", resultSet);
//
//		System.out.print(model.toString());
//		ModelAndView mav = new ModelAndView("mon");
//
//		// view?óê Î™®Îç∏ ?ÑòÍ≤? ?ÑòÍ≤?
//		mav.addAllObjects(model);
//
//		// ModelAndView mav = new ModelAndView("home", "model", model);
//		return mav;
//	}

	@RequestMapping(value = "/input", method = RequestMethod.GET)
	public ModelAndView inputForm(@ModelAttribute("FunctionVo") FunctionVo vo, Model model) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("input");
		return mav;
	}

	@RequestMapping(value = "/input", method = RequestMethod.POST)
	public ModelAndView handle(@ModelAttribute FunctionVo vo, Model model) throws Exception {

		try {
			sqlSession.insert("insertMoney", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView("redirect:/retrieveEdition");
	}

	@RequestMapping(value = "/cal", method = RequestMethod.GET)
	public ModelAndView carendar(Locale locale, ModelMap model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		// Î©îÏãúÏß? Î™®Îç∏?óê Ï∂îÍ?.
		String sMessage = "?ä§?îÑÎß?+?ïÑ?ù¥Î∞îÌã∞?ä§ Ï≤´Îßå?Ç®. I Love Spring Framework!";
		model.addAttribute("sMessage", sMessage);

		// ?Ç†Ïß? Î∂?Î∂? Ï∂úÎ†• Î∞? Î™®Îç∏?óê Ï∂îÍ?
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);

		// mybatisÎ•? ?ôú?ö© dbÏ°∞Ìöå Î™®Îç∏?óê Ï∂îÍ?
		HashMap<String, String> executeQuery = new HashMap<String, String>();
		executeQuery.put("name", "shin");

		List<HashMap<String, String>> rs = sqlSession.selectList("userControlMapper.retrieveFunction", executeQuery);
		model.addAttribute("rs", rs);

		ModelAndView mav = new ModelAndView("retrieveEdition");

		// view?óê Î™®Îç∏ ?ÑòÍ≤? ?ÑòÍ≤?
		mav.addAllObjects(model);

		// ModelAndView mav = new ModelAndView("home", "model", model);
		return mav;
	}

}
