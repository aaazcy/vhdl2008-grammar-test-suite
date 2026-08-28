-- =============================================================
-- Case ID: TC_ARRAY_CONSTRAINT_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_ARRAY_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_constraint ::= index_constraint [ array_element_constraint ] | ( open ) [ array_element_constraint ]
-- Case Type: Negative
-- Test Focus: Static model negative -- array_constraint index count
--            mismatch. The base type has two dimensions but the
--            constraint supplies only one index, causing a dimension
--            mismatch at the constraint point.
-- Expected Result: Triggers dimension mismatch error
-- Dependencies: None
-- =============================================================
entity arr_con_smn_dim_mismatch is
  port ( dout : out integer );
end entity arr_con_smn_dim_mismatch;
architecture rtl of arr_con_smn_dim_mismatch is
  type t_2d is array (integer range <>, integer range <>) of integer;
  subtype t_bad is t_2d(0 to 7);  -- ERROR: needs 2 index constraints, only 1 given
  signal s : t_bad;
begin
  dout <= 0;
end architecture rtl;
