-- =============================================================
-- Case ID: TC_INDEX_CONSTRAINT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEX_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_constraint ::= ( discrete_range { , discrete_range } )
-- Case Type: Negative
-- Test Focus: syntax error -- index_constraint with missing parenthesis
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity ic_snn_no_paren is end entity;
architecture rtl of ic_snn_no_paren is
  type t_vec is array(integer range <>) of integer;
  subtype t_bad is t_vec 0 to 7;  -- ERROR: missing parentheses
begin end architecture;