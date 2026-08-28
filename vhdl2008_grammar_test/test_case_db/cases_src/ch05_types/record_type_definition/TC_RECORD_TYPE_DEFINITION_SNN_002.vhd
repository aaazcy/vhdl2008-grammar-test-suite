-- =============================================================
-- Case ID: TC_RECORD_TYPE_DEFINITION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_RECORD_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.6
-- Production: record_type_definition ::= record element_declaration { element_declaration } end record [ record_simple_name ]
-- Case Type: Negative
-- Test Focus: Missing "record" keyword — the type definition begins with an identifier list but omits the mandatory record keyword, triggering a syntax error at the first element_declaration token
-- Expected Result: Triggers syntax error: missing "record" keyword
-- Dependencies: None
-- =============================================================
entity rec_no_rec_ent is port(r:out integer); end entity;
architecture rec_no_rec_arch of rec_no_rec_ent is
  type t_bad is               -- ERROR: missing "record" keyword
    addr : bit_vector(7 downto 0);
    data : bit_vector(7 downto 0);
  end record;
  signal s_bad : t_bad;
begin
  r <= 0;
end architecture rec_no_rec_arch;
