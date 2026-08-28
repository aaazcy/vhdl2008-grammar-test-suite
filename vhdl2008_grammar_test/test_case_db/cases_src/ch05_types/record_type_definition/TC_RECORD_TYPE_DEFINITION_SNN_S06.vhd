-- =============================================================
-- Case ID: TC_RECORD_TYPE_DEFINITION_SNN_S06
-- Rule Type: Syntax
-- Related Rule ID: BNF_RECORD_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.6
-- Production: record_type_definition ::= record element_declaration { element_declaration } end record [ record_simple_name ]
-- Case Type: Negative
-- Test Focus: Comma instead of semicolon between element_declarations — a comma separator between two field definitions violates the element_declaration delimiter requirement, triggering a syntax error
-- Expected Result: Triggers syntax error: comma instead of semicolon between element_declarations
-- Dependencies: None
-- =============================================================
entity rec_comma_ent is port(r:out integer); end entity;
architecture rec_comma_arch of rec_comma_ent is
  type t_bad is record
    addr : bit_vector(7 downto 0),  -- ERROR: comma instead of semicolon
    data : bit_vector(7 downto 0);
  end record;
  signal s_bad : t_bad;
begin
  r <= 0;
end architecture rec_comma_arch;
