-- =============================================================
-- Case ID: TC_UNBOUNDED_ARRAY_DEFINITION_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_UNBOUNDED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: unbounded_array_definition ::=
--   array ( index_subtype_definition { , index_subtype_definition } )
--   of element_subtype_indication
-- Case Type: Negative
-- Test Focus: Static model: constrained subtype of an unbounded
--            array is accessed with an index exceeding the subtype
--            constraints. The subtype is 0 to 3 but index is 5.
-- Expected Result: Triggers static bounds error
-- Dependencies: None
-- =============================================================
entity bad_unbounded_subtype_index is
  port (
    err : out bit
  );
end entity bad_unbounded_subtype_index;

architecture rtl of bad_unbounded_subtype_index is
  type unbounded_vec is array (integer range <>) of bit;
  subtype vec4 is unbounded_vec(0 to 3);
  signal v : vec4 := "0000";
begin
  -- ERROR: index 5 exceeds subtype constraints 0 to 3
  v(5) <= '1';
  err <= v(0);
end architecture rtl;
