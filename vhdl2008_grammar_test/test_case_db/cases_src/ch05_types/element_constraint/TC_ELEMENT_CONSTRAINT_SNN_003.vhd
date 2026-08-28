-- =============================================================
-- Case ID: TC_ELEMENT_CONSTRAINT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_constraint ::= array_constraint
--              | record_constraint
-- Case Type: Negative
-- Test Focus: element_constraint must be either array_constraint
--            or record_constraint. Using a bare type_mark with
--            a range constraint (which is a scalar constraint,
--            not a composite constraint) is invalid for
--            element_constraint.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity bad_element_constraint_scalar is
  port (
    r : out integer
  );
end entity bad_element_constraint_scalar;

architecture rtl of bad_element_constraint_scalar is
  type arr_t is array (0 to 3) of integer;
  -- ERROR: element_constraint applied to scalar integer element
  -- using syntax that looks like a bare constraint, not wrapped
  -- in array_constraint or record_constraint. The element type is
  -- integer, but the constraint is attached incorrectly.
  subtype bad_arr is arr_t(open)(0 to 7);  -- nonsense constraint
  signal s : bad_arr;
begin
  r <= 0;
end architecture rtl;
