-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_CONSTRAINT_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_ARRAY_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_constraint ::= element_constraint
-- Case Type: Negative
-- Test Focus: Static model negative: element constraint at array
--            dimension boundary — array is declared with range 0 to 3
--            but element subtype range is narrower (1 to 2), causing
--            constrained-element bounds to be violated when assigning
--            the full outer range index that maps outside the inner
--            element valid range.
-- Expected Result: Triggers static bounds/range error at elaboration
-- Dependencies: None
-- =============================================================
entity element_constraint_bounds_err is
  port (
    flag : out bit
  );
end entity element_constraint_bounds_err;

architecture rtl of element_constraint_bounds_err is
  subtype narrow_element is integer range 1 to 2;
  type arr4 is array (0 to 3) of narrow_element;
  constant C_BAD : arr4 := (0, 1, 2, 3);  -- ERROR: 0 and 3 exceed element range 1 to 2
begin
  flag <= '1';
end architecture rtl;
