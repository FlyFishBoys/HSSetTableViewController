#  HSsetTableView用于实现设置界面的封装

1. 用模型的方式对应 cell ，sectionheader,sectionfooter, tableHeader,tableFooter
2. initwithtitle: detail: , showAccess,
3. 支持常规的cell 的样式包括右侧有图标和开关控件，titlle,detail左右对齐,上下对齐
4. 行高自动适应包括header和footer, 方便实现文字大小动态调整，cell 的子视图必须为autiolayout方式
5. 添加方式为 [ table.dataSet addSection:@[mode]],  [ table.dataSet addSectionHeader:mode], [ table.dataSet addSectionFooter:mode]
