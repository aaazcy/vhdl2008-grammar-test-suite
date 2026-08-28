-- =============================================================
-- Case ID: TC_ELEMENT_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ELEMENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Test Focus: Element declaration: identifier_list : element_subtype_definition;
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_element_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_element_declaration_syn_s01 is
  type t_rec is record a,b:integer; c,d:bit; e:boolean; end record; signal s_ed:t_rec;
begin
  s_ed.a<=1; s_ed.b<=2; s_ed.c<='1'; s_ed.d<='0'; s_ed.e<=true; r<=s_ed.a+s_ed.b;end architecture bh;
