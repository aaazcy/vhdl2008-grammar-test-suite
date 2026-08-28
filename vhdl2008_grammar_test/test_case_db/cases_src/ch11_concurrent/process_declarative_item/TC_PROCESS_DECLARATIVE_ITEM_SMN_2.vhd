-- =============================================================
-- Case ID: TC_PROCESS_DECLARATIVE_ITEM_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_PROC_DECL_SIGNAL
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Rule Description: Signal declarations not allowed in process declarative part
-- Case Type: Negative
-- Error Category: syntax_error
-- Test Focus: SEM: signal declaration inside process declarative region
-- Expected Result: Triggers semantic error: signal not allowed in process
-- Dependencies: None
-- =============================================================
entity proc_decl_sem1_ent is port(y:out integer); end entity;
architecture bh of proc_decl_sem1_ent is
begin
  process is
    signal s_local:integer:=0;
  begin
    y<=s_local; wait;
  end process;
end architecture bh;
