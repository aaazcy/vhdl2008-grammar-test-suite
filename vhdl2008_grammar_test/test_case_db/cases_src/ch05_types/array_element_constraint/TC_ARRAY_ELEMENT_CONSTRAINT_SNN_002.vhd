-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_CONSTRAINT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_constraint ::= element_constraint
-- Case Type: Negative
-- Test Focus: array_element_constraint wrapping an array_constraint
--            with malformed index: using "downto" where a valid
--            discrete_range is needed but the keyword order is wrong
--            ("X downto 0" missing the range keyword context).
--            Specifically: misplaced comma inside index_constraint.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity bad_array_range_syntax is
  port (
    data_out : out bit
  );
end entity bad_array_range_syntax;

architecture rtl of bad_array_range_syntax is
  -- ERROR: array_constraint has malformed discrete_range:
  -- "0 to" without a right bound expression
  type malformed_array is array (0 to 7) of bit_vector(0 to);
  signal s : malformed_array;
begin
  data_out <= s(0)(0);
end architecture rtl;
