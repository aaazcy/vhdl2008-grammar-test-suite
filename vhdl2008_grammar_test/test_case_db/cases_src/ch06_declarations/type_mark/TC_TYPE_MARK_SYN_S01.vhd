-- =============================================================
-- Case ID: TC_TYPE_MARK_SYN_S01
-- Rule Type: Syntax
-- BNF Production: TYPE_MARK
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Test Focus: Type mark: type_name ｜ subtype_name — references to type/subtype in declarations
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_type_mark_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_type_mark_syn_s01 is
  type t_tm is range 0 to 127; subtype t_tms is t_tm range 0 to 63;
  signal s_tm1:t_tm:=0; signal s_tm2:t_tms:=0;
begin
  s_tm1<=100; s_tm2<=50; r<=integer(s_tm1)+integer(s_tm2);end architecture bh;
