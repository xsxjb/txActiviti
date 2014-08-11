package com.tx.codeGenerate.code.generate;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;

import com.tx.codeGenerate.util.CodeResourceUtil;
import com.tx.codeGenerate.util.CodeStringUtils;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

// Referenced classes of package com.code.generate:
//            ICallBack

public class CodeFactory {

    private ICallBack a;

    public CodeFactory() {
    }

    public Configuration getConfiguration() throws IOException {
        Configuration configuration = new Configuration();
        String s = getTemplatePath();
        File file = new File(s);
        configuration.setDirectoryForTemplateLoading(file);
        configuration.setLocale(Locale.CHINA);
        configuration.setDefaultEncoding("UTF-8");
        return configuration;
    }

    public void generateFile(String s, String s1, Map map) {
        try {
            String s2 = map.get("entityPackage").toString();
            String s3 = map.get("entityName").toString();
            String s4 = getCodePath(s1, s2, s3);
            String s5 = StringUtils.substringBeforeLast(s4, "/");
            Template template = getConfiguration().getTemplate(s);
            FileUtils.forceMkdir(new File((new StringBuilder(String.valueOf(s5))).append("/").toString()));
            OutputStreamWriter outputstreamwriter = new OutputStreamWriter(new FileOutputStream(s4),
                    CodeResourceUtil.SYSTEM_ENCODING);
            template.process(map, outputstreamwriter);
            outputstreamwriter.close();
        } catch (TemplateException templateexception) {
            templateexception.printStackTrace();
        } catch (IOException ioexception) {
            ioexception.printStackTrace();
        }
    }

    public static String getProjectPath() {
        String s = (new StringBuilder(String.valueOf(System.getProperty("user.dir").replace("\\", "/")))).append("/")
                .toString();
        return s;
    }

    public String getClassPath() {
        String s = Thread.currentThread().getContextClassLoader().getResource("./").getPath();
        return s;
    }

    public static void main(String args[]) {
        System.out.println(getProjectPath());
    }

    public String getTemplatePath() {
        String s = (new StringBuilder(String.valueOf(getClassPath()))).append(CodeResourceUtil.TEMPLATEPATH).toString();
        return s;
    }

    public String getCodePath(String s, String s1, String s2) {
        String s3 = getProjectPath();
        StringBuilder stringbuilder = new StringBuilder();
        if (StringUtils.isNotBlank(s)) {
            String s4 = CodeType.valueOf(s).getValue();
            stringbuilder.append(s3);
            if ("jsp".equals(s))
                stringbuilder.append(CodeResourceUtil.JSPPATH);
            else
                stringbuilder.append(CodeResourceUtil.CODEPATH);
            // 判断相等(忽略大小写)
            if ("Action".equalsIgnoreCase(s4)) {
                stringbuilder.append(StringUtils.lowerCase("action"));
            } else if ("ServiceImpl".equalsIgnoreCase(s4)) {
                stringbuilder.append(StringUtils.lowerCase("service/impl"));
            } else if ("ServiceI".equalsIgnoreCase(s4)) {
                stringbuilder.append(StringUtils.lowerCase("service"));
            } else {
                stringbuilder.append(StringUtils.lowerCase(s4));
            }
            stringbuilder.append("/");
            stringbuilder.append(StringUtils.lowerCase(s1));
            stringbuilder.append("/");
            if ("jsp".equals(s)) {
                String s5 = StringUtils.capitalize(s2);
                stringbuilder.append(CodeStringUtils.getInitialSmall(s5));
                stringbuilder.append(s4);
                stringbuilder.append(".jsp");
            } else {
                stringbuilder.append(StringUtils.capitalize(s2));
                stringbuilder.append(s4);
                stringbuilder.append(".java");
            }
        } else {
            throw new IllegalArgumentException("type is null");
        }
        return stringbuilder.toString();
    }

    public void invoke(String s, String s1) {
        Object obj = new HashMap();
        obj = a.execute();
        generateFile(s, s1, ((Map) (obj)));
    }

    public ICallBack getCallBack() {
        return a;
    }

    public void setCallBack(ICallBack icallback) {
        a = icallback;
    }

    /**
     * 枚举类
     * 
     * @author Administrator
     *
     */
    public enum CodeType {
        //注：枚举写在最前面，否则编译出错
        serviceImpl("serviceImpl", 0, "ServiceImpl"), dao("dao", 1, "Dao"), service("service", 2, "ServiceI"), action("action", 3, "Action"), page("page", 4, "Page"), entity("entity", 5, "Entity"), jsp("jsp", 6, ""), comparator("comparator", 7, "Comparator");
        // 成员变量  
        private String name;  
        private int index; 
        private String value;
        private static final CodeType codeTypes[];
        static {
            codeTypes = (new CodeType[] {serviceImpl, dao, service, action, page, entity, jsp, comparator });
        }
        public String getValue() {
            return value;
        }
        // 构造方法  
        private CodeType(String name, int index, String value) {
            this.name = name;
            this.index = index;
            this.value = value;
        }
    }
}

