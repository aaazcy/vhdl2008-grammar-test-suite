-- =============================================================
-- Case ID: TC_RECORD_TYPE_DEFINITION_SNN_S04
-- Rule Type: Syntax
-- Related Rule ID: BNF_RECORD_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.6
-- Production: record_type_definition ::= record element_declaration { element_declaration } end record [ record_simple_name ]
-- Case Type: Negative
-- Test Focus: Reserved word "signal" used as a record field identifier — the identifier in element_declaration's identifier_list must not be a reserved word, triggering a syntax error
-- Expected Result: Triggers syntax error: reserved word used as identifier
-- Dependencies: None
-- =============================================================
entity rec_reserved_ent is port(r:out integer); end entity;
architecture rec_reserved_arch of rec_reserved_ent is
  type t_bad is record
    signal : bit;             -- ERROR: "signal" is a reserved word
    data   : bit_vector(7 downto 0);
  end record;
  signal s_bad : t_bad;
begin
  r <= 0;
end architecture rec_reserved_arch;
