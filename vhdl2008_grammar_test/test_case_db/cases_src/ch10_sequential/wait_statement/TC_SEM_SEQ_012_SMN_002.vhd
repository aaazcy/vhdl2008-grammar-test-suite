-- =============================================================
-- Case ID: TC_SEM_SEQ_012_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_012
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Rule Description: WAIT statement is not permitted inside a process with a sensitivity list
-- Case Type: Negative
-- Error Category: scope_visibility_error
-- Test Focus: WAIT after a sensitivity-list process definition
-- Expected Result: Triggers semantic error: scope_visibility_error
-- Dependencies: None
-- =============================================================
entity tc_sem_seq_012_smn_002 is port(r:out integer); end entity;
architecture bh of tc_sem_seq_012_smn_002 is
  signal s_a, s_b : integer := 0;
  signal s_out : integer := 0;
begin
  -- Process with both sensitivity list AND wait statement
  process(s_a) is
  begin
    if s_a = 1 then
      -- ERROR: wait in process with sensitivity list
      wait on s_b;
    end if;
    s_out <= s_a;
  end process;
  r <= s_out;
end architecture bh;
