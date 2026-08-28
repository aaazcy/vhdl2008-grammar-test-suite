-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_ELEMENT_ASSOCIATION
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: element_association ::= [ choices => ] expression
-- Case Type: Negative
-- Rule Description: The index choice of a named array association must lie within the legal subscript range of the array type; an out-of-range index value is illegal
-- Error Category: index_out_of_bounds
-- Test Focus: SMN: named association index outside array bounds: 4 => 40 in an aggregate of array 0..3; index 4 is outside the declared range
-- Expected Result: Triggers semantic error: index 4 is outside array bounds (0 to 3)
-- Dependencies: None
-- =============================================================
entity ea_smn_001 is
  port (
    x : out integer
  );
end entity ea_smn_001;

architecture index_oob of ea_smn_001 is
  type t_arr is array(0 to 3) of integer;
  signal s : t_arr;
begin
  -- ERROR: index 4 is outside the declared range 0 to 3
  s <= (0 => 10, 4 => 40, others => 0);
  x <= s(0);
end architecture index_oob;
