-- =============================================================
-- Case ID: TC_INTERFACE_CONSTANT_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: INTERFACE_CONSTANT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.3
-- Test Focus: Interface constant declaration: [constant] identifier {,identifier} : [in] subtype_indication [:= static_expression]
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_interface_constant_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_interface_constant_declaration_syn_s01 is
  procedure p_icd(constant c:in integer:=0; signal s:out integer) is
  begin s<=c*2; end procedure; signal s_icd:integer:=0;
begin
  p_icd(c=>21, s=>s_icd); r<=s_icd;end architecture bh;
