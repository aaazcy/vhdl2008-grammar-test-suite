-- =============================================================
-- Case ID: TC_SEM_DECL_013_SMN_004
-- Rule Type: Semantic
-- Related Rule ID: SEM_DECL_013
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Rule Description: Component local generic names must be unique
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Component declaration with duplicate generic names
-- Expected Result: Triggers semantic error: declaration_elaboration_error
-- Dependencies: None
-- =============================================================
entity tc_sem_decl_013_smn_004 is port(r:out integer); end entity;
architecture bh of tc_sem_decl_013_smn_004 is
  -- ERROR: duplicate generic name "WIDTH" in component
  component comp_dup_gen is
    generic(WIDTH:integer:=8; DEPTH:integer:=16; WIDTH:integer:=32);
    port(x:out integer);
  end component;
  signal s_x : integer;
begin
  u_comp: comp_dup_gen port map(x=>s_x);
  r <= s_x;
end architecture bh;
