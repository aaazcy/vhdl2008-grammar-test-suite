-- =============================================================
-- Case ID: TC_INDEX_CONSTRAINT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEX_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_constraint ::= ( discrete_range { , discrete_range } )
-- Case Type: Negative
-- Test Focus: syntax error -- index_constraint with comma but no second range
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity ic_snn_trailing is end entity;
architecture rtl of ic_snn_trailing is
  type t_2d is array(integer range <>, integer range <>) of integer;
  subtype t_bad is t_2d(0 to 7,);  -- ERROR: trailing comma without second range
begin end architecture;