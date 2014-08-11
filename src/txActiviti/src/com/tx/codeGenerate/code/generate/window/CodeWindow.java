package com.tx.codeGenerate.code.generate.window;

import java.awt.Dimension;
import java.awt.GridLayout;

import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JTextField;

import com.tx.codeGenerate.util.createActionListener;
import com.tx.codeGenerate.util.exitActionListener;
/**
 * 代码自动生成页面测试类
 * 
 * @author JiangBo
 *
 */
public class CodeWindow extends JFrame {
    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = 1L;
    private static String jdField_a_of_type_JavaLangString = "test";
    private static String b = "TestEntity";
    private static String c = "t00_company";
    private static String d = "分公司";
    private static int jdField_a_of_type_Int = 1;
    private static String e = "uuid";
    private static String f = "";
    String[] jdField_a_of_type_ArrayOfJavaLangString = {
            "uuid", "identity", "sequence" };

    public CodeWindow() {
        JPanel localJPanel = new JPanel();
        setContentPane(localJPanel);
        localJPanel.setLayout(new GridLayout(14, 2));
        JLabel title_Label = new JLabel("提示:");
        JLabel titleInfo_JLabel = new JLabel();
        JLabel packageName_Label = new JLabel("包名（小写）：");
        JTextField packageName_TextField = new JTextField("tx");
        JLabel entity_JLabel = new JLabel("实体类名（首字母大写）：");
        JTextField entity_TextField = new JTextField("TxTest");
        JLabel tableName_JLabel = new JLabel("表名：");
        JTextField tableName_TextField = new JTextField(20);
        JLabel keyType_Label = new JLabel("主键生成策略：");
        JComboBox keyType_ComboBox = new JComboBox(this.jdField_a_of_type_ArrayOfJavaLangString);
        JLabel keySequence_Label = new JLabel("主键SEQUENCE：(oracle序列名)");
        JTextField keySequence_TextField = new JTextField(20);
        JLabel tableNameRemark_Label = new JLabel("功能描述：");
        JTextField tableNameRemark_TextField = new JTextField("tx_test1");
        JLabel rowNumber_Label = new JLabel("行字段数目：");
        JTextField rowNumber_TextField = new JTextField();
        rowNumber_TextField.setText(String.valueOf(jdField_a_of_type_Int));
        ButtonGroup localButtonGroup = new ButtonGroup();
        JRadioButton jspDetail_RadioButton = new JRadioButton("JSP详细页面编辑模板");
        jspDetail_RadioButton.setSelected(true);
        JRadioButton jspRow_RadioButton = new JRadioButton("JSP行编辑模板");
        localButtonGroup.add(jspDetail_RadioButton);
        localButtonGroup.add(jspRow_RadioButton);
        JCheckBox action_CheckBox = new JCheckBox("Action");
        action_CheckBox.setSelected(true);
        JCheckBox jsp_CheckBox = new JCheckBox("Jsp");
        jsp_CheckBox.setSelected(true);
        JCheckBox serviceI_CheckBox = new JCheckBox("ServiceI");
        serviceI_CheckBox.setSelected(true);
        JCheckBox serviceImpl_CheckBox = new JCheckBox("ServiceImpl");
        serviceImpl_CheckBox.setSelected(true);
        JCheckBox page_CheckBox = new JCheckBox("Page");
        page_CheckBox.setSelected(true);
        JCheckBox entity_CheckBox = new JCheckBox("Entity");
        entity_CheckBox.setSelected(true);
        localJPanel.add(title_Label);
        localJPanel.add(titleInfo_JLabel);
        localJPanel.add(packageName_Label);
        localJPanel.add(packageName_TextField);
        localJPanel.add(entity_JLabel);
        localJPanel.add(entity_TextField);
        localJPanel.add(tableName_JLabel);
        localJPanel.add(tableName_TextField);
        localJPanel.add(keyType_Label);
        localJPanel.add(keyType_ComboBox);
        localJPanel.add(keySequence_Label);
        localJPanel.add(keySequence_TextField);
        localJPanel.add(tableNameRemark_Label);
        localJPanel.add(tableNameRemark_TextField);
        localJPanel.add(rowNumber_Label);
        localJPanel.add(rowNumber_TextField);
        localJPanel.add(action_CheckBox);
        localJPanel.add(jsp_CheckBox);
        localJPanel.add(serviceI_CheckBox);
        localJPanel.add(serviceImpl_CheckBox);
        localJPanel.add(page_CheckBox);
        localJPanel.add(entity_CheckBox);
        localJPanel.add(jspDetail_RadioButton);
        localJPanel.add(jspRow_RadioButton);
        // 自动代码生成按钮
        JButton createButton = new JButton("生成");
        createButton.addActionListener(new createActionListener(this, packageName_TextField, titleInfo_JLabel, entity_TextField, tableNameRemark_TextField,
                tableName_TextField, rowNumber_TextField, keyType_ComboBox, keySequence_TextField, jspDetail_RadioButton,
                jspRow_RadioButton, action_CheckBox, jsp_CheckBox, serviceI_CheckBox, serviceImpl_CheckBox,
                page_CheckBox, entity_CheckBox));
        // 退出按钮
        JButton exitButton = new JButton("退出");
        exitButton.addActionListener(new exitActionListener(this));
        localJPanel.add(createButton);
        localJPanel.add(exitButton);
        setTitle("代码生成器[单表模型]");
        setVisible(true);
        setDefaultCloseOperation(3);
        setSize(new Dimension(600, 400));
        setResizable(false);
        setLocationRelativeTo(getOwner());
    }

    public static void main(String[] paramArrayOfString) {
        try {
            new CodeWindow().pack();
        } catch (Exception localException) {
            System.out.println(localException.getMessage());
        }
    }
}
