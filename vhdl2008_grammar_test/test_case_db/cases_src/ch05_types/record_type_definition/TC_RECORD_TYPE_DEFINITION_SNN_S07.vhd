-- =============================================================
-- Case ID: TC_RECORD_TYPE_DEFINITION_SNN_S07
-- Rule Type: Syntax
-- Related Rule ID: BNF_RECORD_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.6
-- Production: record_type_definition ::= record element_declaration { element_declaration } end record [ record_simple_name ]
-- Case Type: Negative
-- Test Focus: Missing "end" before "record" — the closing delimiter is written as just "record" without the mandatory "end" keyword prefix, triggering a syntax error at the production termination
-- Expected Result: Triggers syntax error: missing "end" keyword
-- Dependencies: None
-- =============================================================
entity rec_no_end_ent is port(r:out integer); end entity;
architecture rec_no_end_arch of rec_no_end_ent is
  type t_bad is record
    field_a : bit;
    field_b : bit;
  record;                     -- ERROR: missing "end" keyword
  signal s_bad : t_bad;
begin
  r <= 0;
end architecture rec_no_end_arch;
