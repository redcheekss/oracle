create package pkg_ins_Promotion_info is
  --查询人员转正信息
  function QueryHireDate(UserId         in varchar2, --用户ID~~~~~~~~~~~~~~~~~~ceshi
  --z加一句测试的同步记录 这是个测试
                         HtHireDate             out Date,--入职时间
                         HtPromotionDate        out Date,--转正时间
                         GetApprovalUserList    out sys_refcursor,--审批人列表
                         ErrMsg          out varchar2) return number;
  --查询人员转正审批信息
  function QueryAfwPromotion(PromotionId         in varchar2, --转正信息ID
                             CUR_DATA_HIRE       out sys_refcursor,--转正信息 
                             CUR_DATA_APPRO_LIST out sys_refcursor,--审批流详情
                             ErrMsg          out varchar2) return number;

  --转正申请-添加 修改
  function SaveAfwPromotion(DataInfo        in varchar2, --c_promotion_id^用户id^入职日期^转正日期^岗位工作职责
                                                                   --^岗位工作职责^试用期从事得工作及取得的成绩及经验
                                                                   --^对公司管理的改善建议^未来半年的工作目标
                                      OperationUserId IN VARCHAR2,
                                      NextApproUserID out varchar2,
                                      ErrMsg          out varchar2) return number;
                                      
  --未转正员工，自己也没提转正的，在试用期结束前30天，系统应自动为其生成一个转正申请。
  function Create_ToDo_info(--DateCurrent in Date,
                            UserId_List out sys_refcursor,
                            ErrMsg          out varchar2) return number;
  --更改员工信息
  function update_user_Promotion_info(WorkFlowID in varchar2,
                            ErrMsg          out varchar2) return number;
end pkg_ins_Promotion_info;
/

