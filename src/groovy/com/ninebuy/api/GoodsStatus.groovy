package com.ninebuy.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.hibernate.cfg.annotations.ArrayBinder;

public enum GoodsStatus {

	UNUSED("UNUSED", "未处理"), SELLING("SELLING", "今日特价"), TOMORROW("TOMORROW",
	"明日预告"), SCHEDULED("SCHEDULED", "排期商品");

	private String value;
	private String description;

	GoodsStatus(String value, String description) {
		this.value = value;
		this.description = description;
	}

	public String getValue() {
		return value;
	}

	public String getDescription() {
		return description;
	}

}
