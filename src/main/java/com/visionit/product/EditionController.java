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

import com.visionit.product.service.EditionVo;


/**
 * Handles requests for the application home page.
 */
@Controller
public class EditionController {
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(EditionController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/edition", method = RequestMethod.GET)
	public String selectEdition(Model model) {

		List<EditionVo> resultSet = sqlSession.selectList("userControlMapper.selectEdition", null);
		model.addAttribute("editionList", resultSet);

		logger.debug(resultSet.toString());
		return "edition";
	}

	@RequestMapping(value = "/insertUpdateEdition", method = RequestMethod.POST)
	public ModelAndView insertUpdateEdition(@RequestParam HashMap<String, String> param, Model model) {

		sqlSession.insert("userControlMapper.insertUpdateEdition", param);

		return new ModelAndView("redirect:/edition");
	}

	@RequestMapping(value = "/deleteEdition", method = RequestMethod.GET)
	public ModelAndView deleteEdition(@RequestParam HashMap<String, String> param, Model model) {

		sqlSession.delete("userControlMapper.deleteEdition", param);

		return new ModelAndView("redirect:/edition");
	}


}
