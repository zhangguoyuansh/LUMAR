var DATATABLES_CONSTANT = {

    // datatables常量
    DATA_TABLES : {
        DEFAULT_OPTION : { // DataTables初始化选项
        	oLanguage : {
                sProcessing : "processing...",
                sLengthMenu : "Show _MENU_ entries",//"显示 _MENU_ 项结果,",
                sZeroRecords : "no match",
                sInfo : "Showing _START_ to _END_ of _TOTAL_ entries",
                sInfoEmpty : "Showing 0 to 0 of 0 entries",
                sInfoFiltered :"",// "(由 _MAX_ 项结果过滤)",
                sInfoPostFix : "",
                sSearch : "&nbsp;&nbsp;&nbsp;&nbsp;Seaerch:",
                sUrl : "",
                sEmptyTable : "table is empty",
                sLoadingRecords : "loading...",
                sInfoThousands : ",",
                oPaginate : {
                    sFirst : "homepage",
                    sPrevious : "previous page",
                    sNext : "next page",
                    sLast : "last page"
                },
                "oAria" : {
                    "sSortAscending" : ": Sort Ascending",
                    "sSortDescending" : ": Sort Descending"
                }
            },
            //bStateSave : true,
            bStateSave : true,
            // 禁用自动调整列宽
            autoWidth : false,
            // 为奇偶行加上样式，兼容不支持CSS伪类的场合
            stripeClasses : [ "odd", "even" ],
            // 取消默认排序查询,否则复选框一列会出现小箭头
            //order : [],
            // 隐藏加载提示,自行处理
            processing : false,
            // 禁用服务器端分页
            //serverSide : true,
            // 使用原生搜索
            searching : true,
            //自定义布局
            sDom:'rt<"bottom"lfpi<"clear">>',//定义分页等 的布局 f:过滤 p 分页 i 信息 l 每页数据量
        },
        COLUMN : {
            // 复选框单元格
            CHECKBOX : {
                className: "td-checkbox",
                orderable : false,
                bSortable : false,
                width:"30px",
                data : "id",
                render : function(data, type, row, meta) {
                    var content = '<input type="checkbox" name="checkList" class="group-checkable" value="' + data + '" />';
                    return content;
                }
            }
        },
        // 常用render可以抽取出来，如日期时间、头像等
        RENDER : {
            ELLIPSIS : function(data, type, row, meta) {
                data = data || "";
                return '<span title="' + data + '">' + data + '</span>';
            }
        }
    }


};
