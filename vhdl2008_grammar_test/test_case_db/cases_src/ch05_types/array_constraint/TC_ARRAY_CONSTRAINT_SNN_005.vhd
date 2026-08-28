-- =============================================================
-- Case ID: TC_ARRAY_CONSTRAINT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_constraint ::= index_constraint [ array_element_constraint ] | ( open ) [ array_element_constraint ]
-- Case Type: Negative
-- Test Focus: Syntax error -- array_constraint with malformed index,
--            missing closing parenthesis in the index_constraint.
--            The parser expects a closing ) to match the opening (
--            of the index list.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity arr_con_snn_missing_paren is
end entity arr_con_snn_missing_paren;
architecture rtl of arr_con_snn_missing_paren is
  type t_vec is array (integer range <>) of integer;
  subtype t_bad is t_vec(0 to 7;  -- ERROR: missing closing )
  signal s : t_bad;
begin
end architecture rtl;
