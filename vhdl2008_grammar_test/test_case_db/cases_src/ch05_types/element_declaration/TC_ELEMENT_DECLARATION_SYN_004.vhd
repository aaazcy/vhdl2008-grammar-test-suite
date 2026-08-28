-- =============================================================
-- Case ID: TC_ELEMENT_DECLARATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: element_declaration ::= identifier_list : element_subtype_definition ;
-- Case Type: Positive
-- Test Focus: element_declaration with single identifier in record type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ed_syn_single is port(dout:out integer); end entity;
architecture rtl of ed_syn_single is
  type t_rec is record id:integer; end record;
  signal s:t_rec:=(id=>0);
begin s.id<=42; dout<=s.id; end architecture;