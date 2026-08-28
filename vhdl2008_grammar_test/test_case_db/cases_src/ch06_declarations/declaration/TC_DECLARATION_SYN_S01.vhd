-- =============================================================
-- Case ID: TC_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.1
-- Test Focus: Declaration: type/subtype/object/component/alias/attribute/subprogram/use/group — all declarative forms
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_declaration_syn_s01 is
  type t_d is range 0 to 255; subtype t_ds is t_d range 0 to 15; signal s_d:t_d:=0;
begin
  r<=integer(s_d)+1;end architecture bh;
