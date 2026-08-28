-- =============================================================
-- Case ID: TC_ELEMENT_DECLARATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: element_declaration ::= identifier_list : element_subtype_definition ;
-- Case Type: Positive
-- Test Focus: element_declaration with identifier_list of three names sharing same subtype
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ed_syn_multi is port(dout:out integer); end entity;
architecture rtl of ed_syn_multi is
  type t_vec3 is record x,y,z:integer; end record;
  signal s:t_vec3:=(x=>0,y=>0,z=>0);
begin s.x<=1; s.y<=2; s.z<=3; dout<=s.x+s.y+s.z; end architecture;