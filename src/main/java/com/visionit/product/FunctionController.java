package com.visionit.product;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.visionit.product.service.FunctionVo;


/**
 * Handles requests for the application home page.
 */
@Controller
public class FunctionController {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(FunctionController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/function", method = RequestMethod.GET)
	public String selectFunction(Model model) {

		List<FunctionVo> resultSet = sqlSession.selectList("userControlMapper.selectFunction", null);
		model.addAttribute("functionList", resultSet);
		logger.debug(resultSet.toString());
		return "function";
	}

	@RequestMapping(value = "/insertUpdateFunction", method = RequestMethod.POST)
	public ModelAndView insertUpdateFunction(@RequestParam HashMap<String, String> param, Model model) {

		sqlSession.insert("userControlMapper.insertUpdateFunction", param);

		return new ModelAndView("redirect:/function");
	}

	@RequestMapping(value = "/deleteFunction", method = RequestMethod.GET)
	public ModelAndView deleteFunction(@RequestParam HashMap<String, String> param, Model model) {

		sqlSession.delete("userControlMapper.deleteFunction", param);

		return new ModelAndView("redirect:/function");
	}


}
