-- =============================================================
-- Case ID: TC_RECORD_TYPE_DEFINITION_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_RECORD_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.6
-- Production: record_type_definition ::= record element_declaration { element_declaration } end record [ record_simple_name ]
-- Case Type: Negative
-- Test Focus: Selected_name using dot notation on a non-record scalar signal — the base of a selected_name must be a record type, so applying ".field" to an integer triggers a semantic error about record element access on a non-composite type
-- Expected Result: Triggers semantic error: selected_name on non-record type
-- Dependencies: None
-- =============================================================
entity rec_nonrec_sel is port(r:out integer); end entity;
architecture rec_nonrec_sel_arch of rec_nonrec_sel is
  signal s_val : integer := 0;
  type t_rec is record
    field_a : integer;
    field_b : integer;
  end record t_rec;
  signal s_r : t_rec := (field_a => 1, field_b => 2);
begin
  r <= s_val.field_a;  -- ERROR: s_val is integer, not a record
end architecture rec_nonrec_sel_arch;
