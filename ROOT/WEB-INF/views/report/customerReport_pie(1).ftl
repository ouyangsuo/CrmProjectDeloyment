
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
            title : {
                text: '潜在客户报表-饼状图',
                subtext: '${groupName}',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient : 'vertical',
                x : 'left',
                data:${groupTypes}
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {
                        show: true,
                        type: ['pie', 'funnel'],
                        option: {
                            funnel: {
                                x: '25%',
                                width: '50%',
                                funnelAlign: 'left',
                                max: ${customerNums}
                            }
                        }
                    },
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            series : [
                {
                    name:'新增客户数',
                    type:'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:${datas}
                }
            ]
        };

        // 为echarts对象加载数据
        myChart.setOption(option);
</script>
</body>
</html>
