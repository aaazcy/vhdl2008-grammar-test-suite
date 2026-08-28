-- =============================================================
-- Case ID: TC_SEM_TYPE_007_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_TYPE_007
-- Standard Reference: IEEE 1076-2008 Section 5.2.2
-- Rule Description: Enumeration literal identifiers must be unique within the enumeration type definition
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Enumeration type with duplicate literal identifiers
-- Expected Result: Triggers semantic error: declaration_elaboration_error
-- Dependencies: None
-- =============================================================
entity tc_sem_type_007_smn_002 is port(r:out integer); end entity;
architecture bh of tc_sem_type_007_smn_002 is
  -- ERROR: duplicate literal "RED" in enumeration type
  type t_color is (RED, GREEN, BLUE, RED);
  signal s_color : t_color := RED;
begin
  r <= 1;
end architecture bh;
