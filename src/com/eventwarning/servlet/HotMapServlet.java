package com.eventwarning.servlet;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eventwarning.bean.Event;
import com.eventwarning.dbImpl.DBOperation;
import com.github.abel533.echarts.RoamController;
import com.github.abel533.echarts.code.Orient;
import com.github.abel533.echarts.code.SeriesType;
import com.github.abel533.echarts.code.Trigger;
import com.github.abel533.echarts.code.X;
import com.github.abel533.echarts.code.Y;
import com.github.abel533.echarts.json.GsonOption;
import com.github.abel533.echarts.series.MarkPoint;
import com.github.abel533.echarts.style.ItemStyle;
public class HotMapServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public HotMapServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//List<Map> locationdata = DBOperation.GetLocationEvent();		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;character=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		String keyword = "";
		if(request.getParameter("skey")!=null)
			keyword = request.getParameter("skey");
		GsonOption hotmapoption = HotMapOption(LocationChina, keyword);
		
		response.getWriter().write(hotmapoption.toString());
		//request.setAttribute("hotmapoption", hotmapoption.toString());
		
		//ServletContext servletContext = getServletContext();
		//RequestDispatcher dispather = servletContext.getRequestDispatcher("/hotmap.jsp");
		//dispather.forward(request, response);
		
	}
	public static String LocationChina[]={"����","���","�ӱ�","ɽ��","���ɹ�","����","����","������",
			"�Ϻ�","����","�㽭","����","����","����","ɽ��","����","����","����","�㶫","����","����ʡ",
			"����","�Ĵ�","����","����","����","����","����","�ຣ","����","�½�","���","����","̨��",//};
	//public static String CitiesChina[] = {
		"������","�����","ʯ��ׯ��","��ɽ��","�ػʵ���","������","��̨��","������","�żҿ���",
		"�е���","������","�ȷ���","��ˮ��","̫ԭ��","��ͬ��","��Ȫ��","������","������","˷����","������","�˳���",
		"������","�ٷ���","������","���ͺ�����","��ͷ��","�ں���","�����","ͨ����","������˹��","���ױ�����",
		"�����׶���","�����첼��","�˰���","���ֹ�����","��������","������","������","��ɽ��","��˳��","��Ϫ��",
		"������","������","Ӫ����","������","������","�̽���","������","������","��«����","������",
		"������","��ƽ��","��Դ��","ͨ����","��ɽ��","��ԭ��","�׳���","�ӱ߳�����������","��������",
		"���������","������","�׸���","˫Ѽɽ��","������","������","��ľ˹��","��̨����","ĵ������","�ں���",
		"�绯��","���˰������","�Ϻ���","�Ͼ���","������","������","������","������","��ͨ��","���Ƹ���","������",
		"�γ���","������","����","̩����","��Ǩ��","������","������","������","������","������","������",
		"����","������","��ɽ��","̨����","��ˮ��","�Ϸ���","�ߺ���","������","������","��ɽ��",
		"������","ͭ����","������","��ɽ��","������","������","������","������","������","������",
		"������","������","������","������","������","������","Ȫ����","������","��ƽ��","������",
		"������","�ϲ���","��������","Ƽ����","�Ž���","������","ӥ̶��","������","������","�˴���",
		"������","������","������","�ൺ��","�Ͳ���","��ׯ��","��Ӫ��","��̨��","Ϋ����","������",
		"̩����","������","������","������","������","������","�ĳ���","������","������","֣����",
		"������","������","ƽ��ɽ��","������","�ױ���","������","������","�����","�����","�����",
		"����Ͽ��","������","������","������","�ܿ���","פ�����","�人��","��ʯ��","ʮ����","�˲���",
		"�差��","������","������","Т����","������","�Ƹ���","������","������","��ʩ����������������",
		"��ũ��","��ɳ��","������","��̶��","������","������","������","������","�żҽ���","������",
		"������","������","������","¦����","��������������������","������","�ع���","������","�麣��",
		"��ͷ��","��ɽ��","������","տ����","ï����","������","������","÷����","��β��","��Դ��",
		"������","��Զ��","��ݸ��","��ɽ��","������","������","�Ƹ���","������","������","������",
		"������","������","���Ǹ���","������","�����","������","��ɫ��","������","�ӳ���","������",
		"������","������","������","������","�ɶ���","�Թ���","��֦����","������","������","������",
		"��Ԫ��","������","�ڽ���","��ɽ��","�ϳ���","üɽ��","�˱���","�㰲��","������","�Ű���",
		"������","������","���Ӳ���Ǽ��������","���β���������","��ɽ����������","������","����ˮ��","������"
		,"��˳��","ͭ�ʵ���","ǭ���ϲ���������������","�Ͻڵ���","ǭ�������嶱��������","ǭ�ϲ���������������",
		"������","������","��Ϫ��","��ɽ��","��ͨ��","������","˼é��","�ٲ���","��������������",
		"��ӹ���������������","��ɽ׳������������","��˫���ɴ���������","�������������","�º���徰����������",
		"ŭ��������������","�������������","������","��������","ɽ�ϵ���","�տ������","��������","�������",
		"��֥����","������","ͭ����","������","������","μ����","�Ӱ���","������","������","������","������",
		"������","��������","�����","������","��ˮ��","������","��Ҵ��","ƽ����","��Ȫ��","������","������",
		"¤����","���Ļ���������","���ϲ���������","������","��������","��������������","���ϲ���������",
		"���ϲ���������","�������������","��������������","�����ɹ������������","������","ʯ��ɽ��","������",
		"��ԭ��","������","��³ľ����","����������","��³������","���ܵ���","��������������","���������ɹ�������",
		"���������ɹ�������","�����յ���","�������տ¶�����������","��ʲ����","�������","���������������","���ǵ���",
		"����̩����","ʯ������","��������","ͼľ�����","�������","����ر�������","�����ر�������"
	};
	public GsonOption HotMapOption(String provinces[], String keyword){
		//List<Event> elist = DBOperation.GetAllEventsByLocation("0" ,keyword);
		//System.out.println("readed " + elist.size());
		GsonOption option = new GsonOption();
		Arrays.sort(provinces);
		List<Integer> counts = new ArrayList();
		int maxCount=0, minCount=Integer.MAX_VALUE;
		for(int i=0; i<provinces.length; i++){
			
//			int count = 0;
//			for(int j=0;j<elist.size(); j++){
//				if(elist.get(j).location.toString().contains(provinces[i]))
//					count++;
//			}
			int count = DBOperation.GetProvinceCount(provinces[i], keyword);
			if(count>maxCount)
				maxCount = count;
			if(count<minCount)
				minCount = count;
			counts.add(count);
		}
		
		option.title().text("�ȵ��¼���������ͳ��չʾ").subtext("ȫ������").x(X.center);
		option.tooltip().trigger(Trigger.item);
		option.legend().orient(Orient.vertical).x(X.left).data().add("�¼���");
		
		option.dataRange().min(minCount);
		option.dataRange().max(maxCount);
		option.dataRange().x(X.left).y(Y.bottom).text("��","��").calculable(true);
		
		RoamController rcontroller = new RoamController();
		rcontroller.show(true).x(X.right).mapTypeControl("china",true);
		
		com.github.abel533.echarts.series.Map series 
			= new com.github.abel533.echarts.series.Map();
		series.name("�¼���").type(SeriesType.map).mapType("china").roam(false);
		series.selectedMode("single");
		ItemStyle istyle = new ItemStyle();
		istyle.normal().label().show(true);
		istyle.emphasis().label().show(true);
		series.itemStyle(istyle);
		for(int i=0; i<provinces.length; i++)
			series.data().add(this.MapSeriesData(provinces[i],counts.get(i)));
		
//		com.github.abel533.echarts.series.Map top5 
//				= new com.github.abel533.echarts.series.Map();
//		top5.name("Top5").type(SeriesType.map).mapType("china");
		MarkPoint mp = new MarkPoint();
		mp.symbol("emptyCircle");
		mp.effect().show(true).shadowBlur(0);
		ItemStyle tstyle = new ItemStyle();
		tstyle.normal().label().show(false);
		mp.itemStyle(tstyle);
//		for(int i=high; i<5; i++){
//			Event e = (Event)locationdata.get(i).get("event");
//			String location = e.location.split(" ")[0];
//			int count = (Integer)locationdata.get(i).get("count");
//			mp.data().add(MapSeriesData(location, count));
//		}
//		top5.markPoint(mp);
//		series.markPoint(mp);
		
		option.series(series);
		return option;
	}
	
	public Map MapSeriesData(String name, int value){
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
	public void init() throws ServletException {
		// Put your code here
	}
}