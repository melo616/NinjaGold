package com.codingdojo.ninjagold.controllers;

import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NinjagoldController {
//	initializes hashtable to store each click
	static ArrayList<String> activityList = new ArrayList<String>();
	@GetMapping("/")
	public String index(
			HttpSession session,
			Model model
			) {
		if(session.getAttribute("count")==null) {
			session.setAttribute("count", 0);
		}
		model.addAttribute("activityList", activityList);
		return "index.jsp";
	}
	
	@PostMapping("/process")
	public String process(
			@RequestParam(value="choice") String choice,
			@RequestParam(value="min") Integer min,
			@RequestParam(value="max") Integer max,
			HttpSession session
			) {
		session.setAttribute("choice", choice);
//		generates random number of coins between min and max
		Random random = new Random();
		Integer coins = min + random.nextInt(max - min + 1);
//		if user clicked quest, randomly determines if coins are lost or gained
		if (choice.equals("quest")) {
			System.out.println("Quest chosen");
			Integer posNeg = random.nextInt(2);
			System.out.println(posNeg);
			if (posNeg==1) {
				coins = 0-coins;
			}			
		}
		System.out.println(coins);
//		adds coins to the total gold count
		Integer tempCount = (Integer) session.getAttribute("count");
		session.setAttribute("count", tempCount+coins);
		String activityString = "";
		if (choice.equals("quest")) {
			if (coins >= 0) {
				activityString = "You attempted a " + choice + " and found " + coins + " gold.";
			} else {
				activityString = "You attempted a " + choice + " and lost " + Math.abs(coins) + " gold.";
			}
		} else {
			activityString = "You entered a " + choice + " and found " + coins + " gold.";
		}
		activityList.add(activityString);
		return "redirect:/";
	}
}
