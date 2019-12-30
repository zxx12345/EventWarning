package com.eventwarning.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eventwarning.bean.DynamicPoint;
import com.eventwarning.bean.Event;
import com.eventwarning.bean.EventDynamic;
import com.eventwarning.bean.FoodFsn;
import com.eventwarning.bean.FoodKms;
import com.eventwarning.bean.FoodLims;
import com.eventwarning.bean.KeyWord;
import com.eventwarning.bean.WarningData;
import com.eventwarning.dbImpl.DBOperation;
import com.github.abel533.echarts.axis.ValueAxis;
import com.github.abel533.echarts.code.AxisType;
import com.github.abel533.echarts.code.PointerType;
import com.github.abel533.echarts.code.Position;
import com.github.abel533.echarts.code.SeriesType;
import com.github.abel533.echarts.code.Trigger;
import com.github.abel533.echarts.json.GsonOption;
import com.github.abel533.echarts.series.Bar;
import com.github.abel533.echarts.series.Line;
import com.github.abel533.echarts.series.Pie;
import com.github.abel533.echarts.style.ItemStyle;

public class EventServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public EventServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	@Override
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int eventid = Integer.parseInt(request.getParameter("eid"));
		Event e = DBOperation.GetEvent(eventid);
		WarningData wd = new WarningData();
		List<KeyWord> keywords = e.getKeyWordList();
		List<EventDynamic> edlist = DBOperation.GetEventDyanmicList(eventid, 100);

		GsonOption keywordbar = KeyWordListOption(e.getKeyWordList());

		GsonOption hotline = HotLineOption(Event.GetHotPoints(edlist));
		GsonOption sentimentpie = SentimentPieOption(edlist);
		GsonOption warningbar = WarningOption(wd, edlist.get(edlist.size()-1));
		GsonOption testdatabar = TestDataOption(keywords);
		
		request.setAttribute("eid", eventid);
		request.setAttribute("event", e);
		
		request.setAttribute("keywordbar", keywordbar.toString());
		request.setAttribute("hotline", hotline.toString());
		request.setAttribute("sentimentpie", sentimentpie.toString());
		request.setAttribute("warningbar", warningbar.toString());
		request.setAttribute("testdatabar", testdatabar.toString());
		request.setAttribute("warningd", wd.getWarnD(edlist.get(edlist.size()-1)));
		

		
		ServletContext servletContext = getServletContext();
		RequestDispatcher dispather = servletContext.getRequestDispatcher("/eventdetail.jsp");
		dispather.forward(request, response);
	}
	
	public GsonOption WarningOption(WarningData wd, EventDynamic ed){
		GsonOption option = new GsonOption();
		option.title().text("����ָ��").subtext("�¼�����ָ����ϵ����");
		option.tooltip().trigger(Trigger.axis);
		option.legend().data().add("ָ��ǿ��");
		option.calculable(true);
		ValueAxis xAxis = new ValueAxis();
		xAxis.type(AxisType.value).boundaryGap(0.00, 0.01);
		xAxis.axisLabel().formatter("{value} %");
		option.xAxis(xAxis);
		ValueAxis yAxis = new ValueAxis();
		yAxis.type(AxisType.category);
		yAxis.data("�¼��ȶ�","���ָ��","����ǿ��","���ۻ��");
		option.yAxis(yAxis);
		
		Bar bar = new Bar();
		bar.data(wd.getHotD(ed), wd.getSentimentD(ed), wd.getStrongD(ed), wd.getActiveD(ed));
		ItemStyle istyle = new ItemStyle();
		istyle.normal().lineStyle().width(1);
		bar.itemStyle(istyle);
		option.series(bar);
		return option;
	}
	public GsonOption KeyWordListOption(List<KeyWord> words){
		GsonOption option = new GsonOption();
		option.title().text("�ؼ���").subtext("�¼���عؼ����ἰ����");
		option.tooltip().trigger(Trigger.item).formatter("{b}: {c}");
		option.calculable(false);
		
		Bar bar = new Bar();
		bar.name("����ͼ").type(SeriesType.bar);
		ItemStyle istyle = new ItemStyle();
		istyle.normal().label().show(true).formatter("{b}");
		istyle.normal().borderWidth(1);
		istyle.emphasis().label().show(true);
		bar.itemStyle(istyle);
		for(int i=0;i<words.size(); i++)
			bar.data().add(MapSeriesData(words.get(i).keyword, words.get(i).sumcount));
		option.series(bar);
		return option;
	}
	public GsonOption KeyWordOption(List<KeyWord> words){
		GsonOption option = new GsonOption();
		option.title().text("�ؼ������").subtext("�¼���عؼ��ʴ�Ƶ�Ƚ�");
		option.tooltip().trigger(Trigger.item).formatter("{a} <br/>{b} : {c} ({d}%)");
		option.legend().data().add("��Ƶ");
		
		ValueAxis xAxis = new ValueAxis();
	    xAxis.type(AxisType.category).splitLine().show(false);
	    for(int i=0;i<words.size(); i++)
	    	xAxis.data().add(words.get(i).keyword);
	    option.xAxis(xAxis);

	    ValueAxis yAxis = new ValueAxis();
	    yAxis.type(AxisType.value);
	    option.yAxis(yAxis);
	    


	    
	    Bar bar = new Bar();
	    bar.name("�ἰ����").type(SeriesType.bar);
	    for(int i=0;i<words.size(); i++)
	    	bar.data().add(words.get(i).count);
	    ItemStyle istyle = new ItemStyle();
	    istyle.normal().label().show(true).position(Position.inside);
	    bar.itemStyle(istyle);
	    option.series(bar);
	    
	    return option;
	}
	public GsonOption HotLineOption(List<DynamicPoint> pts){
		GsonOption option = new GsonOption();
		option.title().text("�¼��ȶȱ仯����").subtext("�ȶ�ֵ��̬����");
		option.tooltip().trigger(Trigger.axis).axisPointer().type(PointerType.shadow);
		option.legend().data().add("�ȶ�ֵ");
		
		option.calculable(true);
		
	    ValueAxis xAxis = new ValueAxis();
	    xAxis.type(AxisType.category);
	    for(int i=0;i<pts.size(); i++)
	    	xAxis.data().add(pts.get(i).time);
	    option.xAxis(xAxis);

	    ValueAxis yAxis = new ValueAxis();
	    yAxis.type(AxisType.value);
	    option.yAxis(yAxis);

	    Line bar = new Line();
	    bar.name("�ȶ�").type(SeriesType.line);
	    for(int i=0;i<pts.size(); i++)
	    	bar.data().add(pts.get(i).value);
	    option.series(bar);
	    return option;
	}
	private GsonOption TestDataOption(List<KeyWord> keywords) {
	    List<FoodFsn> fsnList = DBOperation.GetFoodFsn(keywords,0,0);
	    List<FoodKms> kmsList = DBOperation.GetFoodKms(keywords,0,0);
	    List<FoodLims> limsList = DBOperation.GetFoodLims(keywords,0,0);
	    GsonOption option = new GsonOption();
		option.title().text("��������").subtext("��ά����������Ա�");
		option.tooltip().trigger(Trigger.axis);
		option.legend().data().add("������");
		option.calculable(true);
		ValueAxis xAxis = new ValueAxis();
		xAxis.type(AxisType.value).boundaryGap(0.00, 0.01);
		xAxis.axisLabel().formatter("{value} %");
		option.xAxis(xAxis);
		ValueAxis yAxis = new ValueAxis();
		yAxis.type(AxisType.category);
		yAxis.data("�������","��������","Ʒ������");
		option.yAxis(yAxis);
		
		Bar bar = new Bar();
		bar.data(fsnList.size(), kmsList.size(), limsList.size());
		ItemStyle istyle = new ItemStyle();
		istyle.normal().lineStyle().width(1);
		bar.itemStyle(istyle);
		option.series(bar);
		return option;
	}
	public GsonOption SentimentPieOption(List<EventDynamic> eds){
		GsonOption option = new GsonOption(), option1 = new GsonOption();
		int num = eds.size();
		EventDynamic ed1 = eds.get(num/4), ed2=eds.get(num/3), ed3=eds.get(num/2), ed4=eds.get(num*2/3), ed5=eds.get(num-1);
		
		option.timeline().data().add(ed1.updateTime);
		option.timeline().data().add(ed2.updateTime);
		option.timeline().data().add(ed3.updateTime);
		option.timeline().data().add(ed4.updateTime);
		option.timeline().data().add(ed5.updateTime);
		option.timeline().autoPlay(true);
		option.timeline().playInterval(1000);
		
		option1.title().text("����̬�Ʊ仯����").subtext("�¼������û���зֲ��仯����");
		option1.tooltip().trigger(Trigger.item).formatter("{a} <br/>{b} : {c} ({d}%)");
		option1.legend().data("�������","����̬��","��������");

		Pie p = new Pie();
		p.name("̬�Ʒֲ�").type(SeriesType.pie).center("50%","45%").radius("50%");
		p.data().add(ed1.postiveNum);
		p.data().add(ed1.neutralNum);
		p.data().add(ed1.negativeNum);
		option1.series(p);
		
		option.options().add(option1);
		option.options().add(GetOptionSentiment(ed2));
		option.options().add(GetOptionSentiment(ed3));
		option.options().add(GetOptionSentiment(ed4));
		option.options().add(GetOptionSentiment(ed5));

	    return option;
	}
	public GsonOption GetOptionSentiment(EventDynamic ed){
		GsonOption option = new GsonOption();
		option.series(DynamicPieData(ed));
		return option;
	}
	public Pie DynamicPieData(EventDynamic ed){
		Pie p = new Pie();
		p.name("̬�Ʒֲ�").type(SeriesType.pie);
		p.data().add(MapSeriesData("����",ed.postiveNum));
		p.data().add(MapSeriesData("����",ed.neutralNum));
		p.data().add(MapSeriesData("����",ed.negativeNum));
		return p;
	}
	
	public Map MapSeriesData(String name, double value){
		Map map = new HashMap();
		map.put("name", name);
		map.put("value", value);
		return map;
	}
	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	@Override
	public void init() throws ServletException {
		// Put your code here
	}

}
