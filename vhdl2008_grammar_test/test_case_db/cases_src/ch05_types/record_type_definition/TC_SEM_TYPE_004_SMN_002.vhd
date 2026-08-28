-- =============================================================
-- Case ID: TC_SEM_TYPE_004_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_TYPE_004
-- Standard Reference: IEEE 1076-2008 Section 5.2.6
-- Rule Description: Record element names must be unique within the record type
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Record type with duplicate element identifiers
-- Expected Result: Triggers semantic error: declaration_elaboration_error
-- Dependencies: None
-- =============================================================
entity tc_sem_type_004_smn_002 is port(r:out integer); end entity;
architecture bh of tc_sem_type_004_smn_002 is
  -- ERROR: duplicate element name "data" in record
  type t_bad_rec is record
    addr : integer;
    data : bit_vector(7 downto 0);
    data : bit_vector(15 downto 0);
  end record;
  signal s_rec : t_bad_rec;
begin
  s_rec.addr <= 16#FF#;
  r <= 1;
end architecture bh;
