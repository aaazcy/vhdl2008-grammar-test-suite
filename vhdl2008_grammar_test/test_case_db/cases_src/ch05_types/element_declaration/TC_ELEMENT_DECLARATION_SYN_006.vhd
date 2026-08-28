-- =============================================================
-- Case ID: TC_ELEMENT_DECLARATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: element_declaration ::= identifier_list : element_subtype_definition ;
-- Case Type: Positive
-- Test Focus: element_declaration with constrained integer subtype for each field
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ed_syn_constrained is port(dout:out integer); end entity;
architecture rtl of ed_syn_constrained is
  type t_pkt is record len:integer range 0 to 255; data:integer range -128 to 127; end record;
  signal s:t_pkt:=(len=>0,data=>0);
begin s.len<=100; s.data<=64; dout<=s.len+s.data; end architecture;