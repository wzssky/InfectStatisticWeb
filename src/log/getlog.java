package log;

import province.Province;
import java.util.*;
import java.text.Collator;
import java.util.regex.*;
import  java.io.*;
import  java.lang.*;
public class getlog {
    public static void getAllFileName(String path,ArrayList<String> listFileName) //得到日志名字
    {
        String patterndate = "\\d+-\\d+-\\d+";
        Pattern date = Pattern.compile(patterndate); // 创建 Pattern 对象
        File file = new File(path);
        String [] names = file.list();
        if(names != null){
            String [] completNames = new String[names.length];
            for(int i=0;i < names.length;i++){
                Matcher Date = date.matcher(names[i]); // 创建 matcher 对象
                if(Date.find()) completNames[i] = Date.group(0);
            }
            listFileName.addAll(Arrays.asList(completNames));
        }
    }
    public static void InformationProcessing(String Path,List<Province> proList,Province allpro) //日志信息处理
    {
        int people;
        String pattern = ".*//.*";
        String pattern0 = "(\\d+)";
        String pattern0_1 = ".*感染患者.*";
        String pattern0_2 = ".*疑似患者.*";
        String pattern1 = ".*新增.*";
        String pattern2 = ".*流入.*";
        String pattern3 = ".*死亡.*";
        String pattern4 = ".*治愈.*";
        String pattern5 = ".*确诊感染.*";
        String pattern6 = ".*排除.*";
        Pattern number = Pattern.compile(pattern0); // 创建 Pattern 对象
        try
        {
            File file = new File(Path);
            if(!file .exists())
            {
                System.out.println("路径错误");
                System.exit(0);
            }
            BufferedReader br = new BufferedReader(new FileReader(file));
            String str = null;
            while ((str = br.readLine()) != null)
            {
                Matcher num = number.matcher(str); // 现在创建 matcher 对象
                String arrays[] = str.split(" ");
                if(Pattern.matches(pattern,str)) continue; // 跳过注释内容
                for (Province province1 : proList) {
                    if (arrays[0].equals(province1.getProvince())&&num.find())
                    {
                        people = Integer.valueOf(num.group(0));
                        if(Pattern.matches(pattern1,str)) // 新增
                        {
                            if(Pattern.matches(pattern0_1,str)) // 新增感染患者
                            {
                                province1.setIp(province1.getIp() + people);
                                allpro.setIp(allpro.getIp() + people);
                            }
                            else if(Pattern.matches(pattern0_2,str)) //新增疑似患者
                            {
                                province1.setSp(province1.getSp() + people);
                                allpro.setSp(allpro.getSp() + people);
                            }

                        }
                        else if(Pattern.matches(pattern2,str)) //从省一流入省二
                        {
                            for (Province province2 : proList) {
                                if (arrays[3].equals(province2.getProvince()))
                                {
                                    if(Pattern.matches(pattern0_1,str))
                                    {
                                        province1.setIp(province1.getIp() - people);
                                        province2.setIp(province2.getIp() + people);
                                    }
                                    else if(Pattern.matches(pattern0_2,str))
                                    {
                                        province1.setSp(province1.getSp() - people);
                                        province2.setSp(province2.getSp() + people);
                                    }
                                }
                            }
                        }
                        else if(Pattern.matches(pattern3,str)) //死亡 dead+n,ip-n
                        {
                            province1.setDead(province1.getDead() + people);
                            province1.setIp(province1.getIp() - people);
                            allpro.setDead(allpro.getDead() + people);
                            allpro.setIp(allpro.getIp() - people);
                        }
                        else if(Pattern.matches(pattern4,str)) //治愈 cure+n,ip-n
                        {
                            province1.setCure(province1.getCure() + people);
                            province1.setIp(province1.getIp() - people);
                            allpro.setCure(allpro.getCure() + people);
                            allpro.setIp(allpro.getIp() - people);
                        }
                        else if(Pattern.matches(pattern5,str)) //确诊感染 sp-n,ip+n
                        {
                            province1.setIp(province1.getIp() + people);
                            province1.setSp(province1.getSp() - people);
                            allpro.setIp(allpro.getIp() + people);
                            allpro.setSp(allpro.getSp() - people);
                        }
                        else if(Pattern.matches(pattern6,str)) //排除 sp-n
                        {
                            province1.setSp(province1.getSp() - people);
                            allpro.setSp(allpro.getSp() - people);
                        }
                    }
                }
            }
        } catch (IOException  e) {
            e.printStackTrace();
        }
    }
    public static List<Province> log(){
        String[] Provinces = { "北京","天津","上海","重庆","河北","河南","云南","辽宁","黑龙江","湖南","安徽","山东",
                "新疆","江苏","浙江","江西","湖北","广西","甘肃","山西","内蒙古","陕西","吉林","福建","贵州","广东",
                "青海","西藏","四川","宁夏","海南","台湾","香港","澳门"};
        List<Province> proList = new ArrayList<>();
        ArrayList<String> listFileName = new ArrayList<>();
        Province allpro = new Province("全国"); // 创建全国对象
        proList.add(allpro);
        for(String pro:  Provinces)
        {
            Province provin = new Province(pro);
            proList.add(provin);
        }
        getAllFileName("C:\\Users\\17782\\Desktop\\InfectStatisticWeb\\web\\log",listFileName);
        for(String name : listFileName)
        {
            InformationProcessing("C:\\Users\\17782\\Desktop\\InfectStatisticWeb\\web\\log\\"+name+".log.txt",proList,allpro);
        }
        return proList;
    }
}