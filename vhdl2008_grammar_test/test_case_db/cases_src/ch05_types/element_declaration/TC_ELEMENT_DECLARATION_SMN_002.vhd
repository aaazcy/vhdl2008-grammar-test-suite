-- =============================================================
-- Case ID: TC_ELEMENT_DECLARATION_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_ELEMENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: element_declaration ::= identifier_list : element_subtype_definition ;
-- Case Type: Negative
-- Test Focus: static model negative -- duplicate field names in record type
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity ed_smn_dup is port(dout:out integer); end entity;
architecture rtl of ed_smn_dup is
  type t_bad is record val:integer; val:bit; end record;  -- ERROR: duplicate field name
begin dout<=0; end architecture;