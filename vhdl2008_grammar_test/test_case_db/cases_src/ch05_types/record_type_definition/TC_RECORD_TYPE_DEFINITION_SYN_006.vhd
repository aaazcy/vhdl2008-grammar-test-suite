-- =============================================================
-- Case ID: TC_RECORD_TYPE_DEFINITION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_RECORD_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.6
-- Production: record_type_definition ::= record element_declaration { element_declaration } end record [ record_simple_name ]
-- Case Type: Positive
-- Test Focus: Record with physical type field (time), verifying that element_subtype_definition inside element_declaration accepts physical type marks alongside scalar types
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rec_phys_ent is port(r:out integer); end entity;
architecture rec_phys_arch of rec_phys_ent is
  type t_timing is record
    setup    : time;
    hold     : time;
    clk2q    : time;
  end record t_timing;
  constant c_tco : t_timing := (setup => 2 ns, hold => 1 ns, clk2q => 3 ns);
begin
  r <= c_tco.setup / 1 ns;
end architecture rec_phys_arch;
