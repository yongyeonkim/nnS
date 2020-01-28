package nnS.shop.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import nnS.common.common.CommandMap;
import nnS.shop.service.ShopServiceImpl;

@Controller
public class ShopController {

	@Resource(name="shopService")
	private ShopServiceImpl shopService;
	
	@RequestMapping(value="/shop")
	public ModelAndView shopMain() throws Exception{
		ModelAndView mv = new ModelAndView("/shop/goods/goodsList");
		return mv;
	}
	
	@RequestMapping(value="/shop/selectGoodsList")
	public ModelAndView selectGoodsList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
    	
    	List<Map<String,Object>> list = shopService.selectGoodsList(commandMap.getMap());
    	mv.addObject("list", list);
        if(list.size() > 0){
            mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
        }
        else{
            mv.addObject("TOTAL", 0);
        }
    	
    	return mv;
	}
	
	@RequestMapping(value="/shop/allGoodsList")
	public ModelAndView shopAllGoodsList() throws Exception{
		ModelAndView mv = new ModelAndView("/shop/goods/goodsList");
		
		return mv;
	}
	
	@RequestMapping(value="/shop/likeGoodsList")
	public ModelAndView shopLikeGoodsList() throws Exception{
		ModelAndView mv = new ModelAndView("/shop/goods/goodsList");

		return mv;
	}
	
	@RequestMapping(value="/shop/newGoodsList")
	public ModelAndView shopNewGoodsList() throws Exception{
		ModelAndView mv = new ModelAndView("/shop/goods/goodsList");

		return mv;
	}
	
	@RequestMapping(value="/shop/goodsWriteForm")
	public ModelAndView goodsWriteForm() throws Exception{
		ModelAndView mv = new ModelAndView("/shop/goods/goodsWriteForm");

		return mv;
	}

	@RequestMapping(value="/shop/goodsWrite")
	public ModelAndView goodsWrite() throws Exception{
		ModelAndView mv = new ModelAndView("/shop/goods/goodsWriteResult");

		return mv;
	}

	@RequestMapping(value="/shop/goodsModifyForm")
	public ModelAndView goodsModifyForm() throws Exception{
		ModelAndView mv = new ModelAndView("/shop/goods/goodsWriteForm");

		return mv;
	}
	
	@RequestMapping(value="/shop/goodsModify")
	public ModelAndView goodsModify() throws Exception{
		ModelAndView mv = new ModelAndView("/shop/goods/goodsWriteResult");

		return mv;
	}
	
	@RequestMapping(value="/shop/goodsDelete")
	public ModelAndView goodsDelete() throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/shop/allgoodsList");

		return mv;
	}
	
	@RequestMapping(value="/shop/goodsDetail")
	public ModelAndView goodsDetail() throws Exception{
		ModelAndView mv = new ModelAndView("/shop/goods/goodsDetail");

		return mv;
	}
	
	@RequestMapping(value="/shop/goodsDetail/goodsLike")
	public ModelAndView goodsLike() throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/shop/goodsDetail");

		return mv;
	}
	
	@RequestMapping(value="/shop/goodsDetail/goodsUnlike")
	public ModelAndView goodsUnlike() throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/shop/goodsDetail");

		return mv;
	}
}
