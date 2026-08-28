-- =============================================================
-- Case ID: TC_SUBTYPE_DECLARATION_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_SUBTYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: subtype_declaration ::= subtype identifier is subtype_indication ;
-- Case Type: Negative
-- Test Focus: static model negative -- subtype used as base for another subtype with invalid constraint
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity sd_smn_nested is port(dout:out integer); end entity;
architecture rtl of sd_smn_nested is
  subtype t_small is integer range 0 to 3;
  subtype t_bad is t_small range 10 to 15;  -- ERROR: constraint outside base range
begin dout<=0; end architecture;