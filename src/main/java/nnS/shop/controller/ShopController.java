package nnS.shop.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import nnS.common.common.CommandMap;
import nnS.shop.service.ShopServiceImpl;

@Controller
public class ShopController{

	@Resource(name="shopService")
	private ShopServiceImpl shopService;
	
	@RequestMapping(value="/shop")
	public ModelAndView shopMain(@RequestParam(value = "keyword", defaultValue="") String keyword, @RequestParam(value="searchType", defaultValue="") String searchType, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("goodsList");
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		return mv;
	}
	
	@RequestMapping(value="/shop/selectGoodsList")
	public ModelAndView selectGoodsList(CommandMap commandMap, @RequestParam(value = "keyword", defaultValue="") String keyword, @RequestParam(value="searchType", defaultValue="") String searchType, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		System.out.println("검색어: " + keyword);
		System.out.println("검색타입: " + searchType);
    	List<Map<String,Object>> list = shopService.selectGoodsList(commandMap.getMap(), keyword, searchType);
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
	public ModelAndView goodsWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/shop/goods/goodsWriteForm");
		mv.addObject("request_type", "write");
		return mv;
	}

	@RequestMapping(value="/shop/goodsWrite", method = RequestMethod.POST)
	public ModelAndView goodsWrite(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/shop/goods/goodsWriteResult");

		shopService.insertGoods(commandMap.getMap(), request);
		
		return mv;
	}
	
	@RequestMapping(value="/shop/goodsModifyForm")
	public ModelAndView goodsModifyForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/shop/goods/goodsWriteForm");

		Map<String,Object> map = shopService.selectGoodsDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		mv.addObject("request_type", "modify");
		/* mv.addObject("list",map.get("list")); */
		
		return mv;
	}
	
	@RequestMapping(value="/shop/goodsModify")
	public ModelAndView goodsModify(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/shop/goods/goodsWriteResult");

		shopService.updateGoods(commandMap.getMap(), request);
		mv.addObject("IDX", commandMap.get("IDX"));
		
		return mv;
	}
	
	@RequestMapping(value="/shop/goodsDelete")
	public ModelAndView goodsDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/shop");
		
		shopService.deleteGoods(commandMap.getMap());
		
		return mv;
	}
	
	// 상품 상세보기
	@RequestMapping(value="/shop/goodsDetail")
	public ModelAndView goodsDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/shop/goods/goodsDetail"); 
		
		Map<String,Object> map = shopService.selectGoodsDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		/* mv.addObject("list",map.get("list")); */
		
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
