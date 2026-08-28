-- =============================================================
-- Case ID: TC_RECORD_TYPE_DEFINITION_SMN_4
-- Rule Type: Semantic
-- Related Rule ID: BNF_RECORD_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.6
-- Production: record_type_definition ::= record element_declaration { element_declaration } end record [ record_simple_name ]
-- Case Type: Negative
-- Test Focus: Record aggregate for a two-field record provides only one field value without OTHERS — the aggregate must supply values for all elements of the record, triggering a semantic error for an incomplete aggregate
-- Expected Result: Triggers semantic error: incomplete record aggregate
-- Dependencies: None
-- =============================================================
entity rec_incomplete_agg is port(r:out integer); end entity;
architecture rec_incomplete_agg_arch of rec_incomplete_agg is
  type t_pair is record
    lo : bit_vector(3 downto 0);
    hi : bit_vector(3 downto 0);
  end record t_pair;
  signal s_p : t_pair := (lo => "0001");  -- ERROR: missing "hi" field in aggregate
begin
  r <= 0;
end architecture rec_incomplete_agg_arch;
