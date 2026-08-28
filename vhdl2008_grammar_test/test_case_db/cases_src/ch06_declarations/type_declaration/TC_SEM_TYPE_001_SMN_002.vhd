-- =============================================================
-- Case ID: TC_SEM_TYPE_001_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_TYPE_001
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Rule Description: A type name must be unique within its declarative region
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Two types with same name in same declarative region
-- Expected Result: Triggers semantic error: declaration_elaboration_error
-- Dependencies: None
-- =============================================================
entity tc_sem_type_001_smn_002 is port(r:out integer); end entity;
architecture bh of tc_sem_type_001_smn_002 is
  type t_data is range 0 to 255;
  -- ERROR: second type with same name
  type t_data is array(0 to 7) of bit;
  signal s_val : t_data;
begin
  s_val <= (others => '0');
  r <= 1;
end architecture bh;
