-- =============================================================
-- Case ID: TC_RECORD_TYPE_DEFINITION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_RECORD_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.6
-- Production: record_type_definition ::= record element_declaration { element_declaration } end record [ record_simple_name ]
-- Case Type: Negative
-- Test Focus: Assignment between two structurally different record types — even if fields have compatible types, records with different type names are distinct types, triggering a type mismatch error
-- Expected Result: Triggers semantic error: type mismatch between distinct record types
-- Dependencies: None
-- =============================================================
entity rec_incompat is port(r:out integer); end entity;
architecture rec_incompat_arch of rec_incompat is
  type t_rec_a is record
    x : integer;
    y : integer;
  end record t_rec_a;
  type t_rec_b is record
    x : integer;
    y : integer;
  end record t_rec_b;
  signal s_a : t_rec_a := (x => 1, y => 2);
  signal s_b : t_rec_b;
begin
  s_b <= s_a;  -- ERROR: t_rec_a and t_rec_b are distinct record types
  r <= s_a.x;
end architecture rec_incompat_arch;
