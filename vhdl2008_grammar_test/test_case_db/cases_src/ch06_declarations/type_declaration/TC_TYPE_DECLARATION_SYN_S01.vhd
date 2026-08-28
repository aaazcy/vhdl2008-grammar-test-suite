-- =============================================================
-- Case ID: TC_TYPE_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Test Focus: Type declaration: type identifier is type_definition; — all user-defined type declarations
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_type_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_type_declaration_syn_s01 is
  type t_td is range 0 to 63; type t_td2 is (LOW,MID,HIGH);
  signal s_td1:t_td:=0; signal s_td2:t_td2:=LOW;
begin
  s_td1<=63; r<=integer(s_td1);end architecture bh;
