package com.eventwarning.dbutils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ReadFile {
	public static List<String> readFileByLinestoList(String fileName) {
        File file = new File(fileName);
        BufferedReader reader = null;
        List<String> list = null;
        try {
            System.out.println("����Ϊ��λ��ȡ�ļ����ݣ�һ�ζ�һ���У�");
            reader = new BufferedReader(new FileReader(file));
            list = new ArrayList<String>();
            String tempString = null;
            int line = 1;
            // һ�ζ���һ�У�ֱ������nullΪ�ļ�����
            while ((tempString = reader.readLine()) != null) {
                // ��ʾ�к�
            	int i=0;
            	String [] tempArr = tempString.split(",");
            	while(i!=tempArr.length){
            		list.add(tempArr[i]);
            		i++;
            	}
                line++;
            }
            System.out.println("�����ˣ�");
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
		return list;
    }
	/**
	 * ��ȡÿ��Ԫ�ظ���
	 */
	public static int LineElemNumsCount(String fileName){
		File file = new File(fileName);
        BufferedReader reader = null;
        int count = 0;
        try {
            System.out.println("����Ϊ��λ��ȡ�ļ����ݣ�һ�ζ�һ���У�");
            reader = new BufferedReader(new FileReader(file));
            String tempString = null;
            // һ�ζ���һ�У�ֱ������nullΪ�ļ�����
            if ((tempString = reader.readLine()) != null) {
                // ��ʾ�к�
            	String[] tempArr = tempString.split(",");
            	count = tempArr.length;
                
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
		return count;
	}
	/**
	 * ��ȡ������
	 */
	public static int LineNumsCount(String fileName){
		File file = new File(fileName);
        BufferedReader reader = null;
        int line = 0;
        try {
            System.out.println("����Ϊ��λ��ȡ�ļ����ݣ�һ�ζ�һ���У�");
            reader = new BufferedReader(new FileReader(file));
            String tempString = null;
            // һ�ζ���һ�У�ֱ������nullΪ�ļ�����
            while ((tempString = reader.readLine()) != null) {
                // ��ʾ�к�
                line++;
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
		return line;
	}
}
