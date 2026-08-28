-- =============================================================
-- Case ID: TC_ALIAS_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ALIAS_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.6
-- Test Focus: Alias declaration: alias alias_designator [subtype_indication] is name [signature]; — object/subprogram/enum literal aliases
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_alias_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_alias_declaration_syn_s01 is
  signal s_clk:bit:='0'; alias a_clk is s_clk;
  function f_dbl(x:integer) return integer is begin return x*2; end function;
  alias a_dbl is f_dbl[integer return integer];
begin
  r<=a_dbl(21);end architecture bh;
