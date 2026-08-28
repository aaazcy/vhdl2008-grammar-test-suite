-- =============================================================
-- Case ID: TC_INDEX_CONSTRAINT_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEX_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_constraint ::= ( discrete_range { , discrete_range } )
-- Case Type: Negative
-- Test Focus: syntax error -- index_constraint for 2D array with only 1 constraint given
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity ic_snn_dim_err is end entity;
architecture rtl of ic_snn_dim_err is
  type t_2d is array(integer range <>, integer range <>) of integer;
  subtype t_bad is t_2d(0 to 7);  -- ERROR: need 2 constraints, only 1 provided
begin end architecture;