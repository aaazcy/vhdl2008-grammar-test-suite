-- =============================================================
-- Case ID: TC_INTERFACE_LIST_SYN_S01
-- Rule Type: Syntax
-- BNF Production: INTERFACE_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5
-- Test Focus: Interface list: interface_element {; interface_element} — parameter/generic/port list
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_interface_list_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_interface_list_syn_s01 is
  procedure p_il(signal a:out integer; signal b:in integer; constant c:in bit) is
  begin a<=b when c='1' else 0; end procedure; signal s_il:integer:=0;
  signal s_b:integer:=10; signal s_c:bit:='1';
begin
  p_il(s_il, s_b, s_c); r<=s_il;end architecture bh;
