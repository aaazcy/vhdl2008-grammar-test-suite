-- =============================================================
-- Case ID: TC_RECORD_TYPE_DEFINITION_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_RECORD_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.6
-- Production: record_type_definition ::= record element_declaration { element_declaration } end record [ record_simple_name ]
-- Case Type: Negative
-- Test Focus: Record aggregate assigns an integer literal to a bit_vector field — the type mismatch between the aggregate element and the declared element subtype triggers a semantic type error
-- Expected Result: Triggers semantic error: type mismatch in record aggregate
-- Dependencies: None
-- =============================================================
entity rec_agg_type_err is port(r:out integer); end entity;
architecture rec_agg_type_err_arch of rec_agg_type_err is
  type t_status is record
    flag  : bit;
    vec   : bit_vector(3 downto 0);
    count : natural;
  end record t_status;
  signal s_stat : t_status := (flag => '1', vec => 42, count => 0);  -- ERROR: integer 42 assigned to bit_vector field
begin
  r <= s_stat.count;
end architecture rec_agg_type_err_arch;
