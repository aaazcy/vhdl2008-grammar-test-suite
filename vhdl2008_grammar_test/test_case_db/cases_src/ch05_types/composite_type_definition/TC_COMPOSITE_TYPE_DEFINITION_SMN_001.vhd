-- =============================================================
-- Case ID: TC_COMPOSITE_TYPE_DEFINITION_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_COMPOSITE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.1
-- Production: composite_type_definition ::= array_type_definition | record_type_definition
-- Case Type: Negative
-- Test Focus: Static model negative: array type small_array has 4 elements (0 to 3) but the aggregate initializer provides 5 elements, so the aggregate length violates the array type definition
-- Expected Result: Triggers semantic error: too many elements associated
-- Dependencies: None
-- =============================================================
entity ctd_ent is port(q : out integer); end entity;
architecture rtl of ctd_ent is
  type small_array is array (0 to 3) of integer range 0 to 15;
  signal arr : small_array := (0, 1, 2, 3, 4);
begin
  q <= arr(0);
end architecture;
