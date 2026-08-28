-- =============================================================
-- Case ID: TC_INDEX_SUBTYPE_DEFINITION_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_INDEX_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_subtype_definition ::= type_mark range <>
-- Case Type: Negative
-- Test Focus: Static model: constrained subtype of an unconstrained
--            array is indexed with a value outside the constrained
--            range. The subtype is constrained to 0..3 but index
--            7 is used.
-- Expected Result: Triggers static index bounds error
-- Dependencies: None
-- =============================================================
entity bad_unconstrained_index is
  port (
    flag : out bit
  );
end entity bad_unconstrained_index;

architecture rtl of bad_unconstrained_index is
  type vec_t is array (integer range <>) of bit;
  subtype vec4 is vec_t(0 to 3);
  signal v : vec4 := "0000";
begin
  -- ERROR: index 7 exceeds subtype range 0 to 3
  v(7) <= '1';
  flag <= v(0);
end architecture rtl;
