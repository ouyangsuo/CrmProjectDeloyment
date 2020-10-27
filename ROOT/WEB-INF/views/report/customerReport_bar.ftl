<html>
<head>
    <title>销售报表-柱状图</title>
    <script src="/js/echarts/echarts-all.js"></script>
</head>
<body>
<div id="main" style="height:580px;width: 780px;margin:10px auto"></div>
<script type="text/javascript">
        // 基于准备好的dom，初始化echarts图表
        var myChart = echarts.init(document.getElementById('main'));
        var option = {
            title: {
                text: "潜在客户报表-柱状图",
                x: 'center',
                subtext: "${groupName}"
            },
            tooltip: {
                show: true
            },
            toolbox: {
                show: true,
                feature: {
                    mark: {
                        show: true
                    },
                    dataView: {
                        show: true,
                        readOnly: true
                    },
                    magicType: {
                        show: true,
                        type: ['line', 'bar']
                    },
                    restore: {
                        show: true
                    },
                    saveAsImage: {
                        show: true
                    }
                }
            },
            legend: {
                data: ['新增客户数'],
                x: 'left'
            },
            xAxis: [
                {
                    type: 'category',
                    data: ${groupTypes}
                }
            ],
            yAxis: [
                {
                    type: 'value'
                }
            ],
            series: [
                {
                    "name": "新增客户数量",
                    "type": "bar",
                    "data": ${customerNums},
                    markPoint: {
                        data: [
                            {type: 'max', name: '最大值'},
                            {type: 'min', name: '最小值'}
                        ]
                    },
                    markLine: {
                        data: [
                            {type: 'average', name: '平均值'}
                        ]
                    }
                }
            ]
        };

        // 为echarts对象加载数据
        myChart.setOption(option);
</script>
</body>
</html>
