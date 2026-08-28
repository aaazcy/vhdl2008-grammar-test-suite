-- =============================================================
-- Case ID: TC_ELEMENT_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ELEMENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Test Focus: Element declaration: identifier_list : element_subtype_definition; — record element declaration
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_element_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_element_declaration_syn_s01 is
  type t_rec is record a,b:integer; c,d:bit; end record; signal s_r:t_rec;
begin
  s_r.a<=1; s_r.b<=2; r<=s_r.a+s_r.b;end architecture bh;
