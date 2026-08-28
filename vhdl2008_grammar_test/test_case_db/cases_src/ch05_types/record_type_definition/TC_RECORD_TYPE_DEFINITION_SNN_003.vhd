-- =============================================================
-- Case ID: TC_RECORD_TYPE_DEFINITION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_RECORD_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.6
-- Production: record_type_definition ::= record element_declaration { element_declaration } end record [ record_simple_name ]
-- Case Type: Negative
-- Test Focus: Missing colon in element_declaration — the field identifier "addr" has no colon separator before its type mark, triggering a syntax error at the missing element_subtype_definition delimiter
-- Expected Result: Triggers syntax error: missing colon after element identifier
-- Dependencies: None
-- =============================================================
entity rec_no_colon_ent is port(r:out integer); end entity;
architecture rec_no_colon_arch of rec_no_colon_ent is
  type t_bad is record
    addr integer;             -- ERROR: missing colon before type
    data : bit_vector(7 downto 0);
  end record;
  signal s_bad : t_bad;
begin
  r <= 0;
end architecture rec_no_colon_arch;
