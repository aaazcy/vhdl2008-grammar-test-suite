-- =============================================================
-- Case ID: TC_CONSTRAINED_ARRAY_DEFINITION_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_CONSTRAINED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: constrained_array_definition ::=
--   array index_constraint of element_subtype_indication
-- Case Type: Negative
-- Test Focus: Static model negative: assignment to a constrained
--            array element using an index that is statically out
--            of the declared bounds (0 to 3), accessed at index 4.
-- Expected Result: Triggers static index bounds error
-- Dependencies: None
-- =============================================================
entity bad_constrained_index is
  port (
    q : out integer
  );
end entity bad_constrained_index;

architecture rtl of bad_constrained_index is
  type small_buf is array (0 to 3) of integer range 0 to 15;
  signal buf : small_buf := (0, 1, 2, 3);
begin
  -- ERROR: index 4 exceeds the declared range 0 to 3
  buf(4) <= 10;
  q <= buf(0);
end architecture rtl;
