package warn;

import com.eventwarning.bean.*;
import com.eventwarning.dbImpl.DBOperation;
import com.github.abel533.echarts.json.GsonOption;

import javax.xml.transform.Result;
import java.util.ArrayList;
import java.util.List;
import java.util.SortedMap;

/**
 * Created with IntelliJ IDEA.
 *
 * @Description:
 * @User: GYL
 * @Date: 2018-05-25
 * @Time: 12:52 PM
 * @Project_name: EventWarning
 */
public class test {

    public static void main(String[] args){
        KeyWord keyWord1=new KeyWord();
        KeyWord keyWord2=new KeyWord();
        KeyWord keyWord3=new KeyWord();
        keyWord1.wordType="食品";
        keyWord2.wordType="食品";
        keyWord3.wordType="食品";
        keyWord1.keyword="牛奶";
        keyWord2.keyword="冰淇淋";
        keyWord3.keyword="肉";
        List<KeyWord> keyWords=new ArrayList<>();
        DBOperation.GetKeyWord("1902117");
//        keyWords.add(keyWord1);
//        keyWords.add(keyWord2);
////        keyWords.add(keyWord3);
//
        long startTime,endTime;
//
//        startTime = System.currentTimeMillis();
//        DBOperation.GetFoodFsn(keyWords,1,10);
//
//        endTime = System.currentTimeMillis();
//        System.out.println(endTime-startTime);
//
//
//         startTime = System.currentTimeMillis();
//        DBOperation.GetFoodFsn(keyWords,1,10);
//        endTime = System.currentTimeMillis();
//        System.out.println(endTime-startTime);
        int eventid = 57531;
        Event e = DBOperation.GetEvent(eventid);
        List<KeyWord> keywords = e.getKeyWordList();
        System.out.println("------------------");
        startTime = System.currentTimeMillis();
        List<FoodFsn> fsnList = DBOperation.GetFoodFsn(keywords,0,0);
        endTime = System.currentTimeMillis();
        System.out.println(endTime-startTime);
        startTime = System.currentTimeMillis();
        List<FoodKms> kmsList = DBOperation.GetFoodKms(keywords,0,0);

        endTime = System.currentTimeMillis();
        System.out.println(endTime-startTime);
        startTime = System.currentTimeMillis();
        List<FoodLims> limsList = DBOperation.GetFoodLims(keywords,0,0);

        endTime = System.currentTimeMillis();
        System.out.println(endTime-startTime);
        javax.servlet.jsp.jstl.sql.Result rs=new javax.servlet.jsp.jstl.sql.Result() {
            @Override
            public SortedMap[] getRows() {
                return new SortedMap[0];
            }

            @Override
            public Object[][] getRowsByIndex() {
                return new Object[0][];
            }

            @Override
            public String[] getColumnNames() {
                return new String[0];
            }

            @Override
            public int getRowCount() {
                return 0;
            }

            @Override
            public boolean isLimitedByMaxRows() {
                return false;
            }
        };
        for(SortedMap a:rs.getRows()){

        }

    }
}
