-- =============================================================
-- Case ID: TC_INTERFACE_SIGNAL_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: INTERFACE_SIGNAL_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.3
-- Test Focus: Interface signal declaration: [signal] identifier {,identifier} : [mode] subtype_indication [bus] [:= static_expression]
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_interface_signal_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_interface_signal_declaration_syn_s01 is
  procedure p_isd(signal clk:in bit; signal data:out integer) is
  begin data<=42 when clk='1' else 0; end procedure;
  signal s_clk:bit:='0'; signal s_data:integer:=0;
begin
  p_isd(s_clk, s_data); r<=s_data;end architecture bh;
