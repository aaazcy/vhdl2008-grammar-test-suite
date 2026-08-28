-- =============================================================
-- Case ID: TC_RECORD_TYPE_DEFINITION_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_RECORD_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.6
-- Production: record_type_definition ::= record element_declaration { element_declaration } end record [ record_simple_name ]
-- Case Type: Negative
-- Test Focus: Record element selected_name references a field name that does not exist in the record type — the identifier after the dot must match an element declared in the record, triggering a semantic error for an undeclared element
-- Expected Result: Triggers semantic error: element name not found in record type
-- Dependencies: None
-- =============================================================
entity rec_bad_field is port(r:out integer); end entity;
architecture rec_bad_field_arch of rec_bad_field is
  type t_bus is record
    addr : bit_vector(15 downto 0);
    data : bit_vector(7 downto 0);
  end record t_bus;
  signal s_bus : t_bus := (addr => X"0000", data => X"00");
begin
  s_bus.ctrl <= '1';  -- ERROR: "ctrl" is not a field of t_bus
  r <= 0;
end architecture rec_bad_field_arch;
