-- =============================================================
-- Case ID: TC_TYPE_CONVERSION_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_TYPE_CONVERSION_ARRAY_DIM
-- Standard Reference: IEEE 1076-2008 Section 9.3.5
-- Production: type_conversion ::= type_mark ( expression )
-- Case Type: Negative
-- Rule Description: Array type conversion requires the source and target to have the same number of dimensions and compatible element types.
-- Error Category: Array dimension mismatch
-- Test Focus: SMN: array dimension mismatch — an attempt to convert a 2D array to a 1D array type; array type conversion requires matching dimensions
-- Expected Result: Triggers type error: array type conversion requires matching dimensions
-- Dependencies: None
-- =============================================================

entity ent_tc_smn_002 is
  port (y : out bit);
end entity ent_tc_smn_002;

architecture dim_mismatch of ent_tc_smn_002 is
  type t_2d is array(0 to 3, 0 to 3) of bit;
  type t_1d is array(0 to 15) of bit;
  signal s_2d : t_2d;
  signal s_1d : t_1d;
begin
  -- ERROR: Array dimension mismatch — 2D to 1D conversion not allowed
  s_1d <= t_1d(s_2d);
  y <= '0';
end architecture dim_mismatch;
