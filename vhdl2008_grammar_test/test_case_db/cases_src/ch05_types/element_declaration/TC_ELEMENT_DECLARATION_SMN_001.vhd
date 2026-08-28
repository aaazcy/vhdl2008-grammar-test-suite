-- =============================================================
-- Case ID: TC_ELEMENT_DECLARATION_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_ELEMENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: element_declaration ::= identifier_list : element_subtype_definition ;
-- Case Type: Negative
-- Test Focus: static model negative -- record element type mismatch in aggregate
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity ed_smn_type_err is port(dout:out integer); end entity;
architecture rtl of ed_smn_type_err is
  type t_rec is record val:integer; end record;
  signal s:t_rec:=(val=>'A');  -- ERROR: character assigned to integer field
begin dout<=0; end architecture;