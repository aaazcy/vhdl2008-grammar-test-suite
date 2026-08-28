-- =============================================================
-- Case ID: TC_PROCESS_DECLARATIVE_ITEM_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_PROC_DECL_SHARED
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Rule Description: Shared variable declaration not allowed in process
-- Case Type: Negative
-- Error Category: syntax_error
-- Test Focus: SMN: shared variable inside process declarative part
-- Expected Result: Triggers semantic error: shared variable not allowed in process
-- Dependencies: None
-- =============================================================
entity proc_decl_smn1_ent is port(y:out integer); end entity;
architecture bh of proc_decl_smn1_ent is
begin
  process is
    shared variable sv:integer:=0;
  begin
    y<=sv; wait;
  end process;
end architecture bh;
